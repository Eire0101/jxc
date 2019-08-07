package com.i.dao;

import com.i.entity.Slm;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface SlmDao {

    /**
     * 获取表数据总行数
     * @return
     */
    @Select("select count(*) from tab_salesman")
    public Integer getSlmCount();

    /**
     * 获取所有销售人员列表
     * @return
     */
    @Select("select * from tab_salesman")
    public List<Map> selAllSlm();

    /**
     * 添加销售人员列表
     */
    @Insert("insert into tab_salesman(slmno,slmname,contacttel,address,email,bank,bankaccount) " +
            "values(#{slmno},#{slmname},#{contacttel},#{address},#{email},#{bank},#{bankaccount})")
    public void addSlm(Slm slm);

    /**
     * 根据id删除销售人员
     * @param slmid
     */
    @Delete("delete from tab_salesman where slmid = #{slmid}")
    public void delSlm(Integer slmid);

    @Update("update tab_salesman set slmno = #{slmno}, slmname= #{slmname}, contacttel= #{contacttel}, address= #{address}, email= #{email}, bank= #{bank}, bankaccount= #{bankaccount} where slmid = #{slmid}")
    public void updateSlm(Slm slm);
}
