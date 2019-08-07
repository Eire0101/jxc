package com.i.service.Impl;

import com.i.dao.PurbDao;
import com.i.entity.PurB;
import com.i.service.PurbService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class PurbServiceImpl implements PurbService {

    @Resource
    private PurbDao purbDao;

    /**
     * 获取退货表的数据有多少行
     * @return
     */
    @Override
    public int getCountBack() {
        return purbDao.getCountBack();
    }

    /**
     * 生成退货编号
     * @return
     */
    @Override
    public String generateNo() {
        String No = "Purb";
        int count = getCountBack() + 1;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        No += sdf.format(new Date());
        if(count < 10){
            No += "000" + count;
        }else if(count < 100){
            No += "00" + count;
        }else if(count < 1000){
            No += "0" + count;
        }else{
            No += count;
        }
        return No;
    }

    /**
     * 查询所有未退货的入库详情数据
     * @return
     */
    @Override
    public List<Map> queryAllSre() {
        return purbDao.queryAllSre();
    }

    /**
     * 添加退货单
     * @return
     */
    @Override
    public int addBPur(PurB purB) {
        //获得退货的数量
        Integer backinv =  purB.getBgoodsamount();
        //获取库存的数量
        Integer queryinv = purbDao.queryInv(purB.getBgoodsno());
        //相减后的数量
        Integer inv = queryinv - backinv;
        //更新库存
        purbDao.updateInv(inv,purB.getBgoodsno());
        //根据入库编号和商品编号查找要退货的商品,将其是否退货改为已退货
        String goodsno = purB.getBgoodsno();
        String storageno = purB.getStorageno();
        System.out.println(goodsno + " " + storageno);
        purbDao.updateIsBack(goodsno,storageno);
        return purbDao.addBPur(purB);
    }

}
