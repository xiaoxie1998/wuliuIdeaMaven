package com.wuliu.controller;

import com.wuliu.entity.*;
import com.wuliu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 加载页面
 */
@Controller
@RequestMapping("/load")
public class LoadController {

    @Autowired
    private AreaService areaService;

    @Autowired
    private UsersService usersService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustomertypeService customertypeService;

    @Autowired
    private PaidtypeService paidtypeService;

    @Autowired
    private CarService carService;

    @Autowired
    private SendtypeService sendtypeService;

    @Autowired
    private TranscarService transcarService;

    @Autowired
    private CardetailService cardetailService;

    @Autowired
    private OrderstatusService orderstatusService;

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private AccmoduleService accmoduleService;
    //验证码
@RequestMapping("/enimg")
    public String enimg(){
        System.out.println("加载验证码");
        return "view/enimg";
    }

    //系统主菜单
    @RequestMapping("/left")
    public String left(HttpSession session, Model model, HttpServletRequest request){
        System.out.println("加载系统主菜单");
        Users users = (Users) session.getAttribute("users"); //获取当前登录用户
        List<Accmodule> listAcc = accmoduleService.accmoduleModify(users.getId()); //获取用户的权限
        System.out.println(listAcc);
        session.setAttribute("listAcc",listAcc);
        return "view/left";
    }

    //管理中心
    @RequestMapping("/right")
    public String right(){
        System.out.println("加载管理中心");
        return "view/right";
    }

    //首页
    @RequestMapping("/main")
    public String main(){
        System.out.println("加载系统首页");
        return "view/main";
    }

    //用户列表
    @RequestMapping("/userlist")
    public String userlist(){
        System.out.println("加载用户列表");
        return "view/userlist";
    }

    //新增用户
    @RequestMapping("/userAdd")
    public String userAdd(Model model){
        System.out.println("加载新增用户");
        List<Area> list = areaService.areaAll();
        model.addAttribute("areas",list);
        return "view/userAdd";
    }

    //修改密码
    @RequestMapping("/modifypwd")
    public String modifypwd(){
        System.out.println("加载修改密码");
        return "view/modifypwd";
    }

    //修改用户
    @RequestMapping("/userUpdate")
    public String userUpdate(int id,Model model){
        System.out.println("加载修改用户");
        List<Area> list = areaService.areaAll();  //查询所有区域
        model.addAttribute("areas",list);
        Users users = usersService.usersById(id); //查询用户信息
        model.addAttribute("user",users);
        return "view/userUpdate";
    }

    //客户资料
    @RequestMapping("/customerlist")
    public String customerlist(){
        System.out.println("加载客户资料");
        return "view/customerlist";
    }

    //新增客户
    @RequestMapping("/customerAdd")
    public String customerAdd(Model model){
        System.out.println("加载新增客户");
        List<Area> listArea = areaService.areaAll();  //查询所有区域
        model.addAttribute("areas",listArea);
        List<Customertype> listCustomertype = customertypeService.customertypeAll();  //查询所有客户类型
        model.addAttribute("custtypes",listCustomertype);
        List<Paidtype> listPaidtype = paidtypeService.paidtypeAll();  //查询所有支付方式类型
        model.addAttribute("paidtypes",listPaidtype);
        return "view/customerAdd";
    }

    //修改客户
    @RequestMapping("/customerUpdate")
    public String customerUpdate(Model model,int id){
        System.out.println("加载修改客户:"+id);
        List<Area> listArea = areaService.areaAll();  //查询所有区域
        model.addAttribute("areas",listArea);
        List<Customertype> listCustomertype = customertypeService.customertypeAll();  //查询所有客户类型
        model.addAttribute("custtypes",listCustomertype);
        List<Paidtype> listPaidtype = paidtypeService.paidtypeAll();  //查询所有支付方式类型
        model.addAttribute("paidtypes",listPaidtype);
        Customer customer = customerService.customerById(id); //查看客户信息
        model.addAttribute("cust",customer);
        return "view/customerUpdate";
    }

