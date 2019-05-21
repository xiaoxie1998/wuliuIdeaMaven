package com.wuliu.service.impl;

import com.wuliu.entity.Transcar;
import com.wuliu.entity.TranscarExample;
import com.wuliu.mapper.TranscarMapper;
import com.wuliu.service.TranscarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TranscarServiceImpl implements TranscarService {

    @Autowired
    private TranscarMapper transcarMapper;

    //查询所有运输车辆
    @Override
    public List<Transcar> transcarAll() {
        return transcarMapper.selectByExample(null);
    }

    //分页查询
    @Override
    public List<Transcar> transcarPage(int currPage, int limit) {
        TranscarExample transcarExample = new TranscarExample();
        //设置当前查询位置
        transcarExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        transcarExample.setLimit(limit);

        TranscarExample.Criteria criteria = transcarExample.createCriteria();
        List<Transcar> list=transcarMapper.selectByExample(transcarExample);
        return list;
    }

    //查看单个信息
    @Override
    public Transcar transcarById(int transcarId) {
        return transcarMapper.selectByPrimaryKey(transcarId);
    }

    //删除运输车辆信息
    @Override
    public int transcarDeleteId(int transcarId) {
        return transcarMapper.deleteByPrimaryKey(transcarId);
    }

    //添加运输车辆
    @Override
    public int transcarAdd(Transcar transcar) {
        return transcarMapper.insertSelective(transcar);
    }

    //修改运输车辆
    @Override
    public int transcarUpdate(Transcar transcar) {
        return transcarMapper.updateByPrimaryKey(transcar);
    }

    //查看汽车状态运输车辆
    @Override
    public List<Transcar> transcarByCus(String carStatus,int currPage, int limit) {
        TranscarExample transcarExample = new TranscarExample();
        //设置当前查询位置
        transcarExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        transcarExample.setLimit(limit);
        //汽车状态查询

        transcarExample.createCriteria().andCarstatusEqualTo(carStatus);
        List<Transcar> list=transcarMapper.selectByExample(transcarExample);
        return list;
    }

    //查看汽车状态所有运输车辆
    @Override
    public int transcarByCus(String carStatus) {
        TranscarExample transcarExample = new TranscarExample();

        //汽车状态查询
        transcarExample.createCriteria().andCarstatusEqualTo(carStatus);
        return transcarMapper.countByExample(transcarExample);
    }


}
