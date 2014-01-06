package com.hyrt.saic.dao;

import com.hyrt.saic.bean.User;
import com.hyrt.saic.sql.provider.UserSql;
import me.sfce.library.mybatis.persistence.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.SelectProvider;

public interface UserMapper extends BaseMapper<User> {

    @SelectProvider(type = UserSql.class, method = "login")
    @ResultMap({"user"})
    User login(@Param("userId") String userId, @Param("password") String password);

}