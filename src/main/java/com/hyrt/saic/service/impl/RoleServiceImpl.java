package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.Role;
import com.hyrt.saic.dao.RoleMapper;
import com.hyrt.saic.service.RoleService;
import me.sfce.library.mybatis.persistence.BaseMapper;
import me.sfce.library.mybatis.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public Map<Integer, String> getRoleMap() {
        List<Role> roles = listAll();
        Map<Integer, String> roleMap = new HashMap<>();
        for (Role role : roles) {
            roleMap.put(role.getId(), role.getRoleName());
        }
        return roleMap;
    }
}
