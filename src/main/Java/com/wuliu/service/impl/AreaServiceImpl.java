package com.wuliu.service.impl;

import com.wuliu.entity.Area;
import com.wuliu.entity.AreaExample;
import com.wuliu.mapper.AreaMapper;
import com.wuliu.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {

    @Autowired
    private  AreaMapper areaMapper;


    //查询所有区域
    @Override
    public List<Area> areaAll() {

        return areaMapper.selectByExample(null);
    }

    //查询单个区域
    @Override
    public Area areaSelect(int id) {
        return areaMapper.selectByPrimaryKey(id);
    }

    //分页查询
    public List<Area> areaPage(int currPage, int limit){
        AreaExample areaExample = new AreaExample();
        //设置当前查询位置
        areaExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        areaExample.setLimit(limit);
        return areaMapper.selectByExample(areaExample);
    }

    //删除区域
    public int areaDelete(int areaId){
        return areaMapper.deleteByPrimaryKey(areaId);
    }

    //修改区域
    public int areaUpdate(Area area){
        return areaMapper.updateByPrimaryKey(area);
    }

    //区域名称查询
    public Area areaSelect(String areaName){
        AreaExample areaExample = new AreaExample();
        areaExample.createCriteria().andAreanameEqualTo(areaName); //区域名称查询
        List<Area> list = areaMapper.selectByExample(areaExample);
        if (list.size()>0)
            return list.get(0);
        else
            return null;
    }

    //添加区域
    public int areaAdd(Area area){
        return areaMapper.insertSelective(area);
    }
}
