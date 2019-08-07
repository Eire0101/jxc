package com.i.entity;

public class Emp {
    private Integer empid;
    //登录密码
    private String emppassword;
    private Integer roleid;
    //员工编号
    private String empno;
    private String empsex;
    //身份证号
    private String empidno;
    private String tel;
    private String empemail;
    private String address;
    //籍贯
    private String nativeplace;
    //民族
    private String nation;
    //学历
    private String education;
    //毕业院校
    private String university;
    //银行卡号
    private String bankno;
    //开户银行
    private String bank;

    public Emp() {
    }

    public Emp(Integer empid, String emppassword, Integer roleid, String empno, String empsex, String empidno, String tel, String empemail, String address, String nativeplace, String nation, String education, String university, String bankno, String bank) {
        this.empid = empid;
        this.emppassword = emppassword;
        this.roleid = roleid;
        this.empno = empno;
        this.empsex = empsex;
        this.empidno = empidno;
        this.tel = tel;
        this.empemail = empemail;
        this.address = address;
        this.nativeplace = nativeplace;
        this.nation = nation;
        this.education = education;
        this.university = university;
        this.bankno = bankno;
        this.bank = bank;
    }

    public Integer getEmpid() {
        return empid;
    }

    public void setEmpid(Integer empid) {
        this.empid = empid;
    }

    public String getEmppassword() {
        return emppassword;
    }

    public void setEmppassword(String emppassword) {
        this.emppassword = emppassword;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getEmpno() {
        return empno;
    }

    public void setEmpno(String empno) {
        this.empno = empno;
    }

    public String getEmpsex() {
        return empsex;
    }

    public void setEmpsex(String empsex) {
        this.empsex = empsex;
    }

    public String getEmpidno() {
        return empidno;
    }

    public void setEmpidno(String empidno) {
        this.empidno = empidno;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmpemail() {
        return empemail;
    }

    public void setEmpemail(String empemail) {
        this.empemail = empemail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNativeplace() {
        return nativeplace;
    }

    public void setNativeplace(String nativeplace) {
        this.nativeplace = nativeplace;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getBankno() {
        return bankno;
    }

    public void setBankno(String bankno) {
        this.bankno = bankno;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empid=" + empid +
                ", emppassword='" + emppassword + '\'' +
                ", roleid=" + roleid +
                ", empno='" + empno + '\'' +
                ", empsex='" + empsex + '\'' +
                ", empidno='" + empidno + '\'' +
                ", tel='" + tel + '\'' +
                ", empemail='" + empemail + '\'' +
                ", address='" + address + '\'' +
                ", nativeplace='" + nativeplace + '\'' +
                ", nation='" + nation + '\'' +
                ", education='" + education + '\'' +
                ", university='" + university + '\'' +
                ", bankno='" + bankno + '\'' +
                ", bank='" + bank + '\'' +
                '}';
    }
}
