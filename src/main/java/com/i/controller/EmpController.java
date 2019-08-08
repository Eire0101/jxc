package com.i.controller;

<<<<<<< HEAD
import com.i.entity.Emp;
import com.i.service.EmpService;
import org.springframework.stereotype.Controller;
=======
import com.fasterxml.jackson.databind.util.BeanUtil;
import com.i.entity.Emp;
import com.i.service.EmpService;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
>>>>>>> 111
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
<<<<<<< HEAD
import java.util.List;
import java.util.Map;
=======
import java.lang.reflect.InvocationTargetException;
import java.util.*;
>>>>>>> 111

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
