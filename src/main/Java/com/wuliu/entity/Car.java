package com.wuliu.entity;

/**
 * 汽车表
 */
public class Car {
    private Integer carid; //编号

    private String cardno; //车牌号

    private String carname; //汽车名称

    private String model; //型号

    private Customer customer; //公司名称（客户名称）

    private String mobile; //联系电话

    private String contact; //联系人

    private String qq; //qq

    private String email; //邮箱

    private Area area; //所在区域

    private String status; //状态

    private String demo; //备注

    public Integer getCarid() {
        return carid;
    }

    public void setCarid(Integer carid) {
        this.carid = carid;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno == null ? null : cardno.trim();
    }

    public String getCarname() {
        return carname;
    }

    public void setCarname(String carname) {
        this.carname = carname == null ? null : carname.trim();
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model == null ? null : model.trim();
    }



    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getDemo() {
        return demo;
    }

    public void setDemo(String demo) {
        this.demo = demo == null ? null : demo.trim();
    }

    @Override
    public String toString() {
        return "Car{" +
                "carid=" + carid +
                ", cardno='" + cardno + '\'' +
                ", carname='" + carname + '\'' +
                ", model='" + model + '\'' +
                ", customer=" + customer +
                ", mobile='" + mobile + '\'' +
                ", contact='" + contact + '\'' +
                ", qq='" + qq + '\'' +
                ", email='" + email + '\'' +
                ", area=" + area +
                ", status='" + status + '\'' +
                ", demo='" + demo + '\'' +
                '}';
    }
}