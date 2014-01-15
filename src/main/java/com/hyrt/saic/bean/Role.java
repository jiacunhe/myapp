package com.hyrt.saic.bean;

import me.sfce.library.mybatis.domain.BasePojo;

import java.util.List;

public class Role extends BasePojo {
    private Integer id;

    private String roleName;

    private String remark;



    private List<SysResoure> resources;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
    public List<SysResoure> getResources() {
        return resources;
    }

    public void setResources(List<SysResoure> resources) {
        this.resources = resources;
    }
}