package com.wuliu.controller;

import com.wuliu.entity.Accmodule;
import com.wuliu.service.AccmoduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户权限模块控制层
 */
@Controller
@RequestMapping("/accmodule")
public class AccmoduleController {


    @Autowired
    private AccmoduleService accmoduleService;


    //用户权限模块列表
    @RequestMapping("/accmoduleModify")
    public @ResponseBody List<Accmodule> accmoduleModify(int usersId){
        System.out.println("用户权限模块列表：usersId:"+usersId);
        List<Accmodule> list=accmoduleService.accmoduleModify(usersId); //查询显示信息
        System.out.println(list);
        System.out.println(list.size());
        return list;
    }


    //添加用户权限模块
    @RequestMapping("/accmoduleAdd")
    public @ResponseBody  int accmoduleAdd(String module,int userId){
        System.out.println("添加："+module+"  userId："+userId);

        String [] moduleId=module.split(",");
        for (String m: moduleId
             ) {
            System.out.println(m);
        }

        //先删除用户所有权限
        accmoduleService.deleteByUsers(userId);
        //添加权限
        int k=accmoduleService.addAccmodule(moduleId,userId);
        System.out.println("k:"+k);
        return k;

    }

    //删除用户权限模块
    @RequestMapping("/accmoduleDelete")
    public @ResponseBody int accmoduleDelete(String module,int userId) {
        System.out.println("删除用户权限模块：" + userId+"  module:"+module);
        String [] moduleId=module.split(",");
        List<Integer> modules = new ArrayList<>();

        for (int i=0;i<moduleId.length;i++){
            modules.add(new Integer(moduleId[i]));
        }
        System.out.println(modules);
        try {
            int k = accmoduleService.deleteByIds(modules);

            System.out.println("k:" + k);
            return k;

        } catch (Exception e) {
            return 0;
        }

    }


}
