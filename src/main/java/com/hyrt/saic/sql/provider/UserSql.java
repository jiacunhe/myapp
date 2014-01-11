package com.hyrt.saic.sql.provider;

import com.hyrt.saic.util.enums.UserStatus;
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

    public String loginManage(Map<String, Object> params) {
        SQL sql = new SQL();
        return sql.SELECT("*")
                .FROM(TABLE)
                .WHERE("userId=#{userId}")
                .AND()
                .WHERE("password=#{password}")
                .AND()
                .WHERE("status='NORMAL'")
                .AND() //子账户不能登录后台
                .WHERE("(isChild=0 or isChild is null)")
                .AND() //先付费用户不能登录后台
                .WHERE("(paymentRule is null or paymentRule='PAY_AFTER')")
                .toString();
    }

    /**
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

    public String getCustomers(Map<String, Object> param) {
        SQL sql = new SQL();
        String userId = (String) param.get("userId");
        String username = (String) param.get("username");
        String telephone = (String) param.get("telephone");
        String creatorId = (String) param.get("creatorId");
        String status = (String) param.get("status");
        String paymentRule = (String) param.get("paymentRule");
        String startTime = (String) param.get("startTime");
        String endTime = (String) param.get("endTime");
        sql.SELECT("u.*, (case u.isChild when 1 then s.username else '本网站' end) as creatorName")
                .FROM(TABLE + " u").LEFT_OUTER_JOIN(TABLE + " s ON (u.creatorId=s.userId)")
                .WHERE("u.usertype='" + UserType.CUSTOMER + "'");
        if (!StringUtils.isEmpty(userId)) {
            sql.AND().WHERE("u.userId like CONCAT('%',#{userId},'%')");
        }
        if (!StringUtils.isEmpty(username)) {
            sql.AND().WHERE("u.username like CONCAT('%',#{username},'%')");
        }
        if (!StringUtils.isEmpty(telephone)) {
            sql.AND().WHERE("u.telephone like CONCAT('%',#{telephone},'%')");
        }
        if (!StringUtils.isEmpty(startTime)) {
            sql.AND().WHERE("date_format(u.regTime, '%Y-%m-%d') >= #{startTime}");
        }
        if (!StringUtils.isEmpty(endTime)) {
            sql.AND().WHERE("date_format(u.regTime, '%Y-%m-%d') <= #{endTime}");
        }
        if (!StringUtils.isEmpty(paymentRule)) {
                sql.AND().WHERE("u.paymentRule = #{paymentRule}");
        }
        if (!StringUtils.isEmpty(creatorId)) {
            sql.AND().WHERE("u.creatorId like CONCAT('%',#{creatorId},'%')");
        }
        if (!StringUtils.isEmpty(status)) {
            sql.AND().WHERE("u.status = #{status}");
        } else {
            sql.AND().WHERE("u.status != '" + UserStatus.DELETED + "'");
        }
        sql.ORDER_BY("u.regTime desc");
        return sql.toString();
    }

}
