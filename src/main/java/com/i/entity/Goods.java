package com.i.entity;

public class Goods {
    private Integer typeid;
    private String goodsno;
    private String goodsname;
    //商品规格
    private String goodsspec;
    //采购单价
    private float purchaseprice;
    //销售单价
    private float unitsalesprice;
    //建议零售价
    private float suggestedretailprice;
    //产地
    private String origin;
    //计量单位
    private String measurement;
    //库存
    private Integer inventory;

    public Goods() {
    }

    public Goods(Integer typeid, String goodsno, String goodsname, String goodsspec, float purchaseprice, float unitsalesprice, float suggestedretailprice, String origin, String measurement, Integer inventory) {
        this.typeid = typeid;
        this.goodsno = goodsno;
        this.goodsname = goodsname;
        this.goodsspec = goodsspec;
        this.purchaseprice = purchaseprice;
        this.unitsalesprice = unitsalesprice;
        this.suggestedretailprice = suggestedretailprice;
        this.origin = origin;
        this.measurement = measurement;
        this.inventory = inventory;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getGoodsno() {
        return goodsno;
    }

    public void setGoodsno(String goodsno) {
        this.goodsno = goodsno;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public String getGoodsspec() {
        return goodsspec;
    }

    public void setGoodsspec(String goodsspec) {
        this.goodsspec = goodsspec;
    }

    public float getPurchaseprice() {
        return purchaseprice;
    }

    public void setPurchaseprice(float purchaseprice) {
        this.purchaseprice = purchaseprice;
    }

    public float getUnitsalesprice() {
        return unitsalesprice;
    }

    public void setUnitsalesprice(float unitsalesprice) {
        this.unitsalesprice = unitsalesprice;
    }

    public float getSuggestedretailprice() {
        return suggestedretailprice;
    }

    public void setSuggestedretailprice(float suggestedretailprice) {
        this.suggestedretailprice = suggestedretailprice;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getMeasurement() {
        return measurement;
    }

    public void setMeasurement(String measurement) {
        this.measurement = measurement;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "typeid=" + typeid +
                ", goodsno='" + goodsno + '\'' +
                ", goodsname='" + goodsname + '\'' +
                ", goodsspec='" + goodsspec + '\'' +
                ", purchaseprice=" + purchaseprice +
                ", unitsalesprice=" + unitsalesprice +
                ", suggestedretailprice=" + suggestedretailprice +
                ", origin='" + origin + '\'' +
                ", measurement='" + measurement + '\'' +
                ", inventory=" + inventory +
                '}';
    }
}
