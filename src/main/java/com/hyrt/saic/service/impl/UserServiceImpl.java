package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.*;
import com.hyrt.saic.dao.*;
import com.hyrt.saic.service.UserService;
import com.hyrt.saic.util.Config;
import com.hyrt.saic.util.enums.PaymentRule;
import com.hyrt.saic.util.enums.UserStatus;
import com.hyrt.saic.util.enums.UserType;
import me.sfce.library.mybatis.persistence.BaseMapper;
import me.sfce.library.mybatis.service.impl.BaseServiceImpl;
import me.sfce.library.mybatis.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-27
 * Time: 下午4:59
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    UserRoleMapper userRoleMapper;

    @Autowired
    RoleMapper roleMapper;
    @Autowired
    RoleSysResourceMapper roleSysResourceMapper;
    @Autowired
    SysMessageMapper sysMessageMapper;

    @Override
    public void save(User user) {
        user.setRegTime(new Timestamp(System.currentTimeMillis()));
        user.setPassword(toMD5(user.getPassword()));
        super.save(user);
    }

    @Override
    public void update(User user) {
        if (!Config.ADMIN.equals(user.getUserId())) {
            user.setUpdateTime(new Timestamp(System.currentTimeMillis()));
            super.update(user);
        }
    }

    @Override
    public boolean login(HttpServletRequest request, String userId, String password) {
        User user = userMapper.login(userId, toMD5(password));
        if (null != user) {
            request.getSession().setAttribute(Config.USER, user);
            List<SysResource> userResourceList = getSysResource(user);
            request.getSession().setAttribute(Config.USER_RESOURCE_LIST, userResourceList);
            return true;
        }
        return false;
    }

    @Override
    public boolean checkPassword(String userId, String password) {
        return null != userMapper.login(userId, toMD5(password));
    }

    @Override
    public void modifyPassword(String userId, String password) {
        User user = new User(userId);
        user.setPassword(toMD5(password));
        super.update(user);
    }

    @Override
    public List<SysMessage> getUserMessage(Page page) {
        return sysMessageMapper.getUserMessageList(page);
    }

    @Override
    public void changeMessageStatus(String messageIds) {
        sysMessageMapper.changeMessageStatus(messageIds);
    }

    @Override
    public void deleteMessageByIds(String messageIds) {
        sysMessageMapper.deleteMessageByIds(messageIds);
    }

    @Override
    public boolean loginManage(HttpServletRequest request, String userId, String password) {
        User user = userMapper.loginManage(userId, toMD5(password));
        if (null != user) {
            request.getSession().setAttribute(Config.MANAGE, user);
            if (user.getUserType() == UserType.MANAGER) {
                List<SysResource> userResourceList = getSysResource(user);
                request.getSession().setAttribute(Config.USER_RESOURCE_LIST, userResourceList);
            } else {
                List<SysResource> sysResources = new ArrayList<>();
                sysResources.add(new SysResource("/customer/list"));
                sysResources.add(new SysResource("/customer/add"));
                sysResources.add(new SysResource("/customer/modify"));
                sysResources.add(new SysResource("/customer/lock"));
                sysResources.add(new SysResource("/customer/unlock"));
                sysResources.add(new SysResource("/customer/resetPassword"));
                sysResources.add(new SysResource("/userAccount/allotSearch"));
                sysResources.add(new SysResource("/userAccount/allotPackage"));
                sysResources.add(new SysResource("/userAccount/allotStop"));
                sysResources.add(new SysResource("/userAccount/allotSearch"));
                sysResources.add(new SysResource("/userAccount/search"));
                sysResources.add(new SysResource("/userAccount/searchMonthly"));
                request.getSession().setAttribute(Config.USER_RESOURCE_LIST, sysResources);
            }
            return true;
        }
        return false;
    }

    private String toMD5(String resource) {
        byte[] bytes = DigestUtils.md5Digest(resource.getBytes());
        try {
            return new String(bytes, "gbk");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    private List<SysResource> getSysResource(User user) {

        List<Role> roles = roleMapper.getRolesByuserid(user.getUserId());
        StringBuffer stringBuffer = new StringBuffer();
        String roleIds = "";
        for (Role role : roles) {
            stringBuffer.append(role.getId());
            stringBuffer.append(",");
        }
        if (stringBuffer.length() > 0 && stringBuffer.indexOf(",") > 0)
            roleIds = stringBuffer.toString().substring(0, stringBuffer.indexOf(","));
        return roleSysResourceMapper.getResoureByUserRoleids(roleIds);
    }

    @Override
    public void modifyPaymentRule(String userId, PaymentRule paymentRule) {
    }

    @Override
    public void assignRole(User user, List<Role> roles) {
    }

    @Override
    public void invalid(User user) {
    }

    @Autowired
    AccountInfoMapper accountInfoMapper;

    @Override
    public void addCustomer(Customer customer, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(Config.MANAGE);
        customer.setCreatorId(user.getUserId());
        boolean userType = user instanceof Manager;
        customer.setBasal(userType);
        customer.setChild(!userType); //管理员创建的是普通客户，普通客户创建的是子账户，子账户不能创建客户
        customer.setUserType(UserType.CUSTOMER);
        customer.setPassword(toMD5(Config.PASSWORD_CUSTOMER_DEFAULT));
        customer.setRegTime(new Timestamp(System.currentTimeMillis()));
        customer.setStatus(UserStatus.NORMAL);

        userMapper.insert(customer);

        AccountInfo queryAccount = new AccountInfo();
        queryAccount.setUserid(customer.getUserId());
        queryAccount.setBusinessid(1);
        queryAccount.setTotality(0);
        queryAccount.setRemainder(0);
        accountInfoMapper.insert(queryAccount);

        AccountInfo monitorAccount = new AccountInfo();
        monitorAccount.setUserid(customer.getUserId());
        monitorAccount.setBusinessid(2);
        monitorAccount.setTotality(0);
        monitorAccount.setRemainder(0);
        accountInfoMapper.insert(monitorAccount);
    }

    @Transactional
    @Override
    public void addManager(Manager manager, HttpServletRequest request, String roleIds) {
        User user = (User) request.getSession().getAttribute(Config.MANAGE);
        manager.setCreatorId(user.getUserId());
        manager.setUserType(UserType.MANAGER);
        manager.setStatus(UserStatus.NORMAL);
        manager.setPassword(toMD5(Config.PASSWORD_MANAGER_DEFAULT));
        manager.setRegTime(new Timestamp(System.currentTimeMillis()));
        userMapper.insert(manager);
        if (null != roleIds) {
            String[] roleIdArray = roleIds.split(",");
            this.setRoles(manager.getUserId(), roleIdArray);
        }
    }

    @Override
    public void lock(User user) {
        if (!Config.ADMIN.equals(user.getUserId())) {
            user.setStatus(UserStatus.LOCK);
            super.update(user);
        }
    }

    @Override
    public void delete(Object id) {
        User user = getById(id);
        user.setStatus(UserStatus.DELETED);
        super.update(user);
    }

    @Override
    public void unlock(User user) {
        user.setStatus(UserStatus.NORMAL);
        super.update(user);
    }

    @Override
    public boolean checkUserId(String userId) {
        return null == userMapper.getById(new User(userId));
    }

    @Transactional
    @Override
    public void modifyManager(Manager manager, String roleIds) {
        if (Config.ADMIN.equals(manager.getUserId())) return;
        super.update(manager);
        userRoleMapper.deleteByUser(manager.getUserId());
        if (null != roleIds) {
            String[] roleIdArray = roleIds.split(",");
            this.setRoles(manager.getUserId(), roleIdArray);
        }
    }

    @Override
    public List<Manager> queryManagersByCondition(Map<String, Object> condition) {
        return userMapper.getManagers(condition);
    }

    @Override
    public List<Customer> queryCustomersByCondition(Map<String, Object> condition) {
        return userMapper.getCustomers(condition);
    }

    @Override
    public List<User> getByCreator(User creator) {
        return null;
    }

    @Override
    public void resetPassword(User user) {
        if (user instanceof Manager) {
            user.setPassword(toMD5(Config.PASSWORD_MANAGER_DEFAULT));
        } else {
            user.setPassword(toMD5(Config.PASSWORD_CUSTOMER_DEFAULT));
        }
        user.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        super.update(user);
    }

    @Override
    public List<Integer> getRoleIds(User userId) {
        List<UserRole> userRoles = userRoleMapper.getByUser(userId);
        List<Integer> result = new ArrayList<>();
        for (UserRole userRole : userRoles) {
            result.add(userRole.getRoleId());
        }
        return result;
    }

    @Override
    public void deleteRoles(String userId) {
        userRoleMapper.deleteByUser(userId);
    }

    @Override
    public void setRoles(String userId, String[] roleIds) {
        for (String roleId : roleIds) {
            UserRole userRole = new UserRole();
            userRole.setUserId(userId);
            userRole.setRoleId(Integer.valueOf(roleId));
            userRoleMapper.insert(userRole);
        }
    }

    @Override
    public BaseMapper<User> getMapper() {
        return userMapper;
    }

    @Override
    public User buildEntity(Object id) {
        User user = new User();
        if (id != null) {
            user.setUserId((String) id);
        }
        return user;
    }
}
