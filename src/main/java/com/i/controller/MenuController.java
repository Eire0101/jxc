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

    //查询菜单
    @RequestMapping("/selectMenu")
    @ResponseBody
    public List<Map> selectMenu(HttpSession session){
        UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
        return menuService.selectMenu(userInfo.getUserid());
    }

    //跳转至采购申请页面
    @RequestMapping("/toPurApply")
    public String toPurApply(){
        return "rear/buyIn";
    }

    //跳转至订单管理页面
    @RequestMapping("/toOrderManage")
    public String toOrderManage(){
        return "rear/ordermanage";
    }

    //跳转至商品页面
    @RequestMapping("/toGoods")
    public String toGoods(){
        return "rear/goods";
    }

    //跳转至员工页面
    @RequestMapping("/toUser")
    public String toUser(){
        return "rear/personalManager";
    }

    //跳转至管理员页面
    @RequestMapping("/toAdminUser")
    public String toAdminUser(){
        return "rear/adminpersonalManager";
    }

    //跳转至供应商页面
    @RequestMapping("/toSupplier")
    public  String toSupplier(){
        return "rear/supplier";
    }

    //跳转至库存页面
    @RequestMapping("/toInventory")
    public  String toInventory(){
        return  "rear/inventory";
    }

    //跳转至客户页面
    @RequestMapping("/toClient")
    public String toClient(){
        return "rear/Client";
    }

    //跳转至客户等级页面
    @RequestMapping("/toClientLevel")
    public String toClientLevel(){
        return "rear/ClientLevel";
    }

}