    //添加收付款
    @RequestMapping("/balanceAdd")
    public String balanceAdd(Model model,int id){
        System.out.println("加载添加收付款");
        Customer customer = customerService.customerById(id); //查看客户信息
        System.out.println(customer);
        model.addAttribute("cust",customer);
        return "view/balanceAdd";
    }

    //收付款明细
    @RequestMapping("/balancelist")
    public String balancelist(int customerId,Model model){
        System.out.println("加载收付款明细:"+customerId);
        model.addAttribute("customerId",customerId);
        return "view/balancelist";
    }

    //客户订单查询
    @RequestMapping("/carDetailbyCustomerIDlist")
    public String carDetailbyCustomerIDlist(int customerId,Model model){
        System.out.println("加载客户订单查询:"+customerId);
        model.addAttribute("customerId",customerId);
        return "view/CarDetailbyCustomerIDlist";
    }

    //汽车资料列表
    @RequestMapping("/carlist")
    public String carlist(){
        System.out.println("汽车资料列表");
        return "view/carlist";
    }

    //新增汽车
    @RequestMapping("/carAdd")
    public String carAdd(Model model){
        System.out.println("加载新增汽车");
        List<Area> listArea = areaService.areaAll();  //查询所有区域
        model.addAttribute("areas",listArea);
        List<Customer> listCustomer = customerService.customerAll();  //查询所有客户类型
        model.addAttribute("custs",listCustomer);
        return "view/carAdd";
    }

    //修改汽车
    @RequestMapping("/carUpdate")
    public String carUpdate(Model model,int id){
        System.out.println("加载修改汽车");
        List<Area> listArea = areaService.areaAll();  //查询所有区域
        model.addAttribute("areas",listArea);
        List<Customer> listCustomer = customerService.customerAll();  //查询所有客户类型
        model.addAttribute("custs",listCustomer);
        Car car = carService.carById(id); //查询汽车信息
        model.addAttribute("car",car);
        return "view/carUpdate";
    }

    //运输车辆资料列表
    @RequestMapping("/transCarlist")
    public String transCarlist(){
        System.out.println("运输车辆资料列表");
        return "view/transCarlist";
    }

    //修改运输车辆
    @RequestMapping("/transCarUpdate")
    public String transCarUpdate(Model model,int id){
        System.out.println("加载修改运输车辆");
        List<Car> listCar = carService.carAll();  //查询所有汽车号
        model.addAttribute("cars",listCar);
        List<Area> listArea = areaService.areaAll();  //查询所有区域
        model.addAttribute("areas",listArea);
        List<Sendtype> listSendtype = sendtypeService.sendtypeAll();  //查询所有运输类型类型
        model.addAttribute("sendtypes",listSendtype);
        Transcar transcar = transcarService.transcarById(id); //查询运输车辆信息
        model.addAttribute("transCar",transcar);
        return "view/transCarUpdate";
    }

    //添加运输车辆
    @RequestMapping("/transCarAdd")
    public String transCarAdd(Model model){
        System.out.println("加载添加运输车辆");
        List<Car> listCar = carService.carAll();  //查询所有汽车号
        model.addAttribute("cars",listCar);
        List<Area> listArea = areaService.areaAll();  //查询所有区域
        model.addAttribute("areas",listArea);
        List<Sendtype> listSendtype = sendtypeService.sendtypeAll();  //查询所有运输类型类型
        model.addAttribute("sendtypes",listSendtype);
        return "view/transCarAdd";
    }

    //运输车辆途径线路资料列表
    @RequestMapping("/carRoad")
    public String carRoad(int transId,Model model){
        System.out.println("运输车辆途径线路资料列表");
        List<Area> listArea = areaService.areaAll();  //查询所有区域
        model.addAttribute("areas",listArea);
        Transcar transcar = transcarService.transcarById(transId);
        model.addAttribute("trans",transcar); //车辆信息
        return "view/carRoad";
    }

    //订单管理
    @RequestMapping("/carDetaillist")
    public String carDetaillist(){
        System.out.println("加载订单管理");
        return "view/CarDetaillist";
    }

