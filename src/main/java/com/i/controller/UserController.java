package com.i.controller;

import com.i.entity.UserInfo;
import com.i.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("/login")
    @ResponseBody
    public String login(UserInfo userInfo,HttpSession session){
        if(userService.login(userInfo) != null){
            session.setAttribute("userInfo",userService.login(userInfo));
            return "登录成功";
        }else{
            return "登录失败";
        }
    }

    @RequestMapping("/toback")
    public String toback(HttpSession session){
        return "rear/backIndex";
    }

    //查询用户个人信息(普工)
    @RequestMapping("/selectUser")
    @ResponseBody
    public List<Map> selectUser(String telphone,HttpSession session){
         UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
        return  userService.selectUser(userInfo.getTelphone());
    }

    //普工对个人信息的修改
    @RequestMapping("/updateUser")
    @ResponseBody
    public String updateUser(UserInfo userInfo){
        userService.updateUser(userInfo);
        return "true";
    }

    //管理员对个人信息的查询
    @RequestMapping("/queryUser")
    @ResponseBody
    public List<Map> queryUser(){
        return userService.queryUser();
    }

    //管理员对个人信息的增加
    @RequestMapping("/addUser")
    @ResponseBody
    public String addUser(UserInfo userInfo){
        userService.addUser(userInfo);
        return "true";
    }


    //管理员对个人信息的删除
    @RequestMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(String userno){
        userService.deleteUser(userno);
        return "true";
    }

    //管理员对个人信息的修改
    @RequestMapping("/updateUser2")
    @ResponseBody
    public String updateUser2(UserInfo info){
        userService.updateUser2(info);
        return "true";
    }
}
