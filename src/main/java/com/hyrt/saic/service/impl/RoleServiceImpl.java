package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.Role;
import com.hyrt.saic.dao.RoleMapper;
import com.hyrt.saic.service.RoleService;
import me.sfce.library.mybatis.persistence.BaseMapper;
import me.sfce.library.mybatis.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-31
 * Time: 下午6:36
 */
@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public BaseMapper<Role> getMapper() {
        return roleMapper;
    }

    @Override
    public Role buildEntity(Object id) {
        Role role = new Role();
        if (id != null) {
            role.setId((Integer) id);
        }
        return role;
    }
}
