package com.i.service.Impl;

import com.i.dao.SupplierDao;
import com.i.entity.Supplier;
import com.i.service.SupplierService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class SupplierServiceImpl implements SupplierService {
    @Resource
    public SupplierDao supplierDao;
   @Override
    public List<Map> selectAllSup (){
        return supplierDao.selectAllSup();
    }
    @Override
    public void delSup(Integer supid) {
        supplierDao.delSup(supid);
    }
    @Override
    public Supplier selSupById(Integer supid) {
      return supplierDao.selSupById(supid);
    }
    @Override
    public void updateSup(Supplier supplier) {
        supplierDao.updateSup(supplier);
    }
    @Override
    public void addSup(Supplier supplier) {
        supplierDao.addSup(supplier);
    }
}
