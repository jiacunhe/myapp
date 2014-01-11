package com.hyrt.saic.sql.provider;

import com.hyrt.saic.util.enums.UserType;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.util.StringUtils;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-2
 * Time: 下午3:31
 */
public class UserSql {
    public static final String TABLE = "t_user";
    public static final String TABLE_USER_ROLE = "t_user_role";
    private static final String TABLE_ROLE = "t_role";

    public String login(Map<String, Object> params) {
        SQL sql = new SQL();
        return sql.SELECT("*")
                .FROM(TABLE)
                .WHERE("userId=#{userId}")
                .AND()
                .WHERE("password=#{password}")
                .AND()
                .WHERE("status='NORMAL'")
                .toString();
    }

    /**
     * select * from t_user left join
     *
     * @param param
     * @return
     */
    public String getManagers(Map<String, Object> param) {
        SQL sql = new SQL();
        String userId = (String) param.get("userId");
        String username = (String) param.get("username");
        Integer roleId = (Integer) param.get("roleId");
        String status = (String) param.get("status");
        sql.SELECT("u.*, r.id roleId, r.roleName, s.username as creatorName").FROM(TABLE_USER_ROLE + " ur")
                .RIGHT_OUTER_JOIN("(" + TABLE + " u LEFT OUTER JOIN " + TABLE + " s ON u.creatorId=s.userId )" + " ON u.userId=ur.userId")
                .LEFT_OUTER_JOIN(TABLE_ROLE + " r ON r.id=ur.roleId")
                .WHERE("u.usertype='" + UserType.MANAGER + "'");
        if (!StringUtils.isEmpty(userId)) {
            sql.AND().WHERE("u.userId like CONCAT('%',#{userId},'%')");
        }
        if (!StringUtils.isEmpty(username)) {
            sql.AND().WHERE("u.username like CONCAT('%',#{username},'%')");
        }
        if (null != roleId && !roleId.equals(0)) {
            sql.AND().WHERE("ur.roleId=#{roleId}");
        }
        if (!StringUtils.isEmpty(status)) {
            sql.AND().WHERE("u.status = #{status}");
        }
        sql.ORDER_BY("u.regTime desc");
        return sql.toString();
    }

}
