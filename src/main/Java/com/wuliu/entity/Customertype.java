package com.wuliu.entity;

/**
 *客户类型实体类
 */
public class Customertype {
    private Integer customertypeid; //编号

    private String customertypename; //客户类型名称

    public Integer getCustomertypeid() {
        return customertypeid;
    }

    public void setCustomertypeid(Integer customertypeid) {
        this.customertypeid = customertypeid;
    }

    public String getCustomertypename() {
        return customertypename;
    }

    public void setCustomertypename(String customertypename) {
        this.customertypename = customertypename == null ? null : customertypename.trim();
    }

    @Override
    public String toString() {
        return "Customertype{" +
                "customertypeid=" + customertypeid +
                ", customertypename='" + customertypename + '\'' +
                '}';
    }
}