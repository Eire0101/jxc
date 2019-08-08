package com.i.dao;

import com.i.entity.PurB;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PurbDao {

    /**
     * 获取退货表的数据有多少行
     * @return
     */
    @Select("select count(*) from tab_back_purchase")
    public int getCountBack();

    /**
     * 查询所有入库的商品
     * @return
     */
    @Select("select * from tab_detail_storage d join tab_total_storage t on t.storageno = d.storageno where d.isback <> '已退货'")
    public List<Map> queryAllSre();

    /**
     * 添加退货单
     * @return
     */
    public int addBPur(PurB purB);

    /**
     * 根据商品编号查询库存
     * @param goodsno
     * @return
     */
    @Select("select inventory from tab_goods where goodsno = #{goodsno}")
    public Integer queryInv(String goodsno);

    /**
     * 根据商品编号更新库存
     * @param inv
     * @param bgoodsno
     */
    public void updateInv(@Param("inv") Integer inv,@Param("bgoodsno") String bgoodsno);

    @Update("update tab_detail_storage set isback = '已退货' where storageno = #{storageno} and storagegoodsno = #{goodsno}")
    public void updateIsBack(@Param("goodsno") String goodsno,@Param("storageno") String storageno);
}
