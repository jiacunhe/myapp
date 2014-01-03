package me.sfce.library.mybatis.service;

import me.sfce.library.mybatis.domain.BasePojo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-31
 * Time: 下午4:42
 */
public interface BaseService<T extends BasePojo> {
    void save(T t);

    void update(T t);

    void delete(Object id);

    List<T> listAll();

    T getById(Object id);
}
