package com.wuliu.controller;

import com.wuliu.entity.Area;
import com.wuliu.entity.Customer;
import com.wuliu.entity.Customertype;
import com.wuliu.entity.Paidtype;
import com.wuliu.service.AreaService;
import com.wuliu.service.CustomerService;
import com.wuliu.service.CustomertypeService;
import com.wuliu.service.PaidtypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 客户控制层
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

   @Autowired
    private CustomerService customerService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private CustomertypeService customertypeService;

    @Autowired
    private PaidtypeService paidtypeService;

    //客户列表
    @RequestMapping("/customerPage")
    public @ResponseBody Map<String, Object> customerPage(Integer page,Integer limit){
        System.out.println("客户列表：page:"+page+" limit:"+limit);
        List<Customer> list=customerService.customerPage(page,limit); //查询显示信息
        System.out.println(list);


        List<Customer> lists= customerService.customerAll(); //查询所有记录数
        System.out.println(lists.size());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "");
        map.put("code", 0);
        map.put("count", lists.size());
        map.put("data", list);
        return map;
    }

    //收付款查询
    @RequestMapping("/customerModify")
    public @ResponseBody Map<String, Object> customerModify(Customer customer, Integer page,Integer limit){
        System.out.println("客户列表：page:"+page+" limit:"+limit);
        System.out.println(customer);
        List<Customer> list=customerService.customerModify(customer,page,limit); //查询显示信息
        System.out.println(list);


        int count= customerService.customerModify(customer); //查询所有记录数

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "");
        map.put("code", 0);
        map.put("count", count);
        map.put("data", list);
        return map;
    }

   //判断客户名称是否存在
    @RequestMapping("/customerName")
    public @ResponseBody int customerName(String customername){
        System.out.println(customername);
       Customer customer= customerService.customerByName(customername);
        System.out.println(customer);
       if (customer!=null) //判断客户是否存在
           return 1;
       else
           return 0;
    }

    //添加客户
    @RequestMapping("/customerAdd")
    public String customerAdd(Customer customer,Model model){
        System.out.println("添加："+customer);
        int k=customerService.customerAdd(customer);
        if (k >0) {
            model.addAttribute("customerAdd", "添加成功");
        }else {
            model.addAttribute("customerAdd","添加失败");
        }
        return "forward:/load/customerAdd";
    }

    //删除客户
    @RequestMapping("/customerDelete")
    public @ResponseBody int customerDelete(int id){
        System.out.println("删除客户："+id);
        int k=customerService.customerDeleteId(id);
        return k;
    }


    //修改客户信息
    @RequestMapping("/customerUpdate")
    public String customerUpdate(Customer customer,Model model){
        System.out.println("修改信息："+customer);
        int k=customerService.customerUpdate(customer);
        if (k>0){
            model.addAttribute("customerUpdate","修改成功");
        }else {
            model.addAttribute("customerUpdate","修改失败");
            //回显数据
            model.addAttribute("user",customer);
            List<Area> listArea = areaService.areaAll();  //查询所有区域
            model.addAttribute("areas",listArea);
            List<Customertype> listCustomertype = customertypeService.customertypeAll();  //查询所有客户类型
            model.addAttribute("custtypes",listCustomertype);
            List<Paidtype> listPaidtype = paidtypeService.paidtypeAll();  //查询所有支付方式类型
            model.addAttribute("paidtypes",listPaidtype);
        }
        return "view/customerUpdate";
    }
}
