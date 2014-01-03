package me.sfce.library.mybatis.util;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.lang.reflect.Field;
import java.util.Map;

public class MapperSqlHelper {

    public String getUpdateSQL() {
        return null;
    }

    /**
     * 传入mapper接口class
     *
     * @param clazz
     * @return
     */
    private String insertEntity(Class<?> clazz) {
        StringBuilder sql = new StringBuilder();
        StringBuilder intoSql = new StringBuilder();
        StringBuilder valuesSql = new StringBuilder();
        if (!clazz.isAnnotationPresent(Table.class)) {
            sql.append("INSERT INTO " + clazz.getName());
        } else {
            Table table = clazz.getAnnotation(Table.class);
            if ("".equals(table.name())) {
                sql.append("INSERT INTO ").append(clazz.getName());
            } else {
                sql.append("INSERT INTO ").append(table.name());
            }
        }
        Field[] files = clazz.getDeclaredFields();
        intoSql.append("(");
        for (Field file : files) {
            file.setAccessible(true);
            if (file.isAnnotationPresent(Column.class)) {
                Column column = file.getAnnotation(Column.class);
                if (column.name().equals("")) {
                    intoSql.append(file.getName()).append(",");
                } else {
                    intoSql.append(column.name()).append(",");
                }
            } else {
                intoSql.append(file.getName()).append(",");
            }
        }
        valuesSql.append(" values (");
        for (Field field : files) {
            field.setAccessible(true);
            if (field.isAnnotationPresent(Column.class)) {
                Column anColumn = field.getAnnotation(Column.class);
                    if (anColumn.name().equals("")) {
                        valuesSql.append("#{").append(field.getName()).append("},");
                    } else {
                        valuesSql.append("#{").append(field.getName()).append("},");
                    }
            } else {
                valuesSql.append("#{").append(field.getName()).append("},");
            }

        }
        return sql.append(intoSql.substring(0, intoSql.length() - 1)).append(") ").append(valuesSql.substring(0, valuesSql.length() - 1)).append(")").toString();
    }

    /**
     * 传入mapper接口class
     *
     * @param clazz
     * @return
     */
    private String updateEntityById(Class<?> clazz) {
        StringBuilder sql = new StringBuilder();
        StringBuilder set = new StringBuilder();
        StringBuilder wheresql = new StringBuilder();
        if (!clazz.isAnnotationPresent(Table.class)) {
            sql.append("UPDATE  " + clazz.getName());
        } else {
            Table table = clazz.getAnnotation(Table.class);
            if ("".equals(table.name())) {
                sql.append("UPDATE  ").append(clazz.getName());
            } else {
                sql.append("UPDATE  ").append(table.name());
            }
        }
        Field[] files = clazz.getDeclaredFields();
        set.append(" set ");
        wheresql.append(" where 1=1 ");
        for (Field field : files) {
            field.setAccessible(true);
            if (field.isAnnotationPresent(Column.class)) {
                Column column = field.getAnnotation(Column.class);
                if (!field.isAnnotationPresent(Id.class)) {//判断字段不为主键
                    if (column.name().equals("")) {
                        set.append(field.getName() + " = #{" + field.getName() + "} ,");
                    } else {
                        set.append(column.name() + " = #{" + field.getName() + "} ,");
                    }
                } else {
                    if (column.name().equals("")) {
                        wheresql.append(" and " + field.getName() + " = #{" + field.getName() + "},");
                    } else {
                        wheresql.append(" and " + column.name() + " = #{" + column.name() + "},");
                    }
                }
            } else {
                set.append(field.getName() + " = #{" + field.getName() + "} ,");
            }
        }
        if (wheresql.equals(" where 1=1 ")) {
            throw new RuntimeException("实体变量没有设置ID字段值");
        }
        sql.append(set.substring(0, set.length() - 1)).append(wheresql.substring(0, wheresql.length() - 1));
        return sql.toString();
    }

    private String findEntityAll(Class<?> clazz, Object args, boolean isLike) {
        StringBuilder sql = new StringBuilder();
        StringBuilder whereSQL = new StringBuilder(" where 1=1 ");
        StringBuffer orderBy = new StringBuffer();
        if (!clazz.isAnnotationPresent(Table.class)) {
            sql.append("select * from  " + clazz.getName());
        } else {
            Table table = (Table) clazz.getAnnotation(Table.class);
            if (table.name() == "") {
                sql.append("select * from  " + clazz.getSimpleName());
            } else {
                sql.append("select * from  " + table.name());
            }
        }
        Object[] paramObjs = (Object[]) ((Map) args).get("array");
        if (paramObjs != null && paramObjs.length > 0) {
            Object param = paramObjs[0];
            if (param != null) {
                if (param instanceof Map) {
                    Map<String, Object> map = (Map) param;
                    if (map.containsKey("orderBy")) {
                        orderBy.append(" order by " + map.get("orderBy"));
                    }
                    if (map.containsKey("sortby")) {
                        orderBy.append(" " + map.get("sortby") + " ");
                    }
                    for (String key : map.keySet()) {
                        if (isLike)
                            whereSQL.append(" and " + key + " like '%" + map.get(key) + "%',");
                        else whereSQL.append(" and " + key + " = '" + map.get(key) + "',");
                    }
                    sql.append(whereSQL.subSequence(0, whereSQL.length() - 1)).append(orderBy);
                }
            }
        }
        return sql.toString();
    }

