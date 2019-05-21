package com.wuliu.service;

import com.wuliu.entity.Area;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 区域业务接口
 */
@Service
@Transactional
public interface AreaService {

    //查询所有
    public List<Area> areaAll();

    //查询单个
    public Area areaSelect(int id);

    //分页查询
    public List<Area> areaPage(int currPage, int limit);

    //删除区域
    public int areaDelete(int areaId);

    //修改区域
    public int areaUpdate(Area area);

    //区域名称查询
    public Area areaSelect(String areaName);

    //添加区域
    public int areaAdd(Area area);
}
