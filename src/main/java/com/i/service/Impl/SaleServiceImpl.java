package com.i.service.Impl;

import com.i.dao.PurbDao;
import com.i.dao.SaleDao;
import com.i.service.SaleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class SaleServiceImpl implements SaleService {

    @Resource
    private SaleDao saleDao;
    @Resource
    private PurbDao purbDao;

    @Override
    public boolean addSale(Map map) {
        int num = saleDao.addSaleTotal(map);
        int num2 = saleDao.addSaleDetail((List<Map>) map.get("goodsarr"));
        return (num > 0 && num2 > 0);
    }

    @Override
    public int getSaleCount() {
        return saleDao.getSaleCount();
    }

    @Override
    public List<Map> selAllSale() {
        return saleDao.selAllSale();
    }

    @Override
    public List<Map> selSaleDetailBySaleno(String saleno) {
        return saleDao.selSaleDetailBySaleno(saleno);
    }

    @Override
    public void updateSaleBack(Integer saledid) {
        saleDao.updateSaleBack(saledid);
    }

    @Override
    public Integer queryInv(String goodsno) {
        return purbDao.queryInv(goodsno);
    }

    @Override
    public void updateInv(Integer inv,String goodsno) {
        purbDao.updateInv(inv,goodsno);
    }

    @Override
    public void updateSaleTotalStatus(String saleno) {
        List<Map> isbacklist = saleDao.selAllSaleBack(saleno);
        Iterator it = isbacklist.listIterator();
        int count = 0;
        int total = 0;
        while(it.hasNext()){
            Map map = (Map)it.next();
            String isback = (String) map.get("isback");
            if("退货".equals(isback)){
                count++;
            }
            total++;
        }
        if(count == total){
            saleDao.updateStatus("全部退货",saleno);
        }else if(count > 0){
            saleDao.updateStatus("部分退货",saleno);
        }
    }
}
