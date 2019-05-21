package com.wuliu.entity;

/**
 * 运输工具类别实体类
 */
public class Sendtype {
    private Integer sendtypeid; //编号

    private String sendtypename; //运输工具名称

    public Integer getSendtypeid() {
        return sendtypeid;
    }

    public void setSendtypeid(Integer sendtypeid) {
        this.sendtypeid = sendtypeid;
    }

    public String getSendtypename() {
        return sendtypename;
    }

    public void setSendtypename(String sendtypename) {
        this.sendtypename = sendtypename == null ? null : sendtypename.trim();
    }

    @Override
    public String toString() {
        return "Sendtype{" +
                "sendtypeid=" + sendtypeid +
                ", sendtypename='" + sendtypename + '\'' +
                '}';
    }
}