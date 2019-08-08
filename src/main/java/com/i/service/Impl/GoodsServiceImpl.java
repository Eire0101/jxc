package com.i.service.Impl;

import com.i.dao.GoodsDao;

import com.i.entity.Goods;
import com.i.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Resource
    private GoodsDao goodsDao;

    @Override
    public List<Map> selAllGoods() {
        return goodsDao.selAllGoods();
    }


    @Override
    public void deleteGoods(String goodsno) {
        goodsDao.deleteGoods(goodsno);
    }

    @Override
    public void addGoods(Goods goods) {
        goodsDao.addGoods(goods);
    }

    @Override
    public void updateGoods(Goods goods) {
        goodsDao.updateGoods(goods);
    }
    @Override
    public List<Map> seachAllGoods(String queryName) {
        return goodsDao.seachAllGoods(queryName);
    }
}
