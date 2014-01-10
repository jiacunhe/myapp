package com.hyrt.saic.bean;

import com.hyrt.saic.util.enums.UserStatus;
import com.hyrt.saic.util.enums.UserType;
import me.sfce.library.mybatis.domain.BasePojo;

import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.List;

public class User extends BasePojo {
    @Id
    private String userId; //用户名
    private String password;
    private String username; //姓名
    private Timestamp regTime; //注册时间
    private Timestamp updateTime; //修改时间
    private UserType userType; //用户类型,管理员或客户
    private String creatorId; //创建者
    @Ignore
    private String creatorName; //创建者姓名
    private boolean isBasal; //是否有子客户
    private UserStatus status; //状态
    private String remark;
    private List<Role> roles;

    public User(){
        super(false);
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public String getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(String creatorId) {
        this.creatorId = creatorId;
    }

    public boolean isBasal() {
        return isBasal;
    }

    public void setBasal(boolean basal) {
        isBasal = basal;
    }

    public User(String userId){
        super(false);
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Timestamp getRegTime() {
        return regTime;
    }

    public void setRegTime(Timestamp regTime) {
        this.regTime = regTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public UserStatus getStatus() {
        return status;
    }

    public void setStatus(UserStatus status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
}