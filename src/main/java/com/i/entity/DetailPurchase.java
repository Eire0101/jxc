package com.i.entity;

import java.util.Date;

public class DetailPurchase {
    private Integer purdeid;
    private String purno;
    private String goodsno;
    private Integer puramount;
    private String subtotal;
    private Date createtime;

    public Integer getPurdeid() {
        return purdeid;
    }

    public void setPurdeid(Integer purdeid) {
        this.purdeid = purdeid;
    }

    public String getPurno() {
        return purno;
    }

    public void setPurno(String purno) {
        this.purno = purno;
    }

    public String getGoodsno() {
        return goodsno;
    }

    public void setGoodsno(String goodsno) {
        this.goodsno = goodsno;
    }

    public Integer getPuramount() {
        return puramount;
    }

    public void setPuramount(Integer puramount) {
        this.puramount = puramount;
    }

    public String getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(String subtotal) {
        this.subtotal = subtotal;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    @Override
    public String toString() {
        return "DetailPurchase{" +
                "purdeid=" + purdeid +
                ", purno='" + purno + '\'' +
                ", goodsno='" + goodsno + '\'' +
                ", puramount=" + puramount +
                ", subtotal='" + subtotal + '\'' +
                ", createtime=" + createtime +
                '}';
    }
}
