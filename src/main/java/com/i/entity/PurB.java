package com.i.entity;

import java.util.Date;

//采购退货
public class PurB {
    private String purbno;
    private String boperator;
    private Date btime;
    //收货单位
    private String consignee;
    private String bgoodsno;
    private String bgoodstype;
    private Integer bgoodsamount;
    private String purno;
    private String storageno;

    public String getPurbno() {
        return purbno;
    }

    public void setPurbno(String purbno) {
        this.purbno = purbno;
    }

    public String getBoperator() {
        return boperator;
    }

    public void setBoperator(String boperator) {
        this.boperator = boperator;
    }

    public Date getBtime() {
        return btime;
    }

    public void setBtime(Date btime) {
        this.btime = btime;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getBgoodsno() {
        return bgoodsno;
    }

    public void setBgoodsno(String bgoodsno) {
        this.bgoodsno = bgoodsno;
    }

    public String getBgoodstype() {
        return bgoodstype;
    }

    public void setBgoodstype(String bgoodstype) {
        this.bgoodstype = bgoodstype;
    }

    public Integer getBgoodsamount() {
        return bgoodsamount;
    }

    public void setBgoodsamount(Integer bgoodsamount) {
        this.bgoodsamount = bgoodsamount;
    }

    public String getPurno() {
        return purno;
    }

    public void setPurno(String purno) {
        this.purno = purno;
    }

    public String getStorageno() {
        return storageno;
    }

    public void setStorageno(String storageno) {
        this.storageno = storageno;
    }

    @Override
    public String toString() {
        return "PurB{" +
                "purbno='" + purbno + '\'' +
                ", boperator='" + boperator + '\'' +
                ", btime=" + btime +
                ", consignee='" + consignee + '\'' +
                ", bgoodsno='" + bgoodsno + '\'' +
                ", bgoodstype='" + bgoodstype + '\'' +
                ", bgoodsamount=" + bgoodsamount +
                ", purno='" + purno + '\'' +
                ", storageno='" + storageno + '\'' +
                '}';
    }
}
