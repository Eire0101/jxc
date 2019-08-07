package com.i.controller;

import com.i.entity.Client;
import com.i.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class ClientController {
    @Autowired
    private ClientService clientService;

    @RequestMapping("/selectClient")
    @ResponseBody
    public List<Map> selectClient() {
        return clientService.selectClient();
    }


    @RequestMapping("/addClient")
    @ResponseBody
    public String addClient(Client client) {
        //调用service添加
     clientService.addClient(client);
        return "添加成功";
    }
    @RequestMapping("/delClient")
    @ResponseBody
    public String delClient(int custid) {
        clientService.delClient(custid);

        return "ture";

    }
}
