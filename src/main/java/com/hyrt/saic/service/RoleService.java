package com.hyrt.saic.service;

import com.hyrt.saic.bean.Role;
import me.sfce.library.mybatis.service.BaseService;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-31
 * Time: 下午4:40
 */
public interface RoleService extends BaseService<Role> {
    Map<Integer, String> getRoleMap();
}
