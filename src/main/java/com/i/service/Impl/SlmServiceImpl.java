package com.i.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i.dao.SlmDao;
import com.i.entity.Slm;
import com.i.service.SlmService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class SlmServiceImpl implements SlmService {

    @Resource
    private SlmDao slmDao;

    @Override
    public Integer getSlmCount() {
        return slmDao.getSlmCount();
    }

    @Override
    public PageInfo selAllSlm(PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        PageInfo page = new PageInfo(slmDao.selAllSlm());
        return page;
    }

    @Override
    public void addSlm(Slm slm) {
        slmDao.addSlm(slm);
    }

    @Override
    public void delSlm(Integer slmid) {
        slmDao.delSlm(slmid);
    }

    @Override
    public void updateSlm(Slm slm) {
        slmDao.updateSlm(slm);
    }
}
