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

    /**
     * 去销售人员增删改查
     * @return
     */
    @RequestMapping("/toSlm")
    public String toSlm(){
        return "rear/showslm";
    }
    /**
     * 去采购入库
     * @return
     */
    @RequestMapping("/toOrderHandler")
    public String toOrderHandler(){
        return "rear/orderhandler";
    }

    /**
     * 去采购退货
     * @return
     */
    @RequestMapping("/toOrderReturn")
    public String toOrderReturn(){
        return "rear/orderreturn";
    }
}
