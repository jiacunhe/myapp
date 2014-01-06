package me.sfce.library.mybatis.persistence.sql;

import me.sfce.library.mybatis.domain.BasePojo;
import org.apache.ibatis.jdbc.SQL;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-30
 * Time: 下午5:13
 */
public class BaseProvider<T extends BasePojo> {
    public String list(T obj) {
        SQL sql = new SQL();
        sql = sql.SELECT("*").FROM(obj.tableName());
        return sql.toString();
    }

    public String insert(T obj) {
        SQL sql = new SQL();
        return sql.INSERT_INTO(obj.tableName())
                .VALUES(obj.getInsertColumnsName(), obj.getInsertColumnsDefine())
                .toString();
    }

    public String update(T obj) {
        SQL sql = new SQL();
        String idName = obj.id();

        return sql.UPDATE(obj.tableName())
                .SET(obj.getUpdateSet())
                .WHERE(idName + "=#{" + idName + "}")
                .toString();
    }

    public String getById(T t) {
        SQL sql = new SQL();
        String table = t.tableName();
        String id = t.id();
        return sql.SELECT("*")
                .FROM(table)
                .WHERE(id + "=#{" + id + "}")
                .toString();
    }


    public String delete(T obj) {
        SQL sql = new SQL();
        String idName = obj.id();

        return sql.DELETE_FROM(obj.tableName())
                .WHERE(idName + "=#{" + idName + "}")
                .toString();
    }
}
