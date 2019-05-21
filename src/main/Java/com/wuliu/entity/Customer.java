package com.wuliu.entity;
/**
 * 客户实体类
 */


public class Customer {
    private Integer customerid; //编号

    private String customername; //客户名称

    private String contactname; //联系人

    private String phone; //电话

    private Paidtype paidtype; //结算方式

    private String addr; //地址


    private Area area;//所在区域areaid

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    private Customertype customertype; //客户类型

    private Double factmoney; //应收金额

    private Double paidmoney; //应付金额

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername == null ? null : customername.trim();
    }

    public String getContactname() {
        return contactname;
    }

    public void setContactname(String contactname) {
        this.contactname = contactname == null ? null : contactname.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Paidtype getPaidtype() {
        return paidtype;
    }

    public void setPaidtype(Paidtype paidtype) {
        this.paidtype = paidtype;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    public Customertype getCustomertype() {
        return customertype;
    }

    public void setCustomertype(Customertype customertype) {
        this.customertype = customertype;
    }

    public Double getFactmoney() {
        return factmoney;
    }

    public void setFactmoney(Double factmoney) {
        this.factmoney = factmoney;
    }

    public Double getPaidmoney() {
        return paidmoney;
    }

    public void setPaidmoney(Double paidmoney) {
        this.paidmoney = paidmoney;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customerid=" + customerid +
                ", customername='" + customername + '\'' +
                ", contactname='" + contactname + '\'' +
                ", phone='" + phone + '\'' +
                ", paidtype=" + paidtype +
                ", addr='" + addr + '\'' +
                ", area=" + area +
                ", customertype=" + customertype +
                ", factmoney=" + factmoney +
                ", paidmoney=" + paidmoney +
                '}';
    }
}