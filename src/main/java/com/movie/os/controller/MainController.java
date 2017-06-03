package com.movie.os.controller;

import com.google.gson.*;
import com.movie.os.model.MovieInfoEntity;
import com.movie.os.repository.MovieInfoRepository;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Random;


/**
 * Created by Kevin on 2017/4/25.
 */
@Controller
public class MainController {
    private static JsonGenerator jsonGenerator = null;
    private static ObjectMapper objectMapper = null;
    @Value("${rdmovie}")
    private String rdmovie;
    @Value("${tbmovie}")
    private String tbmovie;

    @Autowired
    MovieInfoRepository movieInfoRepository;

    //首页
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index( ModelMap model) {
        //获得热门电影
        try {
            List<Integer> ryMovie = new ArrayList<Integer>();
            String[] nameclassList =  {"","travel","tele"};

           //JSONObject jb = JSONObject.fromObject(this.rdmovie);
            JSONArray ja = JSONArray.fromObject(this.rdmovie);
            JSONArray tagJson = JSONArray.fromObject(this.tbmovie);
            for(int i = 0;i < 6;i++){
                Random random = new Random();
                int value = random.nextInt(ja.size());
                //rmMovie += ","+ja.getJSONObject(value).getString("mid");
                String test = ja.getJSONObject(value).getString("mid").replace("[\"","").replace("\"]","");
                ryMovie.add(Integer.parseInt(test));
            }

            List<MovieInfoEntity> RYMovie = movieInfoRepository.findByMidIn(ryMovie);

            model.addAttribute("rymovie",RYMovie);
            model.addAttribute("tagJson",tagJson);
            model.addAttribute("nameclassList",nameclassList);


        } catch (JsonIOException e) {
            e.printStackTrace();
        } catch (JsonSyntaxException e) {
            e.printStackTrace();
        }
        //获得周榜电影

        return "index";
    }


    //电影详情页
    @RequestMapping(value = "/mvDetails", method = RequestMethod.GET)
    public String MovieDetails() {
        return "singlepage";
    }

    //测试页面
    @RequestMapping(value = "/static/index", method = RequestMethod.GET)
    public String staticIndex() {
        return "static/index";
    }
}