    //新增订单
    @RequestMapping("/carDetailAdd")
    public String carDetailAdd(Model model){
        System.out.println("加载新增订单");
        List<Transcar> listTranscar = transcarService.transcarAll(); //查询所有车辆信息
        model.addAttribute("transCars",listTranscar);
        List<Customer> listCustomer = customerService.customerAll();  //查询所有客户类型
        model.addAttribute("custs",listCustomer);
        List<Area> listArea = areaService.areaAll();  //查询所有区域
        model.addAttribute("areas",listArea);
        List<Paidtype> listPaidtype = paidtypeService.paidtypeAll();  //查询所有支付方式类型
        model.addAttribute("paidtypes",listPaidtype);
        return "view/CarDetailAdd";
    }

    //订单修改
    @RequestMapping("/carDetailUpdate")
    public String carDetailUpdate(Model model, String detailId){
        System.out.println("加载订单修改");
        List<Transcar> listTranscar = transcarService.transcarAll(); //查询所有车辆信息
        model.addAttribute("transCars",listTranscar);
        List<Customer> listCustomer = customerService.customerAll();  //查询所有客户类型
        model.addAttribute("custs",listCustomer);
        List<Area> listArea = areaService.areaAll();  //查询所有区域
        model.addAttribute("areas",listArea);
        List<Paidtype> listPaidtype = paidtypeService.paidtypeAll();  //查询所有支付方式类型
        model.addAttribute("paidtypes",listPaidtype);
        Cardetail cardetail = cardetailService.cardetailById(detailId); //查询订单信息
        model.addAttribute("carDetail",cardetail);

        return "view/CarDetailUpdate";
    }

    //未发车信息列表
    @RequestMapping("/transCarStartlist")
    public String transCarStartlist(){
        System.out.println("加载未发车信息列表");
        return "view/transCarStartlist";
    }

    //已发车信息列表
    @RequestMapping("/transCarFinishlist")
    public String transCarFinishlist(){
        System.out.println("加载已发车信息列表");
        return "view/transCarFinishlist";
    }

    //已到站信息列表
    @RequestMapping("/transCarOverlist")
    public String transCarOverlist(){
        System.out.println("加载已到站信息列表");
        return "view/transCarOverlist";
    }

    //车辆明细
    @RequestMapping("/carDetailbyTransIDlist")
    public String carDetailbyTransIDlist(int transId,Model model){
        System.out.println("加载车辆明细:"+transId);
        model.addAttribute("transId",transId);
        return "view/CarDetailbyTransIDlist";
    }

    //订单查询
    @RequestMapping("/carDetailRep")
    public String carDetailRep(Model model){
        System.out.println("加载订单查询");
        List<Transcar> listTranscar = transcarService.transcarAll(); //查询所有车辆信息
        model.addAttribute("transCars",listTranscar);
        List<Customer> listCustomer = customerService.customerAll();  //查询所有客户类型
        model.addAttribute("custs",listCustomer);
        List<Area> listArea = areaService.areaAll();  //查询所有区域
        model.addAttribute("areas",listArea);
        return "view/CarDetailRep";
    }

    //订单查询结果
    @RequestMapping("/carDetailStatuslist")
    public String carDetailStatuslist(Model model,Cardetail cardetail){
        System.out.println("加载订单查询结果");
        System.out.println(cardetail);
        model.addAttribute("cardetail",cardetail); //查询条件信息
        return "view/CarDetailStatuslist";
    }

    //收付款管理
    @RequestMapping("/customerRep")
    public String customerRep(Model model){
        System.out.println("加载收付款管理");
        List<Customertype> listCustomertype = customertypeService.customertypeAll();  //查询所有客户类型
        model.addAttribute("custtypes",listCustomertype);
        return "view/customerRep";
    }

    //客户账目往来明细
    @RequestMapping("/balanceRep")
    public String balanceRep(){
        System.out.println("加载客户账目往来明细");
        return "view/BalanceRep";
    }

    //客户账目往来统计
    @RequestMapping("/balanceRep2")
    public String balanceRep2(){
        System.out.println("加载客户账目往来统计");
        return "view/BalanceRep2";
    }

