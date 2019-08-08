package com.i.service;

import java.util.List;
import java.util.Map;

public interface PurService {

    public int getPurCount();

    public boolean addPur(Map map);

    public List<Map> selAllPurOrder();

    public List<Map> selAllPurDetail();

<<<<<<< HEAD
    public void sh(String purno, String purstatus);

    public int getPageCount();

    public List<Map> tgshQuery(Integer currIndex, Integer pagesize);
=======
    public void sh(String purno,String purstatus);

    public int getPageCount();

    public List<Map> tgshQuery(Integer currIndex,Integer pagesize);
>>>>>>> 111

    public List<Map> getPurDetailBypurno(String purno);
}
