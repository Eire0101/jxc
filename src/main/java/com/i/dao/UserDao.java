package com.i.dao;

import com.i.entity.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface UserDao {
    //登录
    @Select("select * from userinfo where telphone = #{telphone} and pwd = #{pwd}")
    public UserInfo login(UserInfo user);

    //普工个人信息查询
    @Select("select * from userinfo join tab_role on userinfo.roleid = tab_role.roleid where telphone=#{telphone} ")
    public List<Map> selectUser(String telphone);

    //普工个人信息修改
    @Update("update userinfo set username=#{username},telphone=#{telphone},address=#{address},pwd=#{pwd} where userno=#{userno}")
    public void updateUser(UserInfo userInfo);

    //管理员对个人信息的查询
    @Select("select * from userinfo join tab_role on userinfo.roleid = tab_role.roleid")
    public List<Map> queryUser();

    //管理员对个人信息的增加
    @Insert("insert into userinfo(userno,username,telphone,address,pwd,roleid) values(#{userno},#{username},#{telphone},#{address},#{pwd},#{roleid})")
    public void addUser(UserInfo userInfo);

    //管理员对个人信息的删除
    //
    @Delete("delete from userinfo where userno=#{userno}")
    public void deleteUser(String userno);

    //管理员对个人信息的修改
    @Update("update userinfo set username=#{username},telphone=#{telphone},address=#{address},pwd=#{pwd},roleid=#{roleid} where userno=#{userno}")
    public void  updateUser2(UserInfo info);

}
