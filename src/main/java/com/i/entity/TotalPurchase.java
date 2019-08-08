package com.i.entity;

import java.util.Date;

public class TotalPurchase {
    private Integer purid;
    private String purno;
    private String purman;
    private String applydep;
    private String applyman;
    private String description;
    private float buymoney;
    private Date createtime;

    public Integer getPurid() {
        return purid;
    }

    public void setPurid(Integer purid) {
        this.purid = purid;
    }

    public String getPurno() {
        return purno;
    }

    public void setPurno(String purno) {
        this.purno = purno;
    }

    public String getPurman() {
        return purman;
    }

    public void setPurman(String purman) {
        this.purman = purman;
    }

    public String getApplydep() {
        return applydep;
    }

    public void setApplydep(String applydep) {
        this.applydep = applydep;
    }

    public String getApplyman() {
        return applyman;
    }

    public void setApplyman(String applyman) {
        this.applyman = applyman;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getBuymoney() {
        return buymoney;
    }

    public void setBuymoney(float buymoney) {
        this.buymoney = buymoney;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    @Override
    public String toString() {
        return "TotalPurchase{" +
                "purid=" + purid +
                ", purno='" + purno + '\'' +
                ", purman='" + purman + '\'' +
                ", applydep='" + applydep + '\'' +
                ", applyman='" + applyman + '\'' +
                ", description='" + description + '\'' +
                ", buymoney=" + buymoney +
                ", createtime=" + createtime +
                '}';
    }
}
