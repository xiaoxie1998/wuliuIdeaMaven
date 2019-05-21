package com.wuliu.service.impl;

import com.wuliu.entity.Cardetail;
import com.wuliu.entity.CardetailExample;
import com.wuliu.entity.Transcar;
import com.wuliu.mapper.CardetailMapper;
import com.wuliu.service.CardetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardetailServiceImpl implements CardetailService {

    @Autowired
    private CardetailMapper cardetailMapper;

    //查询所有订单明细
    @Override
    public int cardetailAll() {
        return cardetailMapper.countByExample(null);
    }

    //分页查询
    @Override
    public List<Cardetail> cardetailPage(int currPage, int limit) {
        CardetailExample cardetailExample = new CardetailExample();
        //设置当前查询位置
        cardetailExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        cardetailExample.setLimit(limit);

        CardetailExample.Criteria criteria = cardetailExample.createCriteria();
        List<Cardetail> list=cardetailMapper.selectByExample(cardetailExample);
        return list;
    }

    //查看单个信息
    @Override
    public Cardetail cardetailById(String cardetailId) {
        return cardetailMapper.selectByPrimaryKey(cardetailId);
    }

    //删除订单明细信息
    @Override
    public int cardetailDeleteId(String cardetailId) {
        return cardetailMapper.deleteByPrimaryKey(cardetailId);
    }

    //添加订单明细
    @Override
    public int cardetailAdd(Cardetail cardetail) {
        return cardetailMapper.insertSelective(cardetail);
    }

    //修改订单明细
    @Override
    public int cardetailUpdate(Cardetail cardetail) {
        return cardetailMapper.updateByPrimaryKey(cardetail);
    }

    //查看客户订单明细
    @Override
    public List<Cardetail> cardetailByCus(int customerId,int currPage, int limit) {
        CardetailExample cardetailExample = new CardetailExample();
        //设置当前查询位置
        cardetailExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        cardetailExample.setLimit(limit);
        //发货单位查询
        cardetailExample.or().andSendcustidEqualTo(customerId);
        //收货单位查询
        cardetailExample.or().andRececityEqualTo(customerId);
        List<Cardetail> list=cardetailMapper.selectByExample(cardetailExample);
        return list;
    }

    //查看客户所有订单明细
    @Override
    public int cardetailByCus(int customerId) {
        CardetailExample cardetailExample = new CardetailExample();
        //发货单位查询
        cardetailExample.or().andSendcustidEqualTo(customerId);
        //收货单位查询
        cardetailExample.or().andRececityEqualTo(customerId);
        return cardetailMapper.countByExample(cardetailExample);
    }

    //查看车辆订单明细
    @Override
    public List<Cardetail> cardetailByTranscar(int customerId, int currPage, int limit) {
        CardetailExample cardetailExample = new CardetailExample();
        //设置当前查询位置
        cardetailExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        cardetailExample.setLimit(limit);

        //车辆查询
        cardetailExample.createCriteria().andTransidEqualTo(customerId);
        List<Cardetail> list=cardetailMapper.selectByExample(cardetailExample);
        return list;
    }

    //查看车辆所有订单明细
    @Override
    public int cardetailByTranscar(int customerId) {
        CardetailExample cardetailExample = new CardetailExample();
        //车辆查询
        cardetailExample.createCriteria().andTransidEqualTo(customerId);
        return cardetailMapper.countByExample(cardetailExample);
    }

    //订单明细查询
    @Override
    public List<Cardetail> cardetailModify(Cardetail cardetail, int currPage, int limit) {
        CardetailExample cardetailExample = new CardetailExample();
        //设置当前查询位置
        cardetailExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        cardetailExample.setLimit(limit);

        CardetailExample.Criteria criteria = cardetailExample.createCriteria();

        System.out.println("订单号："+cardetail.getDetailid());
        if (cardetail.getDetailid()!=null&&cardetail.getDetailid()!=""){
            System.out.println("查看1");
            //订单号
            criteria.andDetailidEqualTo(cardetail.getDetailid());
        }

        System.out.println("订单状态："+cardetail.getOrderid());
        if (cardetail.getOrderid()!=null&&cardetail.getOrderid()!=""){
            System.out.println("查看2");
            //订单状态
            criteria.andOrderidEqualTo(cardetail.getOrderid());
        }

        System.out.println("运输车辆："+cardetail.getTranscar().getTransid());
        if (cardetail.getTranscar().getTransid()!=null&&cardetail.getTranscar().getTransid()!=0){
            System.out.println("查看3");
            //运输车辆
            criteria.andTransidEqualTo(cardetail.getTranscar().getTransid());
        }

        System.out.println("发货单位："+cardetail.getSendcustid().getCustomerid());
        if (cardetail.getSendcustid().getCustomerid()!=null&&cardetail.getSendcustid().getCustomerid()!=0){
            System.out.println("查看4");
            //发货单位
            criteria.andSendcustidEqualTo(cardetail.getSendcustid().getCustomerid());
        }

        System.out.println("发货城市："+cardetail.getSendcity().getAreaid());
        if (cardetail.getSendcity().getAreaid()!=null&&cardetail.getSendcity().getAreaid()!=0){
            System.out.println("查看5");
            //发货城市
            criteria.andSendcityEqualTo(cardetail.getSendcity().getAreaid());
        }

        System.out.println("收货单位："+cardetail.getRececustid().getCustomerid());
        if (cardetail.getRececustid().getCustomerid()!=null&&cardetail.getRececustid().getCustomerid()!=0){
            System.out.println("查看6");
            //收货单位
            criteria.andRececustidEqualTo(cardetail.getRececustid().getCustomerid());
        }

        System.out.println("收货城市："+cardetail.getRececity().getAreaid());
        if (cardetail.getRececity().getAreaid()!=null&&cardetail.getRececity().getAreaid()!=0){
            System.out.println("查看7");
            //收货城市
            criteria.andRececityEqualTo(cardetail.getRececity().getAreaid());
        }

        List<Cardetail> list=cardetailMapper.selectByExample(cardetailExample);
        return list;
    }

    //所有订单明细查询
    @Override
    public int cardetailModify(Cardetail cardetail) {
        CardetailExample cardetailExample = new CardetailExample();

        CardetailExample.Criteria criteria = cardetailExample.createCriteria();

        if (cardetail.getDetailid()!=null&&cardetail.getDetailid()!="")
            //订单号
            criteria.andDetailidEqualTo(cardetail.getDetailid());
        if (cardetail.getOrderid()!=null&&cardetail.getOrderid()!="")
            //订单状态
            criteria.andOrderidEqualTo(cardetail.getOrderid());
        if (cardetail.getTranscar().getTransid()!=null&&cardetail.getTranscar().getTransid()!=0)
            //运输车辆
            criteria.andTransidEqualTo(cardetail.getTranscar().getTransid());
        if (cardetail.getSendcustid().getCustomerid()!=null&&cardetail.getSendcustid().getCustomerid()!=0)
            //发货单位
            criteria.andSendcustidEqualTo(cardetail.getSendcustid().getCustomerid());
        if (cardetail.getSendcity().getAreaid()!=null&&cardetail.getSendcity().getAreaid()!=0)
            //发货城市
            criteria.andSendcityEqualTo(cardetail.getSendcity().getAreaid());
        if (cardetail.getRececustid().getCustomerid()!=null&&cardetail.getRececustid().getCustomerid()!=0)
            //收货单位
            criteria.andRececustidEqualTo(cardetail.getRececustid().getCustomerid());
        if (cardetail.getRececity().getAreaid()!=null&&cardetail.getRececity().getAreaid()!=0)
            //收货城市
            criteria.andRececityEqualTo(cardetail.getRececity().getAreaid());
        return cardetailMapper.countByExample(cardetailExample);
    }
}
