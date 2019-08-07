package com.i.service;

import com.github.pagehelper.PageInfo;
import com.i.entity.Slm;

public interface SlmService {

    public Integer getSlmCount();

    public PageInfo selAllSlm(PageInfo pageInfo);

    public void addSlm(Slm slm);

    public void delSlm(Integer slmid);

    public void updateSlm(Slm slm);
}
