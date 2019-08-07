package com.i.controller;

import com.i.entity.UserInfo;
import com.i.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/menu")
public class MenuController {
    @Resource
    private MenuService menuService;

    @RequestMapping("/selectMenu")
    @ResponseBody
    public List<Map> selectMenu(HttpSession session){
        UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
        return menuService.selectMenu(userInfo.getUserid());
    }

    @RequestMapping("/toPurApply")
    public String toPurApply(){
        return "rear/buyIn";
    }

    @RequestMapping("/toOrderManage")
    public String toOrderManage(){
        return "rear/ordermanage";
    }

    @RequestMapping("/toGoods")
    public String toGoods(){
        return "rear/goods";
    }

    @RequestMapping("/toUser")
    public String toUser(){
        return "rear/personalManager";
    }

    @RequestMapping("/toAdminUser")
    public String toAdminUser(){
        return "rear/adminpersonalManager";
    }
}
