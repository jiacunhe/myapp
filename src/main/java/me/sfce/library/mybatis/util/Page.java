package me.sfce.library.mybatis.util;

import com.hyrt.saic.util.Config;
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
public class Page extends HashMap<String, Object> {
    public Page() {
        setPageSize(Config.PAGE_SIZE);
    }

    public BasePojo getPojo() {
        return (BasePojo) get("pojo");
    }

    public void setPojo(BasePojo pojo) {
        this.put("pojo" ,pojo);
    }

    public int getPageNo() {
        return (int) get("pageNo");
    }

    public void setPageNo(int pageNo) {
        this.put("pageNo", pageNo);
    }

    public int getPageSize() {
        return (int) get("pageSize");
    }

    public void setPageSize(int pageSize) {
        this.put("pageSize", pageSize);
    }

    public int getTotalRecord() {
        return (int) get("totalRecord");
    }

    public void setTotalRecord(int totalRecord) {
        this.put("totalRecord", totalRecord);
        //在设置总页数的时候计算出对应的总页数。
        int pageCount = (totalRecord - 1) / getPageSize() + 1;
        this.put("totalPage", pageCount);
        // 计算开始、结束页码和总页数
        int beginPageIndex = getPageNo() - 4;
        int endPageIndex = getPageNo() + 5;
        if (pageCount < 10) {
            beginPageIndex = 1;
            endPageIndex = pageCount;
        } else {
            if (beginPageIndex < 1) {
                beginPageIndex = 1;
                endPageIndex = 10;
            } else if (endPageIndex > pageCount) {
                endPageIndex = pageCount;
                beginPageIndex = endPageIndex - 9;
            }
        }
        this.put("beginPageIndex", beginPageIndex);
        this.put("endPageIndex", endPageIndex);
    }

    public int getTotalPage() {
        return (int) get("totalPage");
    }

    public void setResults(List<Object> results) {
        this.put("results", results);
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
