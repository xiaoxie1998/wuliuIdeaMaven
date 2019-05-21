package com.wuliu.service;

import com.wuliu.entity.Users;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户业务层接口
 */
@Service
@Transactional
public interface UsersService {

    //登录
    public Users login(String name);
    //查询所有用户
    public List<Users> usersAll();
    //分页查询
    public List<Users> usersPage(int currPage,int limit);
    //查询信息
    public Users usersById(int id);
    //删除用户
    public int usersDeleteId(int id);
    //添加用户
    public int usersAdd(Users users);
    //修改用户
    public int usersUpdate(Users users);

}
