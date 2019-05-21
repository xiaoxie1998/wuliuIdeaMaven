package com.wuliu.service.impl;

import com.wuliu.entity.Customer;
import com.wuliu.entity.CustomerExample;
import com.wuliu.mapper.CustomerMapper;
import com.wuliu.service.CustomerService;
import com.wuliu.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    //查询所有用户
    @Override
    public List<Customer> customerAll() {
        return customerMapper.selectByExample(null);
    }

    //分页查询
    @Override
    public List<Customer> customerPage(int currPage, int limit) {
        CustomerExample customerExample = new CustomerExample();
        //设置当前查询位置
        customerExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        customerExample.setLimit(limit);

        CustomerExample.Criteria criteria = customerExample.createCriteria();
        List<Customer> list=customerMapper.selectByExample(customerExample);
        return list;
    }

    //查看单个信息
    @Override
    public Customer customerById(int id) {
        return customerMapper.selectByPrimaryKey(id);
    }

    //删除客户信息
    @Override
    public int customerDeleteId(int id) {
        return customerMapper.deleteByPrimaryKey(id);
    }

    //添加客户
    @Override
    public int customerAdd(Customer customer) {
        return customerMapper.insertSelective(customer);
    }

    //修改客户
    @Override
    public int customerUpdate(Customer customer) {
        return customerMapper.updateByPrimaryKey(customer);
    }

    //查看用户
    @Override
    public Customer customerByName(String name) {
        CustomerExample customerExample = new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        criteria.andCustomernameEqualTo(name); //按客户名称查询
        List<Customer> list = customerMapper.selectByExample(customerExample);
        if (list.size()>0)
            return list.get(0); //客户存在
        else
            return null;
    }


    //收付款查询分页
    @Override
    public List<Customer> customerModify(Customer customer, int currPage, int limit) {
        CustomerExample customerExample = new CustomerExample();
        //设置当前查询位置
        customerExample.setCurrPage((currPage-1)*limit);
        //设置查询记录数
        customerExample.setLimit(limit);

        CustomerExample.Criteria criteria = customerExample.createCriteria();

        //客户名称
        if (customer.getCustomername()!=null&&customer.getCustomername()!="")
            criteria.andCustomernameLike("%"+customer.getCustomername()+"%");

        //客户类别
        if (customer.getCustomertype().getCustomertypeid()!=0)
            criteria.andCustomertypeidEqualTo(customer.getCustomertype().getCustomertypeid());

        List<Customer> list=customerMapper.selectByExample(customerExample);
        return list;
    }

    //收付款查询所有
    @Override
    public int customerModify(Customer customer) {
        CustomerExample customerExample = new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        //客户名称
        if (customer.getCustomername()!=null&&customer.getCustomername()!="")
            criteria.andCustomernameLike("%"+customer.getCustomername()+"%");

        //客户类别
        if (customer.getCustomertype().getCustomertypeid()!=0)
            criteria.andCustomertypeidEqualTo(customer.getCustomertype().getCustomertypeid());

        return customerMapper.countByExample(customerExample);
    }

    //模糊查询客户名称
    public List<Customer> customerByNames(String name){
        CustomerExample customerExample = new CustomerExample();

        customerExample.createCriteria().andCustomernameLike("%"+name+"%"); //模糊查询客户名称
        List<Customer> list = customerMapper.selectByExample(customerExample);
        System.out.println("数量："+list.size());
        return list;
    }

}
