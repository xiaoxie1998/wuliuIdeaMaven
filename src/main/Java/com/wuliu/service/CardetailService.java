package com.wuliu.service;

import com.wuliu.entity.Cardetail;
import com.wuliu.entity.Transcar;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 订单明细业务接口
 */
@Service
@Transactional
public interface CardetailService {

    //查询所有订单明细
    public int cardetailAll();

    //分页查询
    public List<Cardetail> cardetailPage(int currPage, int limit);

    //查询信息
    public Cardetail cardetailById(String cardetailId);

    //删除订单明细
    public int cardetailDeleteId(String cardetailId);

    //添加订单明细
    public int cardetailAdd(Cardetail cardetail);

    //修改订单明细
    public int cardetailUpdate(Cardetail cardetail);

    //查看客户订单明细
    public List<Cardetail> cardetailByCus(int customerId, int currPage, int limit);

    //查看客户所有订单明细
    public int cardetailByCus(int customerId);

    //查看车辆订单明细
    public List<Cardetail> cardetailByTranscar(int transId, int currPage, int limit);

    //查看车辆所有订单明细
    public int cardetailByTranscar(int transId);

    //订单明细查询
    public List<Cardetail> cardetailModify(Cardetail cardetail, int currPage, int limit);

    //所有订单明细查询
    public int cardetailModify(Cardetail cardetail);
}

