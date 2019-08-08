package com.i.dao;

public class SQLProvider {

    public String select1(String queryName){
        StringBuffer sql=new StringBuffer();
        sql.append("select * from tab_goods join tab_goodstype on tab_goods.typeid = tab_goodstype.typeid where 1=1");
        if (queryName!=null && (!queryName.equals(""))){
            sql.append(" and tab_goods.goodsname like  '%' #{queryName} '%' ");
        }

        System.out.println(sql);
        return sql.toString();
    }


}
