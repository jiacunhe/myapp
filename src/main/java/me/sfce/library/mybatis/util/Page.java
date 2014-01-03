package me.sfce.library.mybatis.util;

import me.sfce.library.mybatis.domain.BasePojo;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-28
 * Time: 上午10:35
 */
public class Page<T> extends HashMap<String, Object> {
    private int pageNo = 1;//页码，默认是第一页
    private int pageSize = 15;//每页显示的记录数，默认是15
    private int totalRecord;//总记录数
    private int totalPage;//总页数
    private List<T> results;//对应的当前页记录

    public BasePojo getPojo() {
        return pojo;
    }

    public void setPojo(BasePojo pojo) {
        this.pojo = pojo;
    }

    private BasePojo pojo; //for baseMapper

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
        //在设置总页数的时候计算出对应的总页数。
        this.totalPage = (totalRecord - 1) / pageSize + 1;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public List<T> getResults() {
        return results;
    }

    public void setResults(List<T> results) {
        this.results = results;
    }

    public void addBean(Object obj) {
        Field[] fields = obj.getClass().getDeclaredFields();

        for (Field field : fields) {
            String name = field.getName();
            Object value = ReflectUtil.getFieldValue(obj, name);
            if (value != null)
                put(name, value);
        }
    }
}
