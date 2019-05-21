package com.wuliu.service;

import com.wuliu.entity.Customer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 客户业务接口
 */
@Service
@Transactional
public interface CustomerService {

    //查询所有客户
    public List<Customer> customerAll();
    //分页查询
    public List<Customer> customerPage(int currPage, int limit);
    //查询信息
    public Customer customerById(int id);
    //删除客户
    public int customerDeleteId(int id);
    //添加客户
    public int customerAdd(Customer customer);
    //修改客户
    public int customerUpdate(Customer customer);
    //查看客户
    public Customer customerByName(String name);
    //收付款查询分页
    public List<Customer> customerModify(Customer customer,int currPage,int limit);
    //收付款查询所有
    public int customerModify(Customer customer);
    //模糊查询客户名称
    public List<Customer> customerByNames(String name);
}