    private String findEntityById(Class<?> clazz) {
        StringBuilder sql = new StringBuilder();
        if (!clazz.isAnnotationPresent(Table.class)) {
            StringBuffer table = new StringBuffer("t");
            String simpleName = clazz.getSimpleName();
            for (int i = 0; i < simpleName.length(); i++) {
                char ch = simpleName.charAt(i);
                if (Character.isUpperCase(ch)) {
                    table.append("_" + Character.toLowerCase(ch));
                } else {
                    table.append(ch);
                }
            }
            sql.append("select * from  " + table);
        } else {
            Table table = (Table) clazz.getAnnotation(Table.class);
            if (table.name() == "") {
                sql.append("select * from  " + clazz.getSimpleName());
            } else {
                sql.append("select * from  " + table.name());
            }
        }
        sql.append("  where 1=1 ");
        Field[] fields = clazz.getDeclaredFields();
        boolean flag = false;
        for (Field field : fields) {
            field.setAccessible(true);
            if (field.isAnnotationPresent(Id.class)) {
                Id id = field.getAnnotation(Id.class);
                flag = true;
                sql.append(" and " + field.getName() + " = #{" + field.getName() + "}");
                break;
            }
        }
        if (!flag) {
            sql.append(" and id = #{id}");
        }

        return sql.toString();
    }

    public String deleteById(Class<?> clazz) {
        StringBuilder sql = new StringBuilder();
        StringBuilder whereSql = new StringBuilder(" where 1=1 ");
        if (!clazz.isAnnotationPresent(Table.class)) {
            sql.append("delete  " + clazz.getName());
        } else {
            Table table = (Table) clazz.getAnnotation(Table.class);
            if (table.name() == "") {
                sql.append("delete  ").append(clazz.getName());
            } else {
                sql.append("delete  ").append(table.name());
            }
        }
        Field[] files = clazz.getDeclaredFields();
        for (Field file : files) {
            file.setAccessible(true);
            if (file.isAnnotationPresent(Column.class)) {
                Column column = file.getAnnotation(Column.class);
                if (file.isAnnotationPresent(Id.class)) {//判断字段不为主键
                    if (column.name().equals("")) {
                        whereSql.append(" and " + file.getName() + " = #{" + file.getName() + "},");
                    } else {
                        whereSql.append(" and " + column.name() + " = #{" + column.name() + "},");
                    }
                }
            }
        }
        if (whereSql.equals(" where 1=1 ")) {
            throw new RuntimeException("实体变量没有设置ID字段值");
        }
        sql.append(whereSql.substring(0, whereSql.length() - 1));
        return sql.toString();
    }

    public String queryByVo(Class<?> clazz, Object args, boolean islike) {
        StringBuilder sql = new StringBuilder();
        StringBuilder whereSQL = new StringBuilder(" where 1=1 ");
        StringBuilder orderBySQL = new StringBuilder("");
        if (!clazz.isAnnotationPresent(Table.class)) {
            sql.append("select *  from " + clazz.getName());
        } else {
            Table table = (Table) clazz.getAnnotation(Table.class);
            if (table.name() == "") {
                sql.append("select * from " + clazz.getName());
            } else {
                sql.append("select * from " + table.name());
            }
        }
        if (args instanceof Map) {
            Map map = (Map) args;
            Object[] arr = (Object[]) map.get("param3");
            if (arr.length > 0) {
                Map<String, Object> params = (Map) arr[0];
                if (params.containsKey("orderby")) {
                    orderBySQL.append(" order by " + params.get("orderby"));
                }
                if (params.containsKey("sortby")) {
                    orderBySQL.append(" " + params.get("sortby") + " ");
                }
                for (String key : params.keySet()) {
                    if (key.equals("orderby") || key.equals("sortby")) {
                        continue;
                    }
                    if (islike)
                        whereSQL.append(" and " + key + " like '%" + params.get(key) + "%',");
                    else whereSQL.append(" and " + key + " = '" + params.get(key) + "',");
                }
            }
        }

        return sql.append(whereSQL.substring(0, whereSQL.length() - 1)).append(orderBySQL).toString();
    }

