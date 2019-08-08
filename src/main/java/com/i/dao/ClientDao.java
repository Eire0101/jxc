package com.i.dao;

import com.i.entity.Client;
import com.i.entity.UserInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ClientDao {
    @Select("select * from tab_customer join tab_customer_level on tab_customer.custlevelid=tab_customer_level.custlevelid")
    public List<Map> selectClient();

    @Insert("insert into tab_customer (custno,custname,contact,tel,email,bank,bankno,custlevelid )" +
            "values(#{custno},#{custname},#{contact},#{tel},#{email},#{bank},#{bankno},#{custlevelid})")
    public void addClient(Client client);

    @Delete("delete from tab_customer where custid=#{custid}")
    public void delClient(int custid);

    public List<Map> quertClient(UserInfo info);
}
