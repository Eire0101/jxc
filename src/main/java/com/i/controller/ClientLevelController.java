package com.i.controller;

import com.github.pagehelper.PageInfo;
import com.i.entity.Client;
import com.i.entity.UserInfo;
import com.i.service.ClientLevelService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class ClientLevelController {
    @Resource
    private ClientLevelService clientLevelService;
    @RequestMapping("/selectClientLevel")
    @ResponseBody
    public List<Map> selectClientLevel()
    {
        return  clientLevelService.queryClientLevel();
    }
    @RequestMapping("/selectClientLevel2")
    @ResponseBody
    public List<Map> selectClientLevel2()
    {
        return  clientLevelService.queryClientLevel2();
    }

    @RequestMapping("/queryClientLevel")
    @ResponseBody
    public PageInfo queryClientLevel(HttpSession session, PageInfo pageInfo){
        UserInfo info=(UserInfo)session.getAttribute("userInfo");
        return clientLevelService.quertClientLevel(pageInfo);
    }

    @RequestMapping("/updateClientLevel")
    @ResponseBody
    public String updateClientLevel( Client client){
        System.out.println(client);
        clientLevelService.updateClientLevel(client);
         return "true";
    }
}


