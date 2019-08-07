package com.i.entity;

public class Slm {
    private Integer slmid;
    private String slmno;
    private String slmname;
    private String contacttel;
    private String address;
    private String email;
    private String bank;
    private String bankaccount;

    public Integer getSlmid() {
        return slmid;
    }

    public void setSlmid(Integer slmid) {
        this.slmid = slmid;
    }

    public String getSlmno() {
        return slmno;
    }

    public void setSlmno(String slmno) {
        this.slmno = slmno;
    }

    public String getSlmname() {
        return slmname;
    }

    public void setSlmname(String slmname) {
        this.slmname = slmname;
    }

    public String getContacttel() {
        return contacttel;
    }

    public void setContacttel(String contacttel) {
        this.contacttel = contacttel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getBankaccount() {
        return bankaccount;
    }

    public void setBankaccount(String bankaccount) {
        this.bankaccount = bankaccount;
    }

    @Override
    public String toString() {
        return "Slm{" +
                "slmid=" + slmid +
                ", slmno='" + slmno + '\'' +
                ", slmname='" + slmname + '\'' +
                ", contacttel='" + contacttel + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", bank='" + bank + '\'' +
                ", bankaccount='" + bankaccount + '\'' +
                '}';
    }
}
