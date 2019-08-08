package com.i.service.Impl;

import com.i.dao.PurDao;
import com.i.service.PurService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class PurServiceImpl implements PurService {

    @Resource
    private PurDao purDao;

    @Override
    public int getPurCount() {
        return purDao.getPurCount();
    }

    @Override
    public boolean addPur(Map map) {
        int num = purDao.addPurTotal(map);
        int num2 = purDao.addPurDetail((List<Map>) map.get("goodsarr"));
        return (num > 0 && num2 > 0);
    }

    @Override
    public List<Map> selAllPurOrder() {
        return purDao.selAllPurOrder();
    }

    @Override
    public List<Map> selAllPurDetail() {
        return purDao.selAllPurDetail();
    }

    @Override
    public void sh(String purno, String purstatus) {
        purDao.sh(purno,purstatus);
    }

    @Override
    public int getPageCount() {
        return purDao.getPageCount();
    }

    @Override
    public List<Map> tgshQuery(Integer currIndex, Integer pagesize) {
        return purDao.tgshQuery(currIndex,pagesize);
    }

    @Override
    public List<Map> getPurDetailBypurno(String purno) {
        return purDao.getPurDetailBypurno(purno);
    }
}
