package com.wuliu.service;

import com.wuliu.entity.Transcar;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 运输车辆业务接口
 */
@Service
@Transactional
public interface TranscarService {

    //查询所有运输车辆
    public List<Transcar> transcarAll();

    //分页查询
    public List<Transcar> transcarPage(int currPage, int limit);

    //查询信息
    public Transcar transcarById(int transcarId);

    //删除运输车辆
    public int transcarDeleteId(int transcarId);

    //添加运输车辆
    public int transcarAdd(Transcar transcar);

    //修改运输车辆
    public int transcarUpdate(Transcar transcar);

    //查看汽车状态运输车辆
    public List<Transcar> transcarByCus(String carStatus, int currPage, int limit);

    //查看汽车状态所有运输车辆
    public int transcarByCus(String carStatus);
}

