package com.i.dao;

import com.i.entity.Emp;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface EmpDao {
    @Select("select * from tab_employee")
    public List<Map> selectAllEmp();

    @Insert("insert into tab_employee values(#{empid},#{roleid},#{empno},#{empsex},#{empidno},#{tel},#{empemail},#{address},#{nativeplace},#{nation},#{education},#{university},#{bankno},#{bank},#{emppassword})")
    public void addEmp(Emp emp);

    @Delete("delete from tab_employee where empid = #{empid}")
    public void delEmp(Integer empid);

    @Select("select * from tab_employee where empid = #{empid}")
    public Emp selEmpById(Integer empid);

    @Update("update tab_employee set empid = #{empid},roleid = #{roleid}, empno = #{empno}, empsex = #{empsex},empidno = #{empidno},tel = #{tel},empemail = #{empemail},address = #{address},nativeplace = #{nativeplace},nation = #{nation},education = #{education}," +
            "university = #{university},bankno = #{bankno},bank = #{bank},emppassword = #{emppassword} where empid = #{empid}")
    public void updateEmp(Emp emp);
}
