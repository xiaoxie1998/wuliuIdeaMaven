package com.wuliu.service.impl;

import com.wuliu.entity.Car;
import com.wuliu.entity.CarExample;
import com.wuliu.mapper.CarMapper;
import com.wuliu.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarMapper carMapper;

    //查询所有汽车
    @Override
    public List<Car> carAll() {
        return carMapper.selectByExample(null);
    }

    //分页查询
    @Override
    public List<Car> carPage(int currPage, int limit) {
        CarExample carExample = new CarExample();
        //设置当前查询位置
        carExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        carExample.setLimit(limit);

        CarExample.Criteria criteria = carExample.createCriteria();
        List<Car> list=carMapper.selectByExample(carExample);
        return list;
    }

    //查看单个信息
    @Override
    public Car carById(int id) {
        return carMapper.selectByPrimaryKey(id);
    }

    //删除汽车信息
    @Override
    public int carDeleteId(int id) {
        return carMapper.deleteByPrimaryKey(id);
    }

    //添加汽车
    @Override
    public int carAdd(Car car) {
        return carMapper.insertSelective(car);
    }

    //修改汽车
    @Override
    public int carUpdate(Car car) {
        return carMapper.updateByPrimaryKey(car);
    }

    //查看客户汽车
    @Override
    public List<Car> carByCus(int customerId,int currPage, int limit) {
        CarExample carExample = new CarExample();
        CarExample.Criteria criteria = carExample.createCriteria();
        //设置当前查询位置
        carExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        carExample.setLimit(limit);
        criteria.andCustomeridEqualTo(customerId);
        List<Car> list=carMapper.selectByExample(carExample);
        return list;
    }

    //查看客户所有汽车
    @Override
    public int carByCus(int customerId) {
        CarExample carExample = new CarExample();
        CarExample.Criteria criteria = carExample.createCriteria();
        criteria.andCustomeridEqualTo(customerId);
        return carMapper.countByExample(carExample);
    }

    //查看车牌号
    @Override
    public Car carByName(String cardno) {
        CarExample carExample = new CarExample();
        carExample.createCriteria().andCardnoEqualTo(cardno); //通过车牌号
        List<Car> list = carMapper.selectByExample(carExample);
        if (list.size()>0)
            return list.get(0);
        else {
            return null;
        }
    }


}
