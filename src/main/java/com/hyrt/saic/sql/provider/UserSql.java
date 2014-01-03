package com.hyrt.saic.sql.provider;

import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-2
 * Time: 下午3:31
 */
public class UserSql {
    public static final String TABLE = "t_user";

    public String login(Map<String, Object> params) {
        SQL sql = new SQL();
        return sql.SELECT("*")
                .FROM(TABLE)
                .WHERE("userId=#{userId}")
                .AND()
                .WHERE("password=#{password}")
                .toString();
    }

}
