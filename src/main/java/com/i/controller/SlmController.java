package com.i.controller;

import com.github.pagehelper.PageInfo;
import com.i.entity.Slm;
import com.i.service.SlmService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/slm")
public class SlmController {

    @Resource
    private SlmService slmService;

    /**
     * 生成销售人员编号
     * @return
     */
    @RequestMapping("/generateNo")
    @ResponseBody
    public String generateNo(){
        String No = "NO";
        int count = slmService.getSlmCount() + 1;
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
     * 查询所有销售人员列表
     * @return
     */
    @RequestMapping("/selAllSlm")
    @ResponseBody
    public PageInfo selAllSlm(PageInfo pageInfo){
        return slmService.selAllSlm(pageInfo);
    }

    /**
     * 添加销售人员
     */
    @RequestMapping("/addSlm")
    @ResponseBody
    public void addSlm(Slm slm){
        System.out.println(slm);
        slmService.addSlm(slm);
    }

    /**
     * 删除销售人员
     * @param slmid
     */
    @RequestMapping("/delSlm")
    @ResponseBody
    public void delSlm(Integer slmid){
        slmService.delSlm(slmid);
    }

    /**
     * 修改销售人员
     * @param slm
     */
    @RequestMapping("/updateSlm")
    @ResponseBody
    public void updateSlm(Slm slm){
        slmService.updateSlm(slm);
    }
}
