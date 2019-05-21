package com.wuliu.service.impl;

import com.wuliu.entity.Module;
import com.wuliu.mapper.ModuleMapper;
import com.wuliu.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 模块业务实现类
 */
@Service
public class ModuleServiceImpl implements ModuleService {

    @Autowired
    private ModuleMapper moduleMapper;

    //查看所有模块信息
    public List<Module> moduleAll(){
        return moduleMapper.selectByExample(null);
    }
}
