package com.i.service;

import com.i.entity.Emp;

import java.util.List;
import java.util.Map;

public interface EmpService {

    /**
     * 查询所有员工
     */
    public List<Map> selectAllEmp();

    /**
     * 添加员工
     */
    public void addEmp(Emp emp);

    /**
     * 删除员工
     */
    public void delEmp(Integer empid);

    /**
     * 根据id查询员工信息
     */
    public Emp selEmpById(Integer empid);

    /**
     * 根据id修改员工信息
     */
    public void updateEmp(Emp emp);
}
