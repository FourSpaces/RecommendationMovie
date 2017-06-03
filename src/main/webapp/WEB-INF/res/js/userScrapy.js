/**
 * Created by Kevin on 2017/5/30.
 */
$(document).ready(function(){

    errotList =["用户信息错误","用户名不存在"];
    //获取url中的参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值
    }

    var errotValue =  getUrlParam("errot");
    if(errotValue!= null){
        alert(errotList[errotValue]);
    }
});