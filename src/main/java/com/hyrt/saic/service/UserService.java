package com.hyrt.saic.service;

import com.hyrt.saic.bean.Customer;
import com.hyrt.saic.bean.Manager;
import com.hyrt.saic.bean.Role;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.util.enums.PaymentRule;
import me.sfce.library.mybatis.service.BaseService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-27
 * Time: 下午2:59
 */
public interface UserService extends BaseService<User> {
    boolean login(HttpServletRequest request, String userId, String password);

    void modifyPaymentRule(String userId, PaymentRule paymentRule);

    void assignRole(User user, List<Role> roles);

    void invalid(User user);

    void addCustomer(Customer customer, HttpServletRequest request);

    void addManager(Manager manager, HttpServletRequest request);

    List<Manager> queryManagersByCondition(Map<String, Object> conditon);

    List<Customer> queryCustomersByCondition(Map<String, Object> conditon);

    List<User> getByCreator(User creator);

    void resetPassword(User user);

    void modifyPassword(User user, String newPassword);
}
