package com.i.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i.dao.ClientDao;
import com.i.entity.Client;
import com.i.service.ClientService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ClientServiceImpl implements ClientService {
    @Resource
    private ClientDao clientDao;
    @Override
    public List<Map> selectClient(){
        return clientDao.selectClient();
    }

    public void addClient(Client client){
     clientDao.addClient(client);

    }
    public void delClient(int custid){
        clientDao.delClient(custid);
    }
    @Override
    public PageInfo quertClient(PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        PageInfo page=new PageInfo(clientDao.selectClient());
        //查询所有订单之前
        return page;
    }

}
