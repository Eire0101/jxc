package com.i.controller;

import com.i.entity.Emp;
import com.i.service.EmpService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/emp")
public class EmpController {

    @Resource
    private EmpService empService;

    @RequestMapping("/selectAllEmp")
    @ResponseBody
    public List<Map> selectAllEmp(){
        return empService.selectAllEmp();
    }

    @RequestMapping("/addEmp")
    public void addEmp(Emp emp){
        empService.addEmp(emp);
    }

    @RequestMapping("/delEmp")
    @ResponseBody
    public void delEmp(Integer empid){
        empService.delEmp(empid);
    }

    @RequestMapping("/selEmpById")
    @ResponseBody
    public Emp selEmpById(Integer empid){
        return empService.selEmpById(empid);
    }

    @RequestMapping("/updateEmp")
    @ResponseBody
    public void updateEmp(Emp emp){
        System.out.println(emp);
        empService.updateEmp(emp);
    }
}
