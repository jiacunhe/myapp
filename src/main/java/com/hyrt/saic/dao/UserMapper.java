package com.hyrt.saic.dao;

import com.hyrt.saic.bean.Customer;
import com.hyrt.saic.bean.Manager;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.sql.provider.UserSql;
import me.sfce.library.mybatis.persistence.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;
import java.util.Map;

public interface UserMapper extends BaseMapper<User> {

    @SelectProvider(type = UserSql.class, method = "login")
    @ResultMap({"BaseResultMap"})
    User login(@Param("userId") String userId, @Param("password") String password);

    @SelectProvider(type = UserSql.class, method = "loginManage")
    @ResultMap({"BaseResultMap"})
    User loginManage(@Param("userId") String userId, @Param("password") String password);

    @SelectProvider(type = UserSql.class, method = "getManagers")
    @ResultMap({"managerWithRole"})
    List<Manager> getManagers(Map<String, Object> param);

    @SelectProvider(type = UserSql.class, method = "getCustomers2")
    @ResultMap("BaseResultMap")
    List<Customer> getCustomers(Map<String, Object> param);

}