package com.i.entity;

public class Purchase {
    private Integer purid;
    private String purno;
    private String purman;
    //申请部门
    private String applydep;
    //申请人
    private String applyman;
    //说明
    private String description;
    //采购总价
    private float buymoney;

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
}
