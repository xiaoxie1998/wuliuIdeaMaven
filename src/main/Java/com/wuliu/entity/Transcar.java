package com.wuliu.entity;

import java.util.Date;

/**
 * 运输车辆
 */
public class Transcar {
    private Integer transid; //编号

    private Car car; //车牌号

    private Double gcount; //装车数量

    private Area sendcity; //出发地

    private Area rececity; //目的地

    private String driver; //司机姓名

    private String drivertel; //司机电话

    private String master; //负责人

    private String mastertel; //负责人电话

    private Sendtype sendtype; //运输工具

    private Date sendtime; //发车时间

    private Double sendfee; //运输收入

    private Double carfee; //运输成本

    private String carstatus; //车辆状态

    private String demo; //备注

    public Integer getTransid() {
        return transid;
    }

    public void setTransid(Integer transid) {
        this.transid = transid;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public Double getGcount() {
        return gcount;
    }

    public void setGcount(Double gcount) {
        this.gcount = gcount;
    }



    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver == null ? null : driver.trim();
    }

    public String getDrivertel() {
        return drivertel;
    }

    public void setDrivertel(String drivertel) {
        this.drivertel = drivertel == null ? null : drivertel.trim();
    }

    public String getMaster() {
        return master;
    }

    public void setMaster(String master) {
        this.master = master == null ? null : master.trim();
    }

    public String getMastertel() {
        return mastertel;
    }

    public void setMastertel(String mastertel) {
        this.mastertel = mastertel == null ? null : mastertel.trim();
    }



    public Date getSendtime() {
        return sendtime;
    }

    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }

    public Double getSendfee() {
        return sendfee;
    }

    public void setSendfee(Double sendfee) {
        this.sendfee = sendfee;
    }

    public Double getCarfee() {
        return carfee;
    }

    public void setCarfee(Double carfee) {
        this.carfee = carfee;
    }

    public String getCarstatus() {
        return carstatus;
    }

    public void setCarstatus(String carstatus) {
        this.carstatus = carstatus == null ? null : carstatus.trim();
    }

    public String getDemo() {
        return demo;
    }

    public void setDemo(String demo) {
        this.demo = demo == null ? null : demo.trim();
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

    public Sendtype getSendtype() {
        return sendtype;
    }

    public void setSendtype(Sendtype sendtype) {
        this.sendtype = sendtype;
    }

    @Override
    public String toString() {
        return "Transcar{" +
                "transid=" + transid +
                ", car=" + car +
                ", gcount=" + gcount +
                ", sendcity=" + sendcity +
                ", rececity=" + rececity +
                ", driver='" + driver + '\'' +
                ", drivertel='" + drivertel + '\'' +
                ", master='" + master + '\'' +
                ", mastertel='" + mastertel + '\'' +
                ", sendtype=" + sendtype +
                ", sendtime=" + sendtime +
                ", sendfee=" + sendfee +
                ", carfee=" + carfee +
                ", carstatus='" + carstatus + '\'' +
                ", demo='" + demo + '\'' +
                '}';
    }
}