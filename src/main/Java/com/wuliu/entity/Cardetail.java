package com.wuliu.entity;

import java.util.Date;

/**
 * 订单明细实体类
 */
public class Cardetail {
    private String detailid; //编号

    private Transcar transcar; //运输车辆编号

    private Integer gcount; //件数

    private Area sendcity; //出发地

    private Area rececity; //目的地

    private String startaddr; //发货地址

    private String endaddr; //收货地址

    private Customer sendcustid; //发货单位

    private Customer rececustid; //收货单位

    private String receperson; //收货人

    private String phone; //电话

    private String goodsname; //货物名称

    private String unitname; //包装

    private Double insurancefee; //保险

    private Double otherfee; //其他费用

    private String sendgoods; //随货通行

    private Paidtype paidtype; //结算方式

    private String orderid; //是否发货（状态）

    private String paidstuats; //是否结算

    private Double sendfee; //运输费

    private Double facefee; //费用

    private Date sendtime; //托运日期

    private Date oprtime; //操作日期

    private Users users; //用户名称

    private String demo; //补充说明

    public String getDetailid() {
        return detailid;
    }

    public void setDetailid(String detailid) {
        this.detailid = detailid == null ? null : detailid.trim();
    }



    public Integer getGcount() {
        return gcount;
    }

    public void setGcount(Integer gcount) {
        this.gcount = gcount;
    }


    public String getStartaddr() {
        return startaddr;
    }

    public void setStartaddr(String startaddr) {
        this.startaddr = startaddr == null ? null : startaddr.trim();
    }

    public String getEndaddr() {
        return endaddr;
    }

    public void setEndaddr(String endaddr) {
        this.endaddr = endaddr == null ? null : endaddr.trim();
    }



    public String getReceperson() {
        return receperson;
    }

    public void setReceperson(String receperson) {
        this.receperson = receperson == null ? null : receperson.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname == null ? null : goodsname.trim();
    }

    public String getUnitname() {
        return unitname;
    }

    public void setUnitname(String unitname) {
        this.unitname = unitname == null ? null : unitname.trim();
    }

    public Double getInsurancefee() {
        return insurancefee;
    }

    public void setInsurancefee(Double insurancefee) {
        this.insurancefee = insurancefee;
    }

    public Double getOtherfee() {
        return otherfee;
    }

    public void setOtherfee(Double otherfee) {
        this.otherfee = otherfee;
    }

    public String getSendgoods() {
        return sendgoods;
    }

    public void setSendgoods(String sendgoods) {
        this.sendgoods = sendgoods == null ? null : sendgoods.trim();
    }


    public String getPaidstuats() {
        return paidstuats;
    }

    public void setPaidstuats(String paidstuats) {
        this.paidstuats = paidstuats == null ? null : paidstuats.trim();
    }

    public Double getSendfee() {
        return sendfee;
    }

    public void setSendfee(Double sendfee) {
        this.sendfee = sendfee;
    }

    public Double getFacefee() {
        return facefee;
    }

    public void setFacefee(Double facefee) {
        this.facefee = facefee;
    }

    public Date getSendtime() {
        return sendtime;
    }

    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }

    public Date getOprtime() {
        return oprtime;
    }

    public void setOprtime(Date oprtime) {
        this.oprtime = oprtime;
    }


    public String getDemo() {
        return demo;
    }

    public void setDemo(String demo) {
        this.demo = demo == null ? null : demo.trim();
    }

    public Transcar getTranscar() {
        return transcar;
    }

    public void setTranscar(Transcar transcar) {
        this.transcar = transcar;
    }

    public Area getSendcity() {
        return sendcity;
    }

    public void setSendcity(Area sendcity) {
        this.sendcity = sendcity;
    }

    public Area getRececity() {
        return rececity;
    }

    public void setRececity(Area rececity) {
        this.rececity = rececity;
    }

    public Customer getSendcustid() {
        return sendcustid;
    }

    public void setSendcustid(Customer sendcustid) {
        this.sendcustid = sendcustid;
    }

    public Customer getRececustid() {
        return rececustid;
    }

    public void setRececustid(Customer rececustid) {
        this.rececustid = rececustid;
    }

    public Paidtype getPaidtype() {
        return paidtype;
    }

    public void setPaidtype(Paidtype paidtype) {
        this.paidtype = paidtype;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "Cardetail{" +
                "detailid='" + detailid + '\'' +
                ", transcar=" + transcar +
                ", gcount=" + gcount +
                ", sendcity=" + sendcity +
                ", rececity=" + rececity +
                ", startaddr='" + startaddr + '\'' +
                ", endaddr='" + endaddr + '\'' +
                ", sendcustid=" + sendcustid +
                ", rececustid=" + rececustid +
                ", receperson='" + receperson + '\'' +
                ", phone='" + phone + '\'' +
                ", goodsname='" + goodsname + '\'' +
                ", unitname='" + unitname + '\'' +
                ", insurancefee=" + insurancefee +
                ", otherfee=" + otherfee +
                ", sendgoods='" + sendgoods + '\'' +
                ", paidtype=" + paidtype +
                ", orderid='" + orderid + '\'' +
                ", paidstuats='" + paidstuats + '\'' +
                ", sendfee=" + sendfee +
                ", facefee=" + facefee +
                ", sendtime=" + sendtime +
                ", oprtime=" + oprtime +
                ", users=" + users +
                ", demo='" + demo + '\'' +
                '}';
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }
}