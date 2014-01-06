package me.sfce.library.mybatis.domain;

import com.alibaba.fastjson.JSON;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-30
 * Time: 下午4:20
 */
public class BasePojo implements Serializable {
    private transient static Map<Class<? extends BasePojo>, List<String>> columnMap = new HashMap();

    public BasePojo() {
        calculateColumnList(false);
    }

    public BasePojo(boolean byAnnotation) {
        calculateColumnList(byAnnotation);
    }

    public String tableName() {
        Table table = this.getClass().getAnnotation(Table.class);
        if (table != null)
            return table.name();
        else {
            StringBuffer tableName = new StringBuffer("t");
            String simpleName = this.getClass().getSimpleName();
            for (int i = 0; i < simpleName.length(); i++) {
                char ch = simpleName.charAt(i);
                if (Character.isUpperCase(ch)) {
                    tableName.append("_" + Character.toLowerCase(ch));
                } else {
                    tableName.append(ch);
                }
            }
            return tableName.toString();
        }
    }

    public String id() {
        for (Field field : this.getClass().getDeclaredFields()) {
            if (field.isAnnotationPresent(Id.class))
                return field.getName();
        }
        return "id";
    }

    private boolean isNull(String fieldName) {
        try {
            Field field = this.getClass().getDeclaredField(fieldName);
            return isNull(field);
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean isNull(Field field) {
        try {
            field.setAccessible(true);
            return field.get(this) == null;
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void calculateColumnList(boolean byAnnotation) {
        if (columnMap.containsKey(this.getClass()))
            return;

        Field[] fields = this.getClass().getDeclaredFields();
        List<String> columnList = new ArrayList(fields.length);

        for (Field field : fields) {
            if (!byAnnotation || field.isAnnotationPresent(Column.class)) {
                if (!field.getType().isAssignableFrom(Collection.class)) {
                    columnList.add(field.getName());
                }
            }
        }
        Class<?> superclass = this.getClass().getSuperclass();
        if (superclass != BasePojo.class) {
            fields = superclass.getDeclaredFields();

            for (Field field : fields) {
                if (!byAnnotation || field.isAnnotationPresent(Column.class)) {
                    if (!Collection.class.isAssignableFrom(field.getType())) {
                        columnList.add(field.getName());
                    }
                }
            }
        }
        columnMap.put(this.getClass(), columnList);
    }

    public class WhereColumn {
        public String name;
        public boolean isString;

        public WhereColumn(String name, boolean isString) {
            this.name = name;
            this.isString = isString;
        }
    }

    public List<WhereColumn> getWhereColumnsName(boolean byAnnotation) {
        Field[] fields = this.getClass().getDeclaredFields();
        List<WhereColumn> columnList = new ArrayList(fields.length);

        for (Field field : fields) {
            if (!isNull(field))
                if (!byAnnotation || field.isAnnotationPresent(Column.class))
                    columnList.add(new WhereColumn(field.getName(), field.getGenericType().equals(String.class)));
        }

        return columnList;
    }

    public String getInsertColumnsName() {
        StringBuilder sb = new StringBuilder();

        List<String> list = columnMap.get(this.getClass());
        int i = 0;
        for (String column : list) {
            if (isNull(column))
                continue;
            if (i++ != 0)
                sb.append(',');
            sb.append(column);
        }
        return sb.toString();
    }

    public String getInsertColumnsDefine() {
        StringBuilder sb = new StringBuilder();

        List<String> list = columnMap.get(this.getClass());
        int i = 0;
        for (String column : list) {
            if (isNull(column))
                continue;
            if (i++ != 0)
                sb.append(',');
            sb.append("#{").append(column).append('}');
        }
        return sb.toString();
    }

    public String getUpdateSet() {
        StringBuilder sb = new StringBuilder();

        List<String> list = columnMap.get(this.getClass());
        int i = 0;
        for (String column : list) {
            if (isNull(column))
                continue;

            if (i++ != 0)
                sb.append(',');
            sb.append(column).append("=#{").append(column).append('}');
        }
        return sb.toString();
    }

    public String toJSONString() {
        return JSON.toJSONString(this);
    }

    public String toString() {
        Field[] fields = this.getClass().getDeclaredFields();
        StringBuilder sb = new StringBuilder();
        sb.append('[');
        for (Field f : fields) {
            if (Modifier.isStatic(f.getModifiers()) || Modifier.isFinal(f.getModifiers()))
                continue;
            Object value = null;
            try {
                f.setAccessible(true);
                value = f.get(this);
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
            if (value != null)
                sb.append(f.getName()).append('=').append(value).append(',');
        }
        sb.append(']');

        return sb.toString();
    }
}
