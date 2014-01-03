package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.Customer;
import com.hyrt.saic.bean.Manager;
import com.hyrt.saic.bean.Role;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.dao.UserMapper;
import com.hyrt.saic.service.UserService;
import com.hyrt.saic.util.enums.PaymentRule;
import com.hyrt.saic.util.enums.UserType;
import me.sfce.library.mybatis.persistence.BaseMapper;
import me.sfce.library.mybatis.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
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
        customer.setPassword(toMD5(customer.getPassword()));
        customer.setRegTime(new Timestamp(System.currentTimeMillis()));
        userMapper.insert(customer);
    }

    @Override
    public void addManager(Manager manager, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (null != user) {
            manager.setCreatorId(user.getUserId());
        }
        manager.setUserType(UserType.MANAGER);
        manager.setPassword(toMD5(manager.getPassword()));
        manager.setRegTime(new Timestamp(System.currentTimeMillis()));
        userMapper.insert(manager);
    }

    @Override
    public List<Manager> queryManagersByCondition(Map<String, Object> conditon) {
        return null;
    }

    @Override
    public List<Customer> queryCustomersByCondition(Map<String, Object> conditon) {
        return null;
    }

    @Override
    public List<User> getByCreator(User creator) {
        return null;
    }

    @Override
    public void resetPassword(User user) {
    }

    @Override
    public void modifyPassword(User user, String newPassword) {
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
