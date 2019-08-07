package com.i.service.Impl;

import com.i.dao.EmpDao;
import com.i.entity.Emp;
import com.i.service.EmpService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class EmpServiceImpl implements EmpService {

    @Resource
    private EmpDao empDao;

    @Override
    public List<Map> selectAllEmp() {
        return empDao.selectAllEmp();
    }

    @Override
    public void addEmp(Emp emp) {
        empDao.addEmp(emp);
    }

    @Override
    public void delEmp(Integer empid) {
        empDao.delEmp(empid);
    }

    @Override
    public Emp selEmpById(Integer empid) {
        return empDao.selEmpById(empid);
    }

    @Override
    public void updateEmp(Emp emp) {
        empDao.updateEmp(emp);
    }
}
