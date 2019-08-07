package com.i.dao;

import com.i.entity.Client;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ClientLevelDao {

    @Select("SELECT tab_customer.custid, tab_customer.custno,tab_customer.custname,tab_customer.contact,tab_customer.tel,tab_customer_level.custlevel\n" +
            "from tab_customer \n" +
            "join tab_customer_level \n" +
            "ON tab_customer.custlevelid=tab_customer_level.custlevelid" )
    public List<Map> queryClientLevel();

@Select("select * from tab_customer_level")
    public List<Map> queryClientLevel2();

    @Update("update tab_customer  set  contact=#{contact},tel=#{tel},custlevel=#{custlevel} where custid=#{custid}")
    public void updateClientLevel(Client client);

}
