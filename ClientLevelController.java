package com.i.controller;

import com.i.entity.Client;
import com.i.service.ClientLevelService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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


    @RequestMapping("/updateClientLevel")
    @ResponseBody
    public String updateClientLevel( Client client){
        System.out.println(client);
        clientLevelService.updateClientLevel(client);
         return "true";
    }
}


