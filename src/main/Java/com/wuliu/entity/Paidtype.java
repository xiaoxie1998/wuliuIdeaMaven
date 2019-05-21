package com.wuliu.entity;

/**
 * 付款方式
 */
public class Paidtype {
    private Integer paidid; //编号

    private String paidname; //付款名称

    public Integer getPaidid() {
        return paidid;
    }

    public void setPaidid(Integer paidid) {
        this.paidid = paidid;
    }

    public String getPaidname() {
        return paidname;
    }

    public void setPaidname(String paidname) {
        this.paidname = paidname == null ? null : paidname.trim();
    }

    @Override
    public String toString() {
        return "Paidtype{" +
                "paidid=" + paidid +
                ", paidname='" + paidname + '\'' +
                '}';
    }
}