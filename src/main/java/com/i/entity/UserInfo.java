package com.i.entity;

public class UserInfo {
    private Integer userid;
    private String userno;
    private String username;
    private String telphone;
    private String address;
    private String pwd;

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    private Integer roleid;

    public UserInfo() {
    }

    public UserInfo(String telphone, String pwd) {
        this.telphone = telphone;
        this.pwd = pwd;
    }

    public UserInfo(Integer userid, String userno, String username, String telphone, String address, String pwd, Integer roleid) {
        this.userid = userid;
        this.userno = userno;
        this.username = username;
        this.telphone = telphone;
        this.address = address;
        this.pwd = pwd;
        this.roleid = roleid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUserno() {
        return userno;
    }

    public void setUserno(String userno) {
        this.userno = userno;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userid=" + userid +
                ", userno='" + userno + '\'' +
                ", username='" + username + '\'' +
                ", telphone='" + telphone + '\'' +
                ", address='" + address + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }
}
