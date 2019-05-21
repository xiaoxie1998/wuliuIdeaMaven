package com.wuliu.service.impl;

import com.wuliu.entity.Users;
import com.wuliu.entity.UsersExample;
import com.wuliu.mapper.UsersMapper;
import com.wuliu.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersMapper usersMapper;
    @Override
    public Users login(String name) {
        UsersExample usersExample = new UsersExample();
        UsersExample.Criteria criteria = usersExample.createCriteria();
        //按名字查询
        criteria.andUsernameEqualTo(name);
        List<Users> list=usersMapper.selectByExample(usersExample);

        if (list.size()>0)
            return list.get(0);
        else {
            return null;
        }

    }

    //查询所有用户
    @Override
    public List<Users> usersAll() {
        return usersMapper.selectByExample(null);
    }

    //分页查询
    @Override
    public List<Users> usersPage(int currPage, int limit) {
        UsersExample usersExample = new UsersExample();
        //设置当前查询位置
        usersExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        usersExample.setLimit(limit);

        UsersExample.Criteria criteria = usersExample.createCriteria();

        List<Users> list=usersMapper.selectByExample(usersExample);
        return list;
    }

    //查看单个信息
    @Override
    public Users usersById(int id) {
        return usersMapper.selectByPrimaryKey(id);
    }

    //删除用户信息
    @Override
    public int usersDeleteId(int id) {
        return usersMapper.deleteByPrimaryKey(id);
    }

    //添加用户
    @Override
    public int usersAdd(Users users) {
        return usersMapper.insertSelective(users);
    }

    //修改用户
    @Override
    public int usersUpdate(Users users) {
        return usersMapper.updateByPrimaryKey(users);
    }
}
