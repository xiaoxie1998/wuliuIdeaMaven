package com.wuliu.entity;

/**
 * 模块实体类
 */
public class Module {
    private Integer moduleid; //模块编号

    private String modulename; //模块名称

    private String classname; //模块类型

    private String moethod; //操作方法

    public Integer getModuleid() {
        return moduleid;
    }

    public void setModuleid(Integer moduleid) {
        this.moduleid = moduleid;
    }

    public String getModulename() {
        return modulename;
    }

    public void setModulename(String modulename) {
        this.modulename = modulename == null ? null : modulename.trim();
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    public String getMoethod() {
        return moethod;
    }

    public void setMoethod(String moethod) {
        this.moethod = moethod == null ? null : moethod.trim();
    }

    @Override
    public String toString() {
        return "Module{" +
                "moduleid=" + moduleid +
                ", modulename='" + modulename + '\'' +
                ", classname='" + classname + '\'' +
                ", moethod='" + moethod + '\'' +
                '}';
    }
}