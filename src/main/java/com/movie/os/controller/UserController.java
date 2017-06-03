package com.movie.os.controller;

import com.movie.os.model.*;
import com.movie.os.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/5/24.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    UserInfoRepository userInfoRepository;
    @Autowired
    LoginRecordRepository loginRecordRepository;
    @Autowired
    MovieScoreRepository movieScoreRepository;
    @Autowired
    MovieInfoRepository movieInfoRepository;
    @Autowired
    SearchRepository searchRepository;

    //个人信息
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public String userinfo(ModelMap model, HttpSession httpSession) {
        //获得当前用户信息
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");

        model.addAttribute("doctorInfo",doctorInfo);

        return "user/userinfo";
    }

    @RequestMapping(value = "/info", method = RequestMethod.POST)
    public String userinfoPost(@ModelAttribute("user") UserInfoEntity userInfoEntity,  ModelMap model, HttpSession httpSession) {
        //获得当前用户信息
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");
        //更新用户信息
        userInfoRepository.updateUI(userInfoEntity.getUsername(),userInfoEntity.getNickname(),this.nowTime,doctorInfo.getUid());
        //userInfoRepository.updateUI("v1000@163.com00","彼岸琉璃--",this.nowTime,1000);
        UserInfoEntity doctor = userInfoRepository.findOne(doctorInfo.getUid());
        httpSession.setAttribute("UserInfo", doctor);

        return "redirect:/user/info";
    }


    //更改密码
    @RequestMapping(value = "/edit/password", method = RequestMethod.GET)
    public String editpassword() {
        return "user/editpassword";
    }

    @RequestMapping(value = "/edit/password", method = RequestMethod.POST)
    public String editPasswordPost(@RequestParam(value="password", required=false) String password ,@RequestParam(value="nowpassword1", required=false) String nowpassword1 , @RequestParam(value="nowpassword2", required=false) String nowpassword2 ,   ModelMap model, HttpSession httpSession)throws NoSuchAlgorithmException, UnsupportedEncodingException {
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");

        if(this.EncoderByMd5(password).equals(doctorInfo.getPassword())){
            if(nowpassword1.equals(nowpassword2) && !nowpassword1.equals("")){
                userInfoRepository.updatePassword(this.EncoderByMd5(nowpassword1).toString(),doctorInfo.getUid());
            }else{
                return "redirect:/user/edit/password?tab=1";
            }
        }
        //删除session
        httpSession.invalidate();
        return"redirect:/public/login";
    }

    //我的记录record
    //登陆记录
    @RequestMapping(value = "/record/login", method = RequestMethod.GET)
    public String loginrecord(@RequestParam(value = "p", defaultValue = "0") Integer page, ModelMap model, HttpSession httpSession) {
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");

        Sort sort = new Sort(Sort.Direction.DESC, "loginTime");
        Pageable pageable = new PageRequest(page, 20, sort);
        //获取登录记录
        Page<LoginRecordEntity> loginRecordList = loginRecordRepository.findByUid(doctorInfo.getUid()+"",pageable);

        model.addAttribute("loginList",loginRecordList);

        return "user/recordlogin";
    }

    //评分记录
    @RequestMapping(value = "/record/score", method = RequestMethod.GET)
    public String scorerecord(@RequestParam(value = "p", defaultValue = "0") Integer page, ModelMap model, HttpSession httpSession) {
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");
        //获得评分记录
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, 20, sort);

        List<MovieInfoEntity> movieInfoList = null;
        List<Integer> midlist = new ArrayList<Integer>();
        Page<MovieScoreEntity> movieScorePage = movieScoreRepository.findByUid(doctorInfo.getUid(),pageable);
        //遍历查询数据
        for(MovieScoreEntity movieScore:movieScorePage.getContent()){
            midlist.add(movieScore.getMid());
        }
        //
        List<MovieInfoEntity> movieinfolist = movieInfoRepository.findByMidIn(midlist);
        Map<Integer,String> mvInfoList =  new HashMap<Integer,String>();
        for(MovieInfoEntity movieInfo:movieinfolist){
            mvInfoList.put(movieInfo.getMid(),movieInfo.getName());
        }



        model.addAttribute("movieScorePage",movieScorePage);
        model.addAttribute("mvInfoList",mvInfoList);
        return "user/recordscore";
    }
    //搜索记录
    @RequestMapping(value = "/record/search", method = RequestMethod.GET)
    public String searchrecord(@RequestParam(value = "p", defaultValue = "0") Integer page, ModelMap model, HttpSession httpSession) {
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");
        //获得评分记录
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, 20, sort);

        Page<SearchEntity> movieScorePage = searchRepository.findByUid(doctorInfo.getUid(),pageable);
        model.addAttribute("movieScorePage",movieScorePage);

        return "user/recordsearch";
    }


    //推荐配置
    @RequestMapping(value = "/referral/configure", method = RequestMethod.GET)
    public String referralconfigure( ModelMap model, HttpSession httpSession) {
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");
        UserInfoEntity info = userInfoRepository.findOne(doctorInfo.getUid());

        String remark = info.getRemark();
        if(remark!=null&&!remark.equals("")){
            String[] remarkArray = remark.split(",");
            model.addAttribute("remarkArray",remarkArray);
        }else{
            String[] remarkArray = {"-1","-1","-1"};
            model.addAttribute("remarkArray",remarkArray);
        }


        return "user/referralconfigure";
    }
    @RequestMapping(value = "/referral/configure", method = RequestMethod.POST)
    public String referralconfigurepost(@RequestParam(value = "like", defaultValue = "-1") Integer like ,@RequestParam(value = "year", defaultValue = "-1") Integer year ,@RequestParam(value = "gyfs", defaultValue = "-1") Integer gyfs , ModelMap model, HttpSession httpSession){
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");
        String remark = like+","+year+","+gyfs;
        userInfoRepository.updateRemark(remark,doctorInfo.getUid());
        return "redirect:/user/referral/configure";
    }

}