    public String count(Class<?> clazz, Object args) {
        StringBuilder sql = new StringBuilder();
        StringBuilder whereSQL = new StringBuilder(" where 1=1 ");
        if (!clazz.isAnnotationPresent(Table.class)) {
            sql.append("select count(*)  from " + clazz.getName());
        } else {
            Table table = (Table) clazz.getAnnotation(Table.class);
            if (table.name() == "") {
                sql.append("select count(*) from " + clazz.getName());
            } else {
                sql.append("select count(*) from " + table.name());
            }
        }
        Object[] paramObjs = (Object[]) ((Map) args).get("array");
        if (paramObjs != null && paramObjs.length > 0) {
            Object param = paramObjs[0];
            if (param != null) {
                if (param instanceof Map) {
                    Map<String, Object> map = (Map) param;
                    for (String key : map.keySet()) {
                        whereSQL.append(" and " + key + " = '" + map.get(key) + "',");
                    }
                    sql.append(whereSQL.subSequence(0, whereSQL.length() - 1));
                }
            }
        }
        return sql.toString();
    }

    public String deleteByCondition(Class<?> clazz, Object param) {
        StringBuilder sql = new StringBuilder();
        StringBuilder whereSQL = new StringBuilder(" where 1=1 ");
        if (!clazz.isAnnotationPresent(Table.class)) {
            sql.append("delete  " + clazz.getName());
        } else {
            Table table = (Table) clazz.getAnnotation(Table.class);
            if (table.name() == "") {
                sql.append("delete  " + clazz.getName());
            } else {
                sql.append("delete  " + table.name());
            }
        }
        if (param != null) {
            if (param instanceof Map) {
                Map<String, Object> map = (Map) param;
                for (String key : map.keySet()) {
                    whereSQL.append(" and " + key + " = '" + map.get(key) + "',");
                }
                sql.append(whereSQL.subSequence(0, whereSQL.length() - 1));
            }
        }
        if (whereSQL.equals(" where 1=1 ")) {
            throw new RuntimeException("实体变量没有设置ID字段值");
        }
        return sql.toString();
    }

    private static MapperSqlHelper App() {
        return new MapperSqlHelper();
    }

    public static String getExecuSQL(Class<?> clazz, String mapperDBsql, Object param) {
        if (mapperDBsql.equals("GD.getEntities")) {
            return MapperSqlHelper.App().findEntityAll(clazz, param, false);//条件查询实体列表
        } else if (mapperDBsql.equals("GD.getEntityById")) {
            return MapperSqlHelper.App().findEntityById(clazz);//id查询实体
        } else if (mapperDBsql.equals("GD.getEntitiesLike")) {
            return MapperSqlHelper.App().findEntityAll(clazz, param, true);//条件查询实体列表
        } else if (mapperDBsql.equals("GD.insertEntity")) {
            return MapperSqlHelper.App().insertEntity(clazz);//保存单一实体
        } else if (mapperDBsql.equals("GD.updateEntityById")) {
            return MapperSqlHelper.App().updateEntityById(clazz);//保存单一实体
        } else if (mapperDBsql.equals("GD.deleteById")) {
            return MapperSqlHelper.App().deleteById(clazz);
        } else if (mapperDBsql.equals("GD.deleteByCondition")) {
            return MapperSqlHelper.App().deleteByCondition(clazz, param);
        } else if (mapperDBsql.equals("GD.count.condition")) {
            return MapperSqlHelper.App().count(clazz, param);
        } else if (mapperDBsql.equals("GD.queryByVo")) {
            return MapperSqlHelper.App().queryByVo(clazz, param, false);
        } else if (mapperDBsql.equals("GD.queryByVoLike")) {
            return MapperSqlHelper.App().queryByVo(clazz, param, true);
        }
        return null;
    }

    //预留接口
    private String updateEntityByConditions(Class<?> clazz, Object param) {

        return null;
    }

    public void getParam(Object param) {
        StringBuffer bf = new StringBuffer();
        if (isPrimitiveType(param.getClass())) {
            bf.append(param);
        } else if (param instanceof Map) {
            Map<String, Object> map = (Map) param;
        }
    }

    public static boolean isPrimitiveType(Class clazz) {
        return clazz != null && (clazz.isPrimitive() || clazz.equals(Long.class) || clazz.equals(Integer.class)
                || clazz.equals(Short.class) || clazz.equals(Byte.class) || clazz.equals(Double.class)
                || clazz.equals(Float.class) || clazz.equals(Boolean.class) || clazz.equals(Character.class) || clazz.equals(String.class));
    }
}
