package com.wuliu.controller;

import com.wuliu.entity.Area;
import com.wuliu.entity.Users;
import com.wuliu.service.AreaService;
import com.wuliu.service.UsersService;
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
 * 用户控制层
 */
@Controller
@RequestMapping("/users")
public class UsersController {

   @Autowired
    private UsersService usersService;

    @Autowired
    private AreaService areaService;

    //跳转登录页面
    @RequestMapping("/index")
    public String index(){
        System.out.println("登录页面");
        return "view/login";
    }

   /* //用户登录
    @RequestMapping("/login")
    public String login(Users users, HttpSession session, HttpServletResponse response, String yzm, String remember, Model model){
        System.out.println("登录："+users);
        //获取页面验证码
        String rand = (String) session.getAttribute("rand");
        if (!rand.toLowerCase().equals(yzm.toLowerCase())){ //判断验证码是否正确
            model.addAttribute("islogin","noyzm"); //验证码错误

        }else {
            //查看用户
             Users users1=usersService.login(users.getUsername());
            System.out.println(users1);
             if (users1==null){
                 model.addAttribute("islogin","user"); //用户不存在
             }else if (!users1.getPassword().equals(users.getPassword())){
                 model.addAttribute("islogin","password"); //密码错误
             }else if (users1.getStaus()==0) {
                 model.addAttribute("islogin", "dis"); //禁用
             }else {
                 session.setAttribute("users",users1); //登录成功
                 System.out.println("成功");
                 //判断是否记住密码
                 if (remember!=null){
                     System.out.println("记住密码");
                     Cookie nameCookie = new Cookie("username",users.getUsername()); //账号
                     nameCookie.setMaxAge(60*60*24*7); //记住7天
                     Cookie passCookie = new Cookie("password",users.getPassword()); //密码
                     passCookie.setMaxAge(60*60*24*7); //记住7天
                     response.addCookie(nameCookie);
                     response.addCookie(passCookie);
                 }
                 return "redirect:/load/main.action";
             }
        }

        return "view/index";
    }*/

    //用户登录
    @RequestMapping("/login")
    public @ResponseBody int login(Users users, HttpSession session, HttpServletResponse response, String remember, Model model){
        System.out.println("登录："+users);

            //查看用户
            Users users1=usersService.login(users.getUsername());
            System.out.println(users1);
            if (users1==null){
                model.addAttribute("islogin","user"); //用户不存在
                return 0;
            }else if (!users1.getPassword().equals(users.getPassword())){
                model.addAttribute("islogin","password"); //密码错误
                return 1;
            }else if (users1.getStaus()==0) {
                model.addAttribute("islogin", "dis"); //禁用
                return 2;
            }else {
                session.setAttribute("users",users1); //登录成功
                System.out.println("remember:"+remember);
                //判断是否记住密码
                if ("true".equals(remember)){
                    System.out.println("记住密码");
                    Cookie nameCookie = new Cookie("username",users.getUsername()); //账号
                    nameCookie.setMaxAge(60*60*24*7); //记住7天
                    Cookie passCookie = new Cookie("password",users.getPassword()); //密码
                    passCookie.setMaxAge(60*60*24*7); //记住7天
                    response.addCookie(nameCookie);
                    response.addCookie(passCookie);
                }
                return 3;
            }

    }

    //退出
    @RequestMapping("/layout")
    public String layout(HttpSession session){
        session.removeAttribute("users");//清楚登录数据
        return "redirect:index";
    }

    //用户列表
    @RequestMapping("/usersPage")
    public @ResponseBody Map<String, Object> usersPage(int page,int limit){
        System.out.println("用户列表：page:"+page+" limit:"+limit);
        List<Users> list=usersService.usersPage(page,limit); //查询显示信息
        System.out.println(list);

        List<Users> count = usersService.usersAll(); //查询所有记录数
        System.out.println(count);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "");
        map.put("code", 0);
        map.put("count", count.size());
        map.put("data", list);
        return map;
    }

    //判断用户是否存在
    @RequestMapping("/usersName")
    public @ResponseBody int usersName(String usersname){
        System.out.println(usersname);
       Users users= usersService.login(usersname);
       if (users!=null) //判断用户是否存在
           return 1;
       else
           return 0;
    }

    //查询用户信息
    @RequestMapping("/usersById")
    public String usersById(int id){
        Users users = usersService.usersById(id);
        return "view/userUpdate";
    }

    //添加用户
    @RequestMapping("/usersAdd")
    public String usersAdd(Users users,Model model){
        users.setStaus(1); //设置状态
        System.out.println("添加："+users);
        int k=usersService.usersAdd(users);
        if (k>0)
            return "redirect:/load/userlist.action"; //添加成功
        else {

            return "redirect:/load/userAdd.action"; //添加失败
        }

    }

    //删除用户
    @RequestMapping("/usersDelete")
    public @ResponseBody int usersDelete(int id){
        System.out.println("删除用户："+id);
        int k=usersService.usersDeleteId(id);
        return k;
    }

    //修改状态
    @RequestMapping("/updateStaus")
    public @ResponseBody int updateStaus(int staus,int id){
        System.out.println("id:"+id);
        Users users = usersService.usersById(id); //查询用户

        users.setStaus(staus); //修改状态
        System.out.println(users);
        System.out.println("修改状态："+staus);
        int k=usersService.usersUpdate(users);
        return k;

    }

    //修改密码
    @RequestMapping("/updatePwd")
    public String updatePwd(String password,HttpSession session,Model model){

        Users users = (Users) session.getAttribute("users"); //获取当前用户信息

        users.setPassword(password); //修改状态
        System.out.println(users);
        int k=usersService.usersUpdate(users);
        if (k>0){
            model.addAttribute("faile","修改成功，下次登录有效");
            session.setAttribute("users",users);//修改登录信息
        }else {
            model.addAttribute("faile","修改失败");
        }
        return "forward:/load/modifypwd";
    }

    //修改信息
    @RequestMapping("/userUpdate")
    public String userUpdate(Users users,Model model){
        System.out.println("修改信息："+users);
        int k=usersService.usersUpdate(users);
        if (k>0){
            model.addAttribute("userUpdate","修改成功");
            return "forward:/load/userlist";
        }else {
            model.addAttribute("userUpdate","修改失败");
            //回显数据
            model.addAttribute("user",users);
            List<Area> list = areaService.areaAll();
            model.addAttribute("areas",list);
            return "view/userUpdate";
        }

    }
}
