package com.i.service.Impl;

import com.i.dao.MenuDao;
import com.i.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class MenuServiceImpl implements MenuService {

    @Resource
    private MenuDao menuDao;

    @Override
    public List<Map> selectMenu(Integer userid) {
        return menuDao.selectMenu(userid);
    }
}
