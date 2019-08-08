package com.i.controller;


import com.i.entity.Supplier;
import com.i.service.SupplierService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sup")
public class SupplierController {
    @Resource
    public SupplierService supplierService;
    @RequestMapping("/selectAllSup")
    @ResponseBody
    public List<Map> selectAllSup()
    {
        return supplierService.selectAllSup();
    }
    @RequestMapping("/delSup")
    @ResponseBody
    public void delSup(Integer supid){
        supplierService.delSup(supid);
    }
    @RequestMapping("/selSupById")
    @ResponseBody
    public Supplier selSupById(Integer supid){
        return supplierService.selSupById(supid);
    }
    @RequestMapping("/updateSup")
    @ResponseBody
    public void updateEmp(Supplier supplier){
        System.out.println(supplier);
        supplierService.updateSup(supplier);
    }
    @RequestMapping("/addSup")
    public void addSup(Supplier supplier){
        supplierService.addSup(supplier);
    }
}
