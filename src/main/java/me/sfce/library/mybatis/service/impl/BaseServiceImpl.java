package me.sfce.library.mybatis.service.impl;

import me.sfce.library.mybatis.domain.BasePojo;
import me.sfce.library.mybatis.persistence.BaseMapper;
import me.sfce.library.mybatis.service.BaseService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-31
 * Time: 下午4:50
 */
public abstract class BaseServiceImpl<T extends BasePojo> implements BaseService<T> {

    public abstract BaseMapper<T> getMapper();

    public abstract T buildEntity(Object id);

    @Override
    @Transactional(readOnly = false)
    public void save(T t) {
        getMapper().insert(t);
    }

    @Override
    @Transactional(readOnly = false)
    public void update(T t) {
        getMapper().update(t);
    }

    @Override
    @Transactional(readOnly = false)
    public void delete(Object id) {
        getMapper().delete(buildEntity(id));
    }

    @Override
    @Transactional(readOnly = true)
    public List<T> listAll() {
        return getMapper().list(buildEntity(null));
    }

    @Override
    @Transactional(readOnly = true)
    public T getById(Object id) {
        return getMapper().getById(buildEntity(id));
    }
}
