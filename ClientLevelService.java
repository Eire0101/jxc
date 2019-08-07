package com.i.service;

import com.i.entity.Client;

import java.util.List;
import java.util.Map;

public interface ClientLevelService {
    public List<Map> queryClientLevel();

    public List<Map> queryClientLevel2();

    public void updateClientLevel(Client client);

}
