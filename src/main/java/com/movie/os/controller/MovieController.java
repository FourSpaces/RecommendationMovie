package com.movie.os.controller;

import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;
import com.movie.os.model.*;
import com.movie.os.repository.*;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by Kevin on 2017/5/24.
 */
@Controller
public class MovieController extends BaseController {

    @Value("${rdmovie}")
    private String rdmovie;


    @Autowired
    MovieInfoRepository movieInfoRepository;
    @Autowired
    MovieScoreRepository movieScoreRepository;
    @Autowired
    RecommendValueRepository recommendValueRepository;
    @Autowired
    DictionaryRepository dictionaryRepository;
    @Autowired
    SearchRepository searchRepository;


    //电影库
    @RequestMapping(value = "/mvCinema", method = RequestMethod.GET)
    public String cinemas(@RequestParam(value = "p", defaultValue = "0") Integer page,@RequestParam(value = "s", defaultValue = "9") Integer size, @RequestParam(value = "sort", defaultValue = "scoreitem") String scortvalue,@RequestParam(value = "tag", defaultValue = "") String tag,@RequestParam(value = "search", defaultValue = "") String search,HttpSession httpSession, ModelMap model) {
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");
        //获得标签信息
        List<DictionaryEntity> taglist =  dictionaryRepository.findByParent(1);

        Sort sort = new Sort(Sort.Direction.DESC, scortvalue);
        Pageable pageable = new PageRequest(page, size, sort);

        Page<MovieInfoEntity> movieListPage = null;
        //判断请求中的tag 信息
        if(!tag.equals("")){
            //获得电影信息
            movieListPage = movieInfoRepository.findByTagLike("%"+tag+"%",pageable);
        }else if(!search.equals("")){
            movieListPage = movieInfoRepository.findByNameLike("%"+search+"%",pageable);
            SearchEntity searchEntity = new SearchEntity();
            searchEntity.setKeyword(search);
            searchEntity.setUid(0);
            searchEntity.setTime(this.nowTime);
            if(doctorInfo != null){
                searchEntity.setUid(doctorInfo.getUid());
            }
            searchRepository.saveAndFlush(searchEntity);

        }
        else{
            //获得电影信息
            movieListPage = movieInfoRepository.findAll(pageable);
        }

        model.addAttribute("movieListPage",movieListPage);
        model.addAttribute("moviePageProperty",scortvalue);
        model.addAttribute("taglist",taglist);

        model.addAttribute("tag",tag);
        model.addAttribute("search",search);

        return "cinemas";
    }

    //电影详情页
    @RequestMapping(value = "/mvDetails/{mid}", method = RequestMethod.GET)
    public String MovieDetails(@ModelAttribute("mid") Integer mid, ModelMap model, HttpSession httpSession) {
        //获得当前用户信息
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");
        if(doctorInfo != null){
            //获取当前用户的评分数据
            MovieScoreEntity moviescore = movieScoreRepository.findByMidAndUid(mid,doctorInfo.getUid());
            model.addAttribute("moviescore",moviescore);
        }

        //获取电影详情数据
        MovieInfoEntity movieinfo = movieInfoRepository.findByMid(mid);

        model.addAttribute("movieinfo",movieinfo);
        return "singlepage";
    }


    //电影评分默认
    @RequestMapping(value = "/mvScore", method = RequestMethod.GET)
    public String MovieScore(@RequestParam(value = "p", defaultValue = "0") Integer page, ModelMap model) {

        //获得最受欢迎的电影
        Sort sort = new Sort(Sort.Direction.DESC, "scoreitem");
        Pageable pageable = new PageRequest(page, 10, sort);

        //获得电影信息
        Page<MovieInfoEntity> movieListPage = movieInfoRepository.findAll(pageable);
        model.addAttribute("movieListPage",movieListPage);

        return "moviescore";
    }

    //电影评分
    @RequestMapping(value = "/mvScore/{mid}/{score}", method = RequestMethod.GET)
    public String MovieScore(@ModelAttribute("mid") Integer mid, @ModelAttribute("score") Integer score, @RequestParam(value = "sid", defaultValue = "0") Integer sid,HttpSession httpSession, ModelMap model){

        //获得用户id
        //获得当前用户信息
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");
        //查询电影评分对象
        MovieScoreEntity moviescoreTest =  movieScoreRepository.findByMidAndUid(mid,doctorInfo.getUid());
        //生成电影评分对象
        MovieScoreEntity movieScore = new MovieScoreEntity();
        movieScore.setMid(mid);
        movieScore.setScore(score);
        movieScore.setUid(doctorInfo.getUid());
        movieScore.setTime(this.nowTime);

        if(sid.equals(0) && moviescoreTest == null){
            movieScore = movieScoreRepository.saveAndFlush(movieScore);
        }else{
            movieScore.setSid(moviescoreTest.getSid());
            movieScoreRepository.updateMS(movieScore.getMid(),movieScore.getUid(),movieScore.getScore(),movieScore.getTime(),movieScore.getSid());
        }

        //model.addAttribute("movieScore",movieScore);

        return"redirect:/mvDetails/"+mid;
    }

    //推荐电影
    @RequestMapping(value = "/mvRecommended", method = RequestMethod.GET)
    public String MovieRecommended(ModelMap model, HttpSession httpSession) {
        //获得当前用户信息
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");
        Double pages = (Double  )httpSession.getAttribute("UserRecommendedPage");
        //httpSession.setAttribute("UserInfo", staff);
        //获取用户session 信息
        int page = 0;

        if(pages != null){
            Random random = new Random();
            page = random.nextInt(pages.intValue());
        }

        int size = 7;
        try {
            List<Integer> ryMovie = new ArrayList<Integer>();
            String[] nameclassList =  {"","travel","tele"};

            //获得热门电影
            JSONArray ja = JSONArray.fromObject(this.rdmovie);
            for(int i = 0;i < 2;i++){
                Random random = new Random();
                int value = random.nextInt(ja.size());
                String test = ja.getJSONObject(value).getString("mid").replace("[\"","").replace("\"]","");
                ryMovie.add(Integer.parseInt(test));
            }

            //获得推荐电影
            Sort sort = new Sort(Sort.Direction.DESC, "score");
            Pageable pageable = new PageRequest(page, size, sort);
            System.out.print(doctorInfo.getUid()+"");
            //获得电影信息
            Page<RecommendValueEntity> recommendPage = recommendValueRepository.findByUid(doctorInfo.getUid()+"",pageable);
            for(RecommendValueEntity item : recommendPage.getContent()){
                ryMovie.add(Integer.parseInt(item.getMid()));
            }
            httpSession.setAttribute("UserRecommendedPage", Math.floor(recommendPage.getTotalPages()/4));

            List<MovieInfoEntity> MovieList = movieInfoRepository.findByMidIn(ryMovie);

            model.addAttribute("MovieList",MovieList);
            model.addAttribute("nameclassList",nameclassList);


        } catch (JsonIOException e) {
            e.printStackTrace();
        } catch (JsonSyntaxException e) {
            e.printStackTrace();
        }


        return "movierecommended";
    }

}

