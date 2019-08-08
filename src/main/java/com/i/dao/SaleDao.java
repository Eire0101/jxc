package com.i.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface SaleDao {

    //获取订单数量
    public int getSaleCount();

    public int addSaleDetail(List<Map> goodsarr);

    public int addSaleTotal(Map map);

    @Select("select * from tab_total_sale where buystatus <> '全部退货'")
    public List<Map> selAllSale();

    @Select("select * from tab_detail_sale where saleno = #{saleno}")
    public List<Map> selSaleDetailBySaleno(String saleno);

    @Update("update tab_detail_sale set isback = '退货' where saledid = #{saledid}")
    public void updateSaleBack(Integer saledid);

    @Select("select isback from tab_detail_sale where saleno = #{saleno}")
    public List<Map> selAllSaleBack(String saleno);

    @Update("update tab_total_sale set buystatus = #{status} where saleno = #{saleno}")
    public void updateStatus(@Param("status") String status,@Param("saleno") String saleno);
}
