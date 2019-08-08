package com.i.controller;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.i.entity.PurB;
import com.i.service.PurbService;
import org.apache.commons.beanutils.BeanMap;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/purb")
public class PurbController {

    @Resource
    private PurbService purbService;

    @ResponseBody
    @RequestMapping("/queryAllSre")
    public List<Map> queryAllSre(){
        return purbService.queryAllSre();
    }

    @ResponseBody
    @RequestMapping("/th")
    public void th(@RequestBody Map map) throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {
        Map map1 = (Map)map.get("purb");
        PurB purb = new PurB();
        purb.setPurbno(purbService.generateNo());
        purb.setBoperator("张三");
        purb.setConsignee((String) map1.get("consignee"));
        purb.setBgoodsno((String) map1.get("bgoodsno"));
        purb.setBgoodstype((String) map1.get("bgoodstype"));
        purb.setBgoodsamount((Integer) map1.get("bgoodsamount"));
        purb.setPurno((String) map1.get("purno"));
        purb.setStorageno((String) map1.get("storageno"));
        purbService.addBPur(purb);
    }
}
