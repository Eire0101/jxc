package com.i.service;

import com.i.entity.Supplier;

import java.util.List;
import java.util.Map;

public interface SupplierService {
    public List<Map> selectAllSup();
    public void delSup(Integer supid);
    public Supplier selSupById(Integer supid);
    public void updateSup(Supplier supplier);
    public void addSup(Supplier supplier);
}
