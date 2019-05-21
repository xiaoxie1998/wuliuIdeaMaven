package com.wuliu.entity;

/**
 * 订单状态实体类
 */
public class Orderstatus {
    private Integer orderid; //编号

    private String ordername; //状态名称

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getOrdername() {
        return ordername;
    }

    public void setOrdername(String ordername) {
        this.ordername = ordername == null ? null : ordername.trim();
    }

    @Override
    public String toString() {
        return "Orderstatus{" +
                "orderid=" + orderid +
                ", ordername='" + ordername + '\'' +
                '}';
    }
}