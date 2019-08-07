package com.i.service.Impl;
import com.i.entity.Client;
import com.i.service.ClientLevelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ClientLevelServiceImpl implements ClientLevelService {
    @Resource
    private com.i.dao.ClientLevelDao clientLevelDao;
    @Override
    public List<Map> queryClientLevel() {
        return clientLevelDao.queryClientLevel();
    }

    @Override
    public List<Map> queryClientLevel2() {
        return clientLevelDao.queryClientLevel2();
    }
    @Override
    public void updateClientLevel(Client client) {
        clientLevelDao.updateClientLevel(client);
    }
}
