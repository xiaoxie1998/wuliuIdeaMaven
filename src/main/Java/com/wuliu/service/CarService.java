package com.wuliu.service;

import com.wuliu.entity.Car;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 汽车业务接口
 */
@Service
@Transactional
public interface CarService {

    //查询所有汽车
    public List<Car> carAll();

    //分页查询
    public List<Car> carPage(int currPage, int limit);

    //查询信息
    public Car carById(int id);

    //删除汽车
    public int carDeleteId(int id);

    //添加汽车
    public int carAdd(Car car);

    //修改汽车
    public int carUpdate(Car car);

    //查看客户汽车
    public List<Car> carByCus(int customerId, int currPage, int limit);

    //查看客户所有汽车
    public int carByCus(int customerId);

    //查看车牌号
    public Car carByName(String cardno);
}

