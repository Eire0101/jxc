package com.i.controller;

import com.i.service.StorageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sre")
public class StorageController {

    @Resource
    private StorageService storageService;

    /**
     * 生成入库编号
     * @return
     */
    @RequestMapping("/getSreCount")
    @ResponseBody
    public String getSrcCount(){
        String No = "Sre";
        int count = storageService.getStorageCount() + 1;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        No += sdf.format(new Date());
        if(count < 10){
            No += "000" + count;
        }else if(count < 100){
            No += "00" + count;
        }else if(count < 1000){
            No += "0" + count;
        }else{
            No += count;
        }
        return No;
    }

    /**
     * 商品入库
     * @param json
     * @return
     */
    @RequestMapping("/setSreOrder")
    @ResponseBody
    public String setSreOrder(@RequestBody Map json){
        return storageService.addSreTotalDetail(json);
    }
}
