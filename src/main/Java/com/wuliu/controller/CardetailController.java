package com.wuliu.controller;

import com.wuliu.entity.*;
import com.wuliu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 订单明细控制层
 */
@Controller
@RequestMapping("/cardetail")
public class CardetailController {

   @Autowired
    private CardetailService cardetailService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private PaidtypeService paidtypeService;

    @Autowired
    private TranscarService transcarService;

    @Autowired
    private CustomerService customerService;

    //订单明细列表
    @RequestMapping("/cardetailPage")
    public @ResponseBody Map<String, Object> cardetailPage(int page,int limit){
        System.out.println("订单明细列表：page:"+page+" limit:"+limit);
        List<Cardetail> list=cardetailService.cardetailPage(page,limit); //查询显示信息
        System.out.println(list);


        int count = cardetailService.cardetailAll(); //查询所有记录数
        System.out.println(count);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "");
        map.put("code", 0);
        map.put("count", count);
        map.put("data", list);
        return map;
    }

    //客户订单明细列表
    @RequestMapping("/cardetailCusPage")
    public @ResponseBody Map<String, Object> cardetailCusPage(int customerId,int page,int limit){
        System.out.println("客户订单明细列表：page:"+page+" limit:"+limit+"  customerId:"+customerId);
        List<Cardetail> list=cardetailService.cardetailByCus(customerId,page,limit); //查询显示信息
        System.out.println(list);

        int count = cardetailService.cardetailByCus(customerId); //查询所有记录数
        System.out.println(count);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "");
        map.put("code", 0);
        map.put("count", count);
        map.put("data", list);
        return map;
    }

    //车辆订单明细列表
    @RequestMapping("/cardetailTransPage")
    public @ResponseBody Map<String, Object> cardetailTransPage(int transId,int page,int limit){
        System.out.println("车辆订单明细列表：page:"+page+" limit:"+limit+"  transId:"+transId);
        List<Cardetail> list=cardetailService.cardetailByCus(transId,page,limit); //查询显示信息
        System.out.println(list);

        int count = cardetailService.cardetailByCus(transId); //查询所有记录数
        System.out.println(count);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "");
        map.put("code", 0);
        map.put("count", count);
        map.put("data", list);
        return map;
    }

    //订单明细查询
    @RequestMapping("/cardetailModifyPage")
    public @ResponseBody Map<String, Object> cardetailModifyPage( Cardetail cardetail, int page, int limit){
        System.out.println("车辆订单明细列表：page:"+page+" limit:"+limit);
        System.out.println(cardetail);
        if ("1".equals(cardetail.getOrderid()))
            cardetail.setOrderid("已处理");
        if ("2".equals(cardetail.getOrderid()))
            cardetail.setOrderid("未处理");
        List<Cardetail> list=cardetailService.cardetailModify(cardetail,page,limit); //查询显示信息
        System.out.println(list);

        int count = cardetailService.cardetailModify(cardetail); //查询所有记录数
        System.out.println(count);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "");
        map.put("code", 0);
        map.put("count", count);
        map.put("data", list);
        return map;
    }

    //添加订单明细
    @RequestMapping("/cardetailAdd")
    public String cardetailAdd(Cardetail cardetail, Model model){
        System.out.println("添加："+cardetail);
        cardetail.setOprtime(new Date());

        int k=cardetailService.cardetailAdd(cardetail);
        if (k>0) {
            model.addAttribute("cardetailAdd", "添加成功");
        }else {
            model.addAttribute("cardetailAdd","添加失败");
        }
        return "forward:/load/carDetailAdd";
    }

    //删除订单明细
    @RequestMapping("/cardetailDelete")
    public @ResponseBody int cardetailDelete(String cardetailId){
        System.out.println("删除订单明细："+cardetailId);
        int k=cardetailService.cardetailDeleteId(cardetailId);
        return k;
    }


    //修改订单明细信息
    @RequestMapping("/cardetailUpdate")
    public String cardetailUpdate(Cardetail cardetail,Model model){
        System.out.println("修改信息："+cardetail);
        int k=cardetailService.cardetailUpdate(cardetail);
        if (k>0){
            model.addAttribute("cardetailUpdate","修改成功");
        }else {
            model.addAttribute("cardetailUpdate","修改失败");
            //回显数据
            List<Transcar> listTranscar = transcarService.transcarAll(); //查询所有车辆信息
            model.addAttribute("transCars",listTranscar);
            List<Customer> listCustomer = customerService.customerAll();  //查询所有客户类型
            model.addAttribute("custs",listCustomer);
            List<Area> listArea = areaService.areaAll();  //查询所有区域
            model.addAttribute("areas",listArea);
            List<Paidtype> listPaidtype = paidtypeService.paidtypeAll();  //查询所有支付方式类型
            model.addAttribute("paidtypes",listPaidtype);

            model.addAttribute("carDetail",cardetail);
        }
        return "view/CarDetailUpdate";
    }

}
