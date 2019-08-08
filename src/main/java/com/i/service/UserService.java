package com.i.service;

import com.i.entity.UserInfo;

import java.util.List;
import java.util.Map;


public interface UserService {
    //登录
    public UserInfo login(UserInfo user);

    //普工个人信息查询
    public List<Map> selectUser(String telphone);

    //普工个人信息修改
    public void updateUser(UserInfo userInfo);

    //管理员对个人信息的查询
    public List<Map> queryUser();

    //管理员对个人信息的增加
    public void addUser(UserInfo userInfo);

    //管理员对个人信息的删除
    public void deleteUser(String userno);

    //管理员对个人信息的修改
    public void  updateUser2(UserInfo info);
}
