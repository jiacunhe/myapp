package com.hyrt.saic.sql.provider;

import com.hyrt.saic.bean.User;
import org.apache.ibatis.jdbc.SQL;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-8
 * Time: 下午8:33
 */
public class UserRoleSql {
    public String getByUser(User user) {
        SQL sql = new SQL();
        return sql.SELECT("roleId")
                .FROM("t_user_role")
                .WHERE("userId=#{userId}")
                .toString();
    }
    public String deleteByUser(String userId) {
        SQL sql = new SQL();
        return sql.DELETE_FROM("t_user_role")
                .WHERE("userId=#{userId}")
                .toString();
    }
}