    //区域设置
    @RequestMapping("/arealist")
    public String arealist(){
        System.out.println("加载区域设置");
        return "view/arealist";
    }
    //添加区域
    @RequestMapping("/areaAdd")
    public String areaAdd(){
        System.out.println("加载添加区域");
        return "view/areaAdd";
    }

    //修改区域
    @RequestMapping("/areaUpdate")
    public String areaUpdate(int areaId,Model model){
        System.out.println("加载修改区域");
        Area area = areaService.areaSelect(areaId); //查询区域信息
        model.addAttribute("area",area);
        return "view/areaUpdate";
    }

    //运输工具类别
    @RequestMapping("/sendTypelist")
    public String sendTypelist(){
        System.out.println("加载运输工具类别");
        return "view/sendTypelist";
    }
    //添加运输工具类别
    @RequestMapping("/sendTypeAdd")
    public String sendTypeAdd(){
        System.out.println("加载添加运输工具类别");
        return "view/sendTypeAdd";
    }

    //修改运输工具类别
    @RequestMapping("/sendTypeUpdate")
    public String sendTypeUpdate(int sendId,Model model){
        System.out.println("加载修改运输工具类别");
        Sendtype sendtype = sendtypeService.sendtypeSelect(sendId); //查询运输工具信息
        model.addAttribute("send",sendtype);
        return "view/sendTypeUpdate";
    }

    //客户类型
    @RequestMapping("/custtypelist")
    public String custtypelist(){
        System.out.println("加载客户类型");
        return "view/custtypelist";
    }
    //添加客户类型
    @RequestMapping("/custTypeAdd")
    public String custTypeAdd(){
        System.out.println("加载添加客户类型");
        return "view/custTypeAdd";
    }

    //修改客户类型
    @RequestMapping("/custTypeUpdate")
    public String custTypeUpdate(int cusId,Model model){
        System.out.println("加载修改客户类型");
        Customertype customertype =customertypeService.customertypeSelect(cusId); //查询客户类型信息
        model.addAttribute("custType",customertype);
        return "view/custTypeUpdate";
    }

    //付款方式
    @RequestMapping("/paidTypelist")
    public String paidTypelist(){
        System.out.println("加载付款方式");
        return "view/paidTypelist";
    }
    //添加付款方式
    @RequestMapping("/paidTypeAdd")
    public String paidTypeAdd(){
        System.out.println("加载添加付款方式");
        return "view/paidTypeAdd";
    }

    //修改付款方式
    @RequestMapping("/paidTypeUpdate")
    public String paidTypeUpdate(int paidId,Model model){
        System.out.println("加载修改付款方式");
        Paidtype paidtype = paidtypeService.paidtypeSelect(paidId); //查询付款方式信息
        model.addAttribute("paid",paidtype);
        return "view/paidTypeUpdate";
    }

    //订单状态
    @RequestMapping("/orderstslist")
    public String orderstslist(){
        System.out.println("加载订单状态");
        return "view/orderstslist";
    }
    //添加订单状态
    @RequestMapping("/orderstsAdd")
    public String orderstsAdd(){
        System.out.println("加载添加订单状态");
        return "view/orderstsAdd";
    }

    //修改订单状态
    @RequestMapping("/orderstsUpdate")
    public String orderstsUpdate(int orderId,Model model){
        System.out.println("加载修改订单状态");
        Orderstatus orderstatus = orderstatusService.orderSelect(orderId); //查询订单状态信息
        model.addAttribute("orders",orderstatus);
        return "view/orderstsUpdate";
    }

    //权限设置
    @RequestMapping("/accModuleList")
    public String accModuleList(Model model){
        System.out.println("加载权限设置");
        List<Users> listUsers = usersService.usersAll();  //查询所有用户信息
        model.addAttribute("userList",listUsers);
        List<Module> listModule = moduleService.moduleAll(); // 查询所有权限
        model.addAttribute("Modules",listModule);
        return "view/accModuleList";
    }
}
