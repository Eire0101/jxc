package com.i.dao;

import com.i.entity.Goods;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface GoodsDao {
    //查询商品基本信息
    @Select("select * from tab_goods join tab_goodstype on tab_goods.typeid = tab_goodstype.typeid")
    public List<Map> selAllGoods();

    //删除商品
    @Delete("delete from tab_goods where goodsno=#{goodsno}")
    public void deleteGoods(String goodsno);

    //增加商品信息
    @Insert("insert into tab_goods(goodsno,goodsname,goodsspec,purchaseprice,unitsalesprice,suggestedretailprice,origin,measurement,inventory,typeid) " +
            "values(#{goodsno},#{goodsname},#{goodsspec},#{purchaseprice}," +
            "#{unitsalesprice},#{suggestedretailprice},#{origin},#{measurement},#{inventory},#{typeid})")
    public void addGoods(Goods goods);

    //修改商品信息
    @Update("update tab_goods set goodsno=#{goodsno},goodsname=#{goodsname},goodsspec=#{goodsspec}," +
            "purchaseprice=#{purchaseprice},unitsalesprice=#{unitsalesprice},suggestedretailprice=#{suggestedretailprice}," +
            "origin=#{origin},measurement=#{measurement},inventory=#{inventory},typeid=#{typeid} where goodsno=#{goodsno}")
    public void updateGoods(Goods goods);

}
