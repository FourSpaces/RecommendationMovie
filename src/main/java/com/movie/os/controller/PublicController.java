package com.movie.os.controller;

import com.movie.os.repository.LoginRecordRepository;
import com.movie.os.repository.UserInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.movie.os.model.*;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;


/**
 * Created by Kevin on 2017/5/4.
 */
/*
*   公共类用来处理登录注册 等通用请求
* */
@Controller
@RequestMapping("/public")
public class PublicController extends BaseController {

    @Autowired
    UserInfoRepository userInfoRepository;

    @Autowired
    LoginRecordRepository loginRecordRepository;

    //登录
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@RequestParam(value = "requesturl", defaultValue = "") String requesturl, ModelMap model,HttpSession httpSession) {
        //获得当前用户信息
        UserInfoEntity doctorInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");
        if(doctorInfo != null){
            return "redirect:/user/info";
        }
        if(!requesturl.equals("")){
            model.addAttribute("requesturl","?requesturl="+requesturl);
        }else{
            model.addAttribute("requesturl","");
        }


        return "user/login";
    }
    //登录验证
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginPost(@ModelAttribute("user") UserInfoEntity userInfoEntity,@RequestParam(value = "requesturl", defaultValue = "") String requesturl, ModelMap model, HttpSession httpSession ,HttpServletRequest request)throws NoSuchAlgorithmException, UnsupportedEncodingException {

        //查询对应工号的信息
        List<UserInfoEntity> userInfoList = userInfoRepository.findByUsername(userInfoEntity.getUsername());

        if(userInfoList.size() >= 1){
            UserInfoEntity staff = userInfoList.get(0);
            //进行大小转换
            //staffInformation.setPassword(staffInformation.getPassword().toUpperCase()); ;
            //对密码做一个MD5加密，进行验证
            if(this.EncoderByMd5(userInfoEntity.getPassword()).equals(staff.getPassword())){
                //获取用户信息，用户类型暂存到session中，进行权限方面的设置
                httpSession.setAttribute("UserInfo", staff);
                //request
                LoginRecordEntity loginRecor = new LoginRecordEntity();
                loginRecor.setIp(request.getRemoteAddr());
                loginRecor.setUid(staff.getUid()+"");
                loginRecor.setLoginTime(this.nowTime);
                loginRecordRepository.saveAndFlush(loginRecor);

                if(!requesturl.equals("")){
                    return "redirect:"+requesturl;
                }else{
                    return "redirect:/user/info";
                }
            }else{
                //提示用户信息错误
                return"redirect:/public/login?errot=0&requesturl="+requesturl;
            }
        }
        else{
            //用户名不存在，需要重新输入
            return"redirect:/public/login?errot=1&requesturl="+requesturl;
        }

    }




    //注册
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "user/register";
    }

    //注册验证
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPost(@ModelAttribute("userinfo") UserInfoEntity userInfoEntity , ModelMap model) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        //对密码进行处理
        userInfoEntity.setPassword(this.EncoderByMd5(userInfoEntity.getPassword()));
        //对日期进行处理
        userInfoEntity.setRegTime(this.nowTime);
        // 数据库中添加一个用户，并立即刷新缓存
        userInfoEntity = userInfoRepository.saveAndFlush(userInfoEntity);

        //if 没有问题就跳转到主页

        return "redirect:/public/login";
    }

    //注销用户
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(ModelMap model, HttpSession httpSession){
        //删除session
        httpSession.invalidate();
        return"redirect:/public/login";
    }

}
