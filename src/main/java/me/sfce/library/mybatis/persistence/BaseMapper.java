package me.sfce.library.mybatis.persistence;

import me.sfce.library.mybatis.domain.BasePojo;
import me.sfce.library.mybatis.persistence.sql.BaseProvider;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-30
 * Time: 下午4:19
 */
public interface BaseMapper<T extends BasePojo> {

    @ResultMap({"BaseResultMap"})
    @SelectProvider(type = BaseProvider.class, method = "list")
    public List<T> list(T t);

    @SelectProvider(type = BaseProvider.class, method = "getById")
    @ResultMap({"BaseResultMap"})
    public T getById(T t);

    @InsertProvider(type = BaseProvider.class, method = "insert")
    public void insert(T t);

    @UpdateProvider(type = BaseProvider.class, method = "update")
    public void update(T t);

    @DeleteProvider(type = BaseProvider.class, method = "delete")
    public void delete(T t);
}
