package com.wuliu.controller;

import com.wuliu.entity.Area;
import com.wuliu.entity.Car;
import com.wuliu.entity.Customer;
import com.wuliu.entity.Paidtype;
import com.wuliu.service.AreaService;
import com.wuliu.service.CarService;
import com.wuliu.service.CustomerService;
import com.wuliu.service.PaidtypeService;
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
 * 汽车控制层
 */
@Controller
@RequestMapping("/car")
public class CarController {

   @Autowired
    private CarService carService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private CustomerService customerService;

    //汽车列表
    @RequestMapping("/carPage")
    public @ResponseBody Map<String, Object> carPage(int page,int limit){
        System.out.println("汽车列表：page:"+page+" limit:"+limit);
        List<Car> list=carService.carPage(page,limit); //查询显示信息
        System.out.println(list);


        List<Car> count = carService.carAll(); //查询所有记录数
        System.out.println(count);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "");
        map.put("code", 0);
        map.put("count", count.size());
        map.put("data", list);
        return map;
    }

    //客户汽车列表
    @RequestMapping("/carCusPage")
    public @ResponseBody Map<String, Object> carCusPage(int customerId,int page,int limit){
        System.out.println("客户汽车列表：page:"+page+" limit:"+limit+"  customerId:"+customerId);
        List<Car> list=carService.carByCus(customerId,page,limit); //查询显示信息
        System.out.println(list);

        int count = carService.carByCus(customerId); //查询所有记录数
        System.out.println(count);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "");
        map.put("code", 0);
        map.put("count", count);
        map.put("data", list);
        return map;
    }
 //判断汽车名称是否存在
    @RequestMapping("/carName")
    public @ResponseBody int carName(String cardno){
        System.out.println(cardno);
       Car car= carService.carByName(cardno);
        System.out.println(car);
       if (car!=null) //判断汽车是否存在
           return 1;
       else
           return 0;
    }


    //添加汽车
    @RequestMapping("/carAdd")
    public String carAdd(Car car, Model model){
        System.out.println("添加："+car);

        int k=carService.carAdd(car);
        if (k>0) {
            model.addAttribute("carAdd", "添加成功");
        }else {
            model.addAttribute("carAdd","添加失败");
        }
        return "forward:/load/carAdd";
    }

    //删除汽车
    @RequestMapping("/carDelete")
    public @ResponseBody int carDelete(int id){
        System.out.println("删除汽车："+id);
        int k=carService.carDeleteId(id);
        return k;
    }


    //修改汽车信息
    @RequestMapping("/carUpdate")
    public String carUpdate(Car car,Model model){
        System.out.println("修改信息："+car);
        int k=carService.carUpdate(car);
        if (k>0){
            model.addAttribute("carUpdate","修改成功");
        }else {
            model.addAttribute("carUpdate","修改失败");
            //回显数据
            model.addAttribute("user",car);
            List<Area> listArea = areaService.areaAll();  //查询所有区域
            model.addAttribute("areas",listArea);
            List<Customer> listCustomer = customerService.customerAll();  //查询所有客户类型
            model.addAttribute("custs",listCustomer);
        }
        return "view/carUpdate";
    }


}
