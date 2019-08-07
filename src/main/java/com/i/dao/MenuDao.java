package com.i.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface MenuDao {

    @Select("select ta.* from tab_authority ta JOIN\n" +
            "tab_role_authority tra on ta.authorityid = tra.authorityid JOIN\n" +
            "tab_role tr on tra.roleid = tr.roleid JOIN\n" +
            "userinfo on userinfo.roleid = tr.roleid where userid = #{userid}")
    public List<Map> selectMenu(Integer userid);
}
