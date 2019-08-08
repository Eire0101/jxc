package com.i.controller;

import com.i.service.PurService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/pur")
public class PurController {

    @Resource
    private PurService purService;

    @RequestMapping("/getPurCount")
    @ResponseBody
    public String getPurCount(){
        int count = purService.getPurCount() + 1;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String purno = null;
        if(count < 10){
            purno = "NO" + sdf.format(new Date()) + "000" + count;
        }else if(count < 100){
            purno = "NO" + sdf.format(new Date()) + "00" + count;
        }else if(count < 1000){
            purno = "NO" + sdf.format(new Date()) + "0" + count;
        }else{
            purno = "NO" + sdf.format(new Date()) + count;
        }
        return purno;
    }

    @RequestMapping("/submitForm")
    @ResponseBody
    public String submitForm(@RequestBody Map map){
        boolean flag = purService.addPur(map);
        if(flag) {
            return "true";
        }else{
            return "false";
        }
    }

    @RequestMapping("/selAllPurOrder")
    @ResponseBody
    public List<Map> selAllPurOrder(){
        return purService.selAllPurOrder();
    }

    @RequestMapping("/selAllPurDetail")
    @ResponseBody
    public List<Map> selAllPurDetail(){
        return purService.selAllPurDetail();
    }

    @RequestMapping("/sh")
    @ResponseBody
    public String sh(String purno,String purstatus){
        purService.sh(purno,purstatus);
        return "成功";
    }

    @RequestMapping("/getPageCount")
    @ResponseBody
    public int getPageCount(Integer pagesize){

        //总数 - 页数 * 每页容量 > 0 则 + 1 页 因为除法是向下取整
        if (0 < purService.getPageCount() - (purService.getPageCount() / pagesize) * pagesize){
            return purService.getPageCount() / pagesize + 1;
        }else if(purService.getPageCount() == 0){
            return 0;
        }else{
            return purService.getPageCount() / pagesize;
        }
    }

    @RequestMapping("/tgshQuery")
    @ResponseBody
    public List<Map> tgshQuery(Integer currpage,Integer pagesize){
        //当前条数index
        Integer currIndex = (currpage - 1) * pagesize;
        return purService.tgshQuery(currIndex,pagesize);
    }

    /**
     * 根据purno获取订单详情
     */
    @RequestMapping("/getPurDetailBypurno")
    @ResponseBody
    public List<Map> getPurDetailBypurno(String purno){
        return purService.getPurDetailBypurno(purno);
    }
}
