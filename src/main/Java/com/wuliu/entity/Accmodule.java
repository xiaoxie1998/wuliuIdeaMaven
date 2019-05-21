package com.wuliu.entity;

/**
 * 访问模块实体类
 */
public class Accmodule {
    private Integer id; //编号

    private Users users; //用户编号

    private Module module; //模块编号

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    @Override
    public String toString() {
        return "Accmodule{" +
                "id=" + id +
                ", users=" + users +
                ", module=" + module +
                '}';
    }
}