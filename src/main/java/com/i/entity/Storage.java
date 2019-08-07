package com.i.entity;

public class Storage {
    private String storageno;
    private String storagegoods;
    private String storagegoodsno;
    private String storagegoodstype;
    private Integer storageamount;

    public String getStorageno() {
        return storageno;
    }

    public void setStorageno(String storageno) {
        this.storageno = storageno;
    }

    public String getStoragegoods() {
        return storagegoods;
    }

    public void setStoragegoods(String storagegoods) {
        this.storagegoods = storagegoods;
    }

    public String getStoragegoodsno() {
        return storagegoodsno;
    }

    public void setStoragegoodsno(String storagegoodsno) {
        this.storagegoodsno = storagegoodsno;
    }

    public String getStoragegoodstype() {
        return storagegoodstype;
    }

    public void setStoragegoodstype(String storagegoodstype) {
        this.storagegoodstype = storagegoodstype;
    }

    public Integer getStorageamount() {
        return storageamount;
    }

    public void setStorageamount(Integer storageamount) {
        this.storageamount = storageamount;
    }

    @Override
    public String toString() {
        return "Storage{" +
                "storageno='" + storageno + '\'' +
                ", storagegoods='" + storagegoods + '\'' +
                ", storagegoodsno='" + storagegoodsno + '\'' +
                ", storagegoodstype='" + storagegoodstype + '\'' +
                ", storageamount=" + storageamount +
                '}';
    }
}
