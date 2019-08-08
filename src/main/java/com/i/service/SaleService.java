package com.i.service;

import java.util.List;
import java.util.Map;

public interface SaleService {

    public boolean addSale(Map map);

    public int getSaleCount();

    public List<Map> selAllSale();

    public List<Map> selSaleDetailBySaleno(String saleno);

    public void updateSaleBack(Integer saledid);

    public Integer queryInv(String goodsno);

    public void updateInv(Integer inv,String goodsno);

    public void updateSaleTotalStatus(String saleno);
}
