package com.i.dao;

import com.i.entity.Supplier;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface SupplierDao {
    @Select("select * from tab_supplier")
    public List<Map> selectAllSup();
    @Delete("delete from tab_supplier where supid = #{supid}")
    public void delSup(Integer supid);
    @Select("select * from tab_supplier where supid = #{supid}")
    public Supplier selSupById(Integer supid);
    @Update("update tab_supplier set supid = #{supid},supno = #{supno},supname = #{supname},contact = #{contact},contacttel = #{contacttel},email = #{email},address = #{address},bank = #{bank},bankaccount = #{bankaccount}" +
            "where supid = #{supid}")
    public void updateSup(Supplier supplier);
    @Insert("insert into tab_supplier values(#{supid},#{supno},#{supname},#{contact},#{contacttel},#{email},#{address},#{bank},#{bankaccount})")
    public void addSup(Supplier supplier);
}
