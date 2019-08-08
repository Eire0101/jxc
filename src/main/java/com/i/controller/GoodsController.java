package com.i.controller;


import com.i.entity.Goods;
import com.i.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Resource
    private GoodsService goodsService;


    @RequestMapping("/seachAllGoods")
    @ResponseBody
    public List<Map> seachAllGoods(@RequestParam(value = "queryName",required = false)String queryName){
        return goodsService.seachAllGoods(queryName);
    }
    //查询商品信息

    @RequestMapping("/selAllGoods")
    @ResponseBody
    public List<Map> selAllGoods(){
        return goodsService.selAllGoods();
    }


    //删除一条商品信息
    @RequestMapping("/deleteGoods")
    @ResponseBody
    public String deleteGoods(String goodsno){
        goodsService.deleteGoods(goodsno);
        return "true";
    }

    //添加一条商品信息
    @RequestMapping("/addGoods")
    @ResponseBody
    public String addGoods(Goods goods){
        goodsService.addGoods(goods);
        return "true";
    }

    //修改一条商品信息
    @RequestMapping("/updateGoods")
    @ResponseBody
    public String updateGoods(Goods goods){
        goodsService.updateGoods(goods);
        return "true";
    }


}
