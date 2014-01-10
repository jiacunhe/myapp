package com.hyrt.saic.dao;

import com.hyrt.saic.bean.User;
import com.hyrt.saic.bean.UserRole;
import com.hyrt.saic.sql.provider.UserRoleSql;
import me.sfce.library.mybatis.persistence.BaseMapper;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

public interface UserRoleMapper extends BaseMapper<UserRole> {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);

    @SelectProvider(type = UserRoleSql.class, method = "getByUser")
    @Results({@Result(column = "roleId", property = "roleId"),
            @Result(column = "userId", property = "userId"),
            @Result(column = "id", property = "id")})
    List<UserRole> getByUser(User user);

    @DeleteProvider(type = UserRoleSql.class, method = "deleteByUser")
    void deleteByUser(String userId);
}