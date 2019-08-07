package com.i.service.Impl;

import com.i.dao.UserDao;
import com.i.entity.UserInfo;
import com.i.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public UserInfo login(UserInfo user) {
        return userDao.login(user);
    }

    @Override
    public List<Map> selectUser(String telphone) {
        return userDao.selectUser(telphone);
    }


    @Override
    public void updateUser(UserInfo userInfo) {
        userDao.updateUser(userInfo);
    }

    @Override
    public List<Map> queryUser() {
        return userDao.queryUser();
    }

    @Override
    public void addUser(UserInfo userInfo) {
        userDao.addUser(userInfo);
    }

    @Override
    public void deleteUser(String userno) {
        userDao.deleteUser(userno);
    }

    @Override
    public void updateUser2(UserInfo info) {
        userDao.updateUser2(info);
    }


}
