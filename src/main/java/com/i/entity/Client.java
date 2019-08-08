package com.i.entity;

public class Client {
    private Integer custid;
    private  String custno;
    private String  custname;
    private  String contact;
    private Integer tel;
    private  String email;
    private  String bank;
    private String bankno;


    private Integer custlevelid;
    private String custlevel;

    public String getCustno() {
        return custno;
    }

    public void setCustno(String custno) {
        this.custno = custno;
    }

    public String getCustname() {
        return custname;
    }

    public void setCustname(String custname) {
        this.custname = custname;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Integer getTel() {
        return tel;
    }

    public void setTel(Integer tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public Integer getCustlevelid() {
        return custlevelid;
    }

    public void setCustlevelid(Integer custlevelid) {
        this.custlevelid = custlevelid;
    }

    public String getCustlevel() {
        return custlevel;
    }

    public void setCustlevel(String custlevel) {
        this.custlevel = custlevel;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }



    public Integer getCustid() {
        return custid;
    }

    public void setCustid(Integer custid) {
        this.custid = custid;
    }


    public String getBankno() {
        return bankno;
    }

    public void setBankno(String bankno) {
        this.bankno = bankno;
    }

    public Client() {
    }

    public Client(Integer custid, String custno, String custname, String contact, Integer tel, String email, String bank, String bankno, Integer custlevelid, String custlevel) {
        this.custid = custid;
        this.custno = custno;
        this.custname = custname;
        this.contact = contact;
        this.tel = tel;
        this.email = email;
        this.bank = bank;
        this.bankno = bankno;
        this.custlevelid = custlevelid;
        this.custlevel = custlevel;
    }
}
