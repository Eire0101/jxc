package com.i.controller;

import com.i.service.SaleService;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sale")
public class SaleController {

    @Resource
    private SaleService saleService;

    @RequestMapping("/getSaleCount")
    @ResponseBody
    public String getPurCount(){
        int count = saleService.getSaleCount() + 1;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String purno = null;
        if(count < 10){
            purno = "Sal" + sdf.format(new Date()) + "000" + count;
        }else if(count < 100){
            purno = "Sal" + sdf.format(new Date()) + "00" + count;
        }else if(count < 1000){
            purno = "Sal" + sdf.format(new Date()) + "0" + count;
        }else{
            purno = "Sal" + sdf.format(new Date()) + count;
        }
        return purno;
    }

    @RequestMapping("/submitForm")
    @ResponseBody
    public String submitForm(@RequestBody Map map){
        System.out.println(map);
        System.out.println(map.get("goodsarr"));
        boolean flag = saleService.addSale(map);
        if(flag) {
            return "true";
        }else{
            return "false";
        }
    }

    @RequestMapping("/selAllSale")
    @ResponseBody
    public List<Map> selAllSale(){
        return saleService.selAllSale();
    }

    @RequestMapping("/selSaleDetailBySaleno")
    @ResponseBody
    public List<Map> selSaleDetailBySaleno(String saleno){
        return saleService.selSaleDetailBySaleno(saleno);
    }

    @RequestMapping("/th")
    @ResponseBody
    public String th(Integer saledid,String goodsno,Integer saleamount,String saleno){
        saleService.updateSaleBack(saledid);
        saleService.updateSaleTotalStatus(saleno);
        Integer inv = saleService.queryInv(goodsno);
        inv += saleamount;
        saleService.updateInv(inv,goodsno);
        return "成功";
    }
}
