package com.wuliu.entity;
/**
 * 客户账户往来明细实体类
 */

import java.util.Date;

public class Balance {
    private Integer balanceid; //编号

    private Customer customer; //客户名称

    private Double facefee; //收付款金额

    private String paidtype; //收付款类型

    private Date paidtime; //付款起始时间

    private Date oprtime; //付款结束时间

    private Users users; //操作用户

    private String isvalid; //是否有效

    private String demo; //备注

    public Integer getBalanceid() {
        return balanceid;
    }

    public void setBalanceid(Integer balanceid) {
        this.balanceid = balanceid;
    }



    public Double getFacefee() {
        return facefee;
    }

    public void setFacefee(Double facefee) {
        this.facefee = facefee;
    }

    public String getPaidtype() {
        return paidtype;
    }

    public void setPaidtype(String paidtype) {
        this.paidtype = paidtype == null ? null : paidtype.trim();
    }

    public Date getPaidtime() {
        return paidtime;
    }

    public void setPaidtime(Date paidtime) {
        this.paidtime = paidtime;
    }

    public Date getOprtime() {
        return oprtime;
    }

    public void setOprtime(Date oprtime) {
        this.oprtime = oprtime;
    }



    public String getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(String isvalid) {
        this.isvalid = isvalid == null ? null : isvalid.trim();
    }

    public String getDemo() {
        return demo;
    }

    public void setDemo(String demo) {
        this.demo = demo == null ? null : demo.trim();
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "Balance{" +
                "balanceid=" + balanceid +
                ", customer=" + customer +
                ", facefee=" + facefee +
                ", paidtype='" + paidtype + '\'' +
                ", paidtime=" + paidtime +
                ", oprtime=" + oprtime +
                ", users=" + users +
                ", isvalid='" + isvalid + '\'' +
                ", demo='" + demo + '\'' +
                '}';
    }
}