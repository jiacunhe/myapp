package com.hyrt.saic.dao;

import com.hyrt.saic.bean.Role;
import me.sfce.library.mybatis.persistence.BaseMapper;

import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {
    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    List<Role> selectAllRoles();

    List<Role> getByRolename(String rolename);

    List<Role> getRolesByuserid(String userid);

    int insertid(Role role);

    int deleteByroleids(String roleids);


}