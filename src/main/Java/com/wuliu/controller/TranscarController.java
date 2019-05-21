package com.wuliu.controller;

import com.wuliu.entity.*;
import com.wuliu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 运输车辆控制层
 */
@Controller
@RequestMapping("/transcar")
public class TranscarController {

   @Autowired
    private TranscarService transcarService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private CarService carService;

    @Autowired
    private SendtypeService sendtypeService;

    //运输车辆列表
    @RequestMapping("/transcarPage")
    public @ResponseBody Map<String, Object> transcarPage(int page,int limit){
        System.out.println("运输车辆列表：page:"+page+" limit:"+limit);
        List<Transcar> list=transcarService.transcarPage(page,limit); //查询显示信息

        for (Transcar t:list
                ) {
            System.out.println(t);

        }

        List<Transcar> count = transcarService.transcarAll(); //查询所有记录数
        System.out.println(count);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "");
        map.put("code", 0);
        map.put("count", count.size());
        map.put("data", list);
        return map;
    }

    //汽车状态运输车辆列表
    @RequestMapping("/transcarCusPage")
    public @ResponseBody Map<String, Object> transcarCusPage(int status,int page,int limit){
        String carStatus="";
        if(status==1)
            carStatus="未发车";
        else if (status==2)
            carStatus="已发车";
        else if (status==3)
            carStatus="已到站";
        System.out.println("客户运输车辆列表：page:"+page+" limit:"+limit+"  carStatus:"+carStatus);

        List<Transcar> list=transcarService.transcarByCus(carStatus,page,limit); //查询显示信息
        System.out.println(list);
        int count = transcarService.transcarByCus(carStatus); //查询所有记录数
        System.out.println(count);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "");
        map.put("code", 0);
        map.put("count", count);
        map.put("data", list);
        return map;
    }


    //添加运输车辆
    @RequestMapping("/transCarAdd")
    public String transCarAdd(Transcar transcar, Model model){
        System.out.println("添加："+transcar);
        int k=transcarService.transcarAdd(transcar);
        if (k>0) {
            model.addAttribute("transcarAdd", "添加成功");
        }else {
            model.addAttribute("transcarAdd","添加失败");
        }
        return "forward:/load/transCarAdd";
    }

    //删除运输车辆
    @RequestMapping("/transCarDelete")
    public @ResponseBody int transCarDelete(int transcarId){
        System.out.println("删除运输车辆："+transcarId);
        int k=transcarService.transcarDeleteId(transcarId);
        return k;
    }


    //修改运输车辆信息
    @RequestMapping("/transCarUpdate")
    public String transCarUpdate(Transcar transcar,Model model){
        System.out.println("修改信息："+transcar);
        int k=transcarService.transcarUpdate(transcar);
        if (k>0){
            model.addAttribute("transcarUpdate","修改成功");
        }else {
            model.addAttribute("transcarUpdate","修改失败");
            //回显数据
            List<Car> listCar = carService.carAll();  //查询所有汽车号
            model.addAttribute("cars",listCar);
            List<Area> listArea = areaService.areaAll();  //查询所有区域
            model.addAttribute("areas",listArea);
            List<Sendtype> listSendtype = sendtypeService.sendtypeAll();  //查询所有运输类型类型
            model.addAttribute("sendtypes",listSendtype);
            //查询运输车辆信息
            model.addAttribute("transCar",transcar);
        }
        return "view/transCarUpdate";
    }

   //修改运输车辆信息状态
    @RequestMapping("/transcarUpdateStatus")
    public @ResponseBody int transcarUpdateStatus(int transcarId,int status){
        String carStatus="";
        if (status==2)
            carStatus="已发车";
        else if (status==3)
            carStatus="已到站";
        System.out.println("修改信息："+transcarId+" carStatus:"+carStatus);
        Transcar transcar = transcarService.transcarById(transcarId); //查询信息
        transcar.setCarstatus(carStatus); //设置汽车状态
        int k=transcarService.transcarUpdate(transcar);
        return k;
    }
}
