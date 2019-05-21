package com.wuliu.entity;
/**
 * 途径线路明细实体类
 */

import java.util.Date;

public class Carroad {
    private Integer roadid; //线路编号

    private Transcar transcar; //运输车辆编号

    private Area startcity; //出发站

    private Date starttime; //出发时间

    private Area endcity; //到达站

    private Date endtime; //到达时间

    public Integer getRoadid() {
        return roadid;
    }

    public void setRoadid(Integer roadid) {
        this.roadid = roadid;
    }



    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Transcar getTranscar() {
        return transcar;
    }

    public void setTranscar(Transcar transcar) {
        this.transcar = transcar;
    }

    public Area getStartcity() {
        return startcity;
    }

    public void setStartcity(Area startcity) {
        this.startcity = startcity;
    }

    public Date getStarttime() {
        return starttime;
    }

    public Area getEndcity() {
        return endcity;
    }

    public void setEndcity(Area endcity) {
        this.endcity = endcity;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    @Override
    public String toString() {
        return "Carroad{" +
                "roadid=" + roadid +
                ", transcar=" + transcar +
                ", startcity=" + startcity +
                ", starttime=" + starttime +
                ", endcity=" + endcity +
                ", endtime=" + endtime +
                '}';
    }
}