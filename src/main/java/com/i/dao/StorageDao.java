package com.i.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface StorageDao {

    /**
     * 获取表数据总行数
     * @return
     */
    @Select("select count(*) from tab_total_storage")
    public Integer getStorageCount();

    /**
     * 添加入库总表
     * @param map
     * @return
     */
    public int addSreTotal(Map map);

    /**
     * 添加入库详情表
     * @param list
     * @return
     */
    public int addSreDetail(List<Map> list);

    /**
     * 入库商品更新库存
     * @param inventory
     * @return
     */
    public int updateGoodsInv(@Param("inventory") Integer inventory,@Param("storagegoodsno") String storagegoodsno);

    /**
     * 商品入库后更改其详情表里的验收状态为已验收
     */
    public void updatePurCaaStatus(@Param("purno") String purno,@Param("storagegoodsno") String storagegoodsno);
}
