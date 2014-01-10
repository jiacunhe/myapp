package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.*;
import com.hyrt.saic.dao.UserMapper;
import com.hyrt.saic.dao.UserRoleMapper;
import com.hyrt.saic.service.UserService;
import com.hyrt.saic.util.Config;
import com.hyrt.saic.util.enums.PaymentRule;
import com.hyrt.saic.util.enums.UserStatus;
import com.hyrt.saic.util.enums.UserType;
import me.sfce.library.mybatis.persistence.BaseMapper;
import me.sfce.library.mybatis.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.servlet.http.HttpServletRequest;
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

    @Override
    public void save(User user) {
        user.setRegTime(new Timestamp(System.currentTimeMillis()));
        user.setPassword(toMD5(user.getPassword()));
        super.save(user);
    }

    @Override
    public void update(User user) {
        user.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        super.update(user);
    }

    @Override
    public boolean login(HttpServletRequest request, String userId, String password) {
        User user = userMapper.login(userId, toMD5(password));
        if (null != user) {
            request.getSession().setAttribute("user", user);
            return true;
        }
        return false;
    }

    private String toMD5(String resource) {
        byte[] bytes = DigestUtils.md5Digest(resource.getBytes());
        return new String(bytes);
    }

    @Override
    public void modifyPaymentRule(String userId, PaymentRule paymentRule) {
    }

    @Override
    public void assignRole(User user, List<Role> roles) {
    }

    @Override
    public void invalid(User user) {
        userMapper.delete(user);
    }

    @Override
    public void addCustomer(Customer customer, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (null != user) {
            customer.setCreatorId(user.getUserId());
        }
        customer.setUserType(UserType.CUSTOMER);
        customer.setPassword(toMD5(Config.PASSWORD_CUSTOMER_DEFAULT));
        customer.setRegTime(new Timestamp(System.currentTimeMillis()));
        userMapper.insert(customer);
    }

    @Override
    public void addManager(Manager manager, HttpServletRequest request, String roleIds) {
        User user = (User) request.getSession().getAttribute("user");
        if (null != user) {
            manager.setCreatorId(user.getUserId());
        }
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
        user.setStatus(UserStatus.LOCK);
        super.update(user);
    }

    @Override
    public void unlock(User user) {
        user.setStatus(UserStatus.NORMAL);
        super.update(user);
    }

    @Override
    public void modifyManager(Manager manager, String roleIds) {
        super.update(manager);
        userRoleMapper.deleteByUser(manager.getUserId());
        if (null != roleIds) {
            String[] roleIdArray = roleIds.split(",");
            this.setRoles(manager.getUserId(), roleIdArray);
        }
    }

    @Override
    public List<Manager> queryManagersByCondition(Map<String, Object> condition) {
        Object roleId = condition.get("roleId");
        return userMapper.getManagers((String) condition.get("userId"), (String) condition.get("username"), null == roleId ? 0 : (int) roleId, (String) condition.get("status"));
    }

    @Override
    public List<Customer> queryCustomersByCondition(Map<String, Object> condition) {
        return null;
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
        userMapper.update(user);
    }

    @Override
    public void modifyPassword(User user, String newPassword) {
        user.setPassword(toMD5(newPassword));
        user.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        userMapper.update(user);
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
