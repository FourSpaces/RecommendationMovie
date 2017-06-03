package com.movie.os.controller;

import com.movie.os.model.MovieInfoEntity;
import com.movie.os.model.MovieScoreEntity;
import com.movie.os.model.UserInfoEntity;
import com.movie.os.repository.MovieScoreRepository;
import com.movie.os.repository.UserInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Kevin on 2017/5/24.
 */
@Controller
@RequestMapping("/api")
public class ApiController {

    @Autowired
    MovieScoreRepository movieScoreRepository;
    @Autowired
    UserInfoRepository userInfoRepository;

    @RequestMapping(value = "/moviescore/list/{mid}", method =  RequestMethod.GET , produces = "application/json")
    public @ResponseBody Page<MovieScoreEntity> getMovieScore(@ModelAttribute("mid") Integer mid, @RequestParam(value = "p", defaultValue = "0") Integer page){

        Page<MovieScoreEntity> movieListPage = null;
        try
        {
            Sort sort = new Sort(Sort.Direction.DESC, "time");
            Pageable pageable = new PageRequest(page, 10, sort);
            //获得电影信息
            movieListPage = movieScoreRepository.findByMid(mid,pageable);

        }catch (ParseException e)
        {
            System.out.println(e.getMessage());
        }
        return movieListPage;
    }

    @RequestMapping(value = "/moviescore/user/{uid}", method =  RequestMethod.GET , produces = "application/json")
    public @ResponseBody UserInfoEntity getMovieScore(@ModelAttribute("uid") Integer uid){
        UserInfoEntity userinfo = userInfoRepository.findOne(uid);

        return userinfo;
    }

}

    /**
     34.     * 建立查询条件
     35.     * @author liuxg
     36.     * @date 2016年3月30日 下午2:04:39
     37.     */
//     private class MySpec implements Specification<MovieScoreEntity> {
//         @Override
//         public Predicate toPredicate(Root<Task> root, CriteriaQuery<?> query, CriteriaBuilder cb) {}
//
//
//        }
