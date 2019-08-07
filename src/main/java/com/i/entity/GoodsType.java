package com.i.entity;

public class GoodsType {
    private Integer typeid;
    private String typename;

    public GoodsType(Integer typeid, String typename) {
        this.typeid = typeid;
        this.typename = typename;
    }

    public GoodsType() {

    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    @Override
    public String toString() {
        return "GoodsType{" +
                "typeid=" + typeid +
                ", typename='" + typename + '\'' +
                '}';
    }
}
