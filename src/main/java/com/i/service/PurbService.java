package com.i.service;

import com.i.entity.PurB;

import java.util.List;
import java.util.Map;

public interface PurbService {

    /**
     * 获取退货表的数据有多少行
     * @return
     */
    public int getCountBack();

    /**
     * 生成计数
     * @return
     */
    public String generateNo();

    /**
     * 查询所有未退货的商品
     * @return
     */
    public List<Map> queryAllSre();

    /**
     * 添加退货单
     * @return
     */
    public int addBPur(PurB purB);
}
