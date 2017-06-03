package com.movie.os.controller;

import com.movie.os.model.UserInfoEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

/**
 * Created by Kevin on 2017/5/7.
 */
public class BaseController {

    //当前时间戳
    public final Integer nowTimeValue = new Integer(Long.toString(System.currentTimeMillis()/1000));
    public Integer nowDateValue ;

    public Date nowTime = new Date(System.currentTimeMillis());
    public BaseController(){
//        try
//        {
//            //获得当前日期戳
////            Date date = new Date();
////            String dateString = new SimpleDateFormat("yyyy-MM-dd ").format(date);
////            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
////            Date date1 = sdf.parse(dateString);
////            this.nowDate = new Integer(Long.toString(date1.getTime()/1000));
//
//        }catch (ParseException e)
//        {
//            System.out.println(e.getMessage());
//        }
    }

    /**利用MD5进行加密
     * @param str  待加密的字符串
     * @return  加密后的字符串
     * @throws NoSuchAlgorithmException  没有这种产生消息摘要的算法
     * @throws UnsupportedEncodingException
     */
    public String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        //确定计算方法
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串
        String newstr = base64en.encode(md5.digest(str.getBytes("utf-8")));
        return newstr;
    }

    /** 前置操作 **/
    @ModelAttribute
    public void init(ModelMap model, HttpSession httpSession){
        UserInfoEntity userInfo = (UserInfoEntity)httpSession.getAttribute("UserInfo");
        model.addAttribute("UserInfo",userInfo);
    }


}
