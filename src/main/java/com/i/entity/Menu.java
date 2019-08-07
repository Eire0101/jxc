package com.i.entity;

public class Menu {
    private Integer authorityid;
    private String authorityname;
    private String authoritydesc;
    private Integer parentid;
    private String urlpath;

    public Menu() {
    }

    public Menu(Integer authorityid, String authorityname, String authoritydesc, Integer parentid, String urlpath) {
        this.authorityid = authorityid;
        this.authorityname = authorityname;
        this.authoritydesc = authoritydesc;
        this.parentid = parentid;
        this.urlpath = urlpath;
    }

    public Integer getAuthorityid() {
        return authorityid;
    }

    public void setAuthorityid(Integer authorityid) {
        this.authorityid = authorityid;
    }

    public String getAuthorityname() {
        return authorityname;
    }

    public void setAuthorityname(String authorityname) {
        this.authorityname = authorityname;
    }

    public String getAuthoritydesc() {
        return authoritydesc;
    }

    public void setAuthoritydesc(String authoritydesc) {
        this.authoritydesc = authoritydesc;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getUrlpath() {
        return urlpath;
    }

    public void setUrlpath(String urlpath) {
        this.urlpath = urlpath;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "authorityid=" + authorityid +
                ", authorityname='" + authorityname + '\'' +
                ", authoritydesc='" + authoritydesc + '\'' +
                ", parentid=" + parentid +
                ", urlpath='" + urlpath + '\'' +
                '}';
    }
}
