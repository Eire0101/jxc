package com.i.service;

import com.github.pagehelper.PageInfo;
import com.i.entity.Client;

import java.util.List;
import java.util.Map;

public interface ClientService {
    public List<Map> selectClient();

    public void addClient(Client client);

    public void delClient(int custid);
    public PageInfo quertClient(PageInfo pageInfo);

}
