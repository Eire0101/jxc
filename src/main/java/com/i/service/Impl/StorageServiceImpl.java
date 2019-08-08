package com.i.service.Impl;

import com.i.dao.PurDao;
import com.i.dao.StorageDao;
import com.i.service.StorageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class StorageServiceImpl implements StorageService {

    @Resource
    private StorageDao storageDao;
    @Resource
    private PurDao purDao;

    @Override
    public Integer getStorageCount() {
        return storageDao.getStorageCount();
    }

    @Override
    public String addSreTotalDetail(Map map) {
        int num = storageDao.addSreTotal(map);
        //入库商品集合
        List<Map> list = (List<Map>) map.get("storagearr");
        int num2 = storageDao.addSreDetail(list);
        if(num > 0 && num2 > 0){
                //更新库存(入库增加商品库存)
                //遍历要入库的商品
                Iterator it = list.listIterator();
                while(it.hasNext()){
                    Map storageobj  = (Map)it.next();
                    Integer inventory = (Integer) storageobj.get("inventory");
                    Integer storageamount = (Integer) storageobj.get("storageamount");
                    String purno = (String)storageobj.get("purno");
                    String storagegoodsno = (String)storageobj.get("storagegoodsno");
                    inventory += storageamount;
                    //根据商品编号更改库存
                    storageDao.updateGoodsInv(inventory,storagegoodsno);
                    //根据商品编号和采购单号更改商品详情表验收状态
                    storageDao.updatePurCaaStatus(purno,storagegoodsno);
                    //更改采购订单状态
                    //1.先用purno查询采购订单的所有采购订单详情表的验收状态,封装到集合里
                    List<Map> caaList = purDao.getCaaStatusByPurno(purno);
                    //2.遍历采购订单详情集合,如果所有订单详情的验收状态都为已验收,则将该采购订单总表的审核状态改为采购完成,没有则不进行操作
                    Iterator caait = caaList.listIterator();
                    //标记是否所有详情都是已验收
                    boolean flag = true;
                    //遍历一个商品对应的采购单的所有商品详情的验收状态
                    while(caait.hasNext()){
                        Map caamap = (Map)caait.next();
                        String status = (String)caamap.get("caastatus");
                        if(status.equals("未验收")){
                            flag = false;
                        }
                    }
                    //如果是都已验收则更改为采购完成
                    if(flag){
                        purDao.updatePurStatus(purno);
                    }
                }
            return "添加成功";
        }else{
            return "添加失败";
        }
    }
}
