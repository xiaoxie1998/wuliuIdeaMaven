package com.wuliu.entity;

/**
 * 用户实体类
 */
public class Users {
    private Integer id;  //编号

    private String username; //用户名

    private String password; //密码

    private Area area; //区域

    private String depname; //部门名称

    private String degree; //工作岗位

    private String mobile; //电话

    private String addr; //地址

    private Integer staus; //状态

    private String companyname; //公司名称

    private String demo;  //备注

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }


    public String getDepname() {
        return depname;
    }

    public void setDepname(String depname) {
        this.depname = depname == null ? null : depname.trim();
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree == null ? null : degree.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    public Integer getStaus() {
        return staus;
    }

    public void setStaus(Integer staus) {
        this.staus = staus;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname == null ? null : companyname.trim();
    }

    public String getDemo() {
        return demo;
    }

    public void setDemo(String demo) {
        this.demo = demo == null ? null : demo.trim();
    }


    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    @Override
    public String toString() {
        return "Users{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", area=" + area +
                ", depname='" + depname + '\'' +
                ", degree='" + degree + '\'' +
                ", mobile='" + mobile + '\'' +
                ", addr='" + addr + '\'' +
                ", staus=" + staus +
                ", companyname='" + companyname + '\'' +
                ", demo='" + demo + '\'' +
                '}';
    }
}