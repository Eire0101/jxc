package com.i.service;

import com.i.entity.Goods;

import java.util.List;
import java.util.Map;

public interface GoodsService {
    /**
     * 查询所有商品信息(包含类型表)
     * @return
     */
    public List<Map> selAllGoods();

    /**
     * 删除一条商品信息(
     * @return
     */
    public void deleteGoods(String goodsno);

    /**
     * 添加一条商品信息
     * @return
     */
    public void addGoods(Goods goods);

    /**
     * 修改一条商品信息
     * @return
     */
    public void updateGoods(Goods goods);
}
