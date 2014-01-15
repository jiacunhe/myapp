package com.hyrt.saic.service;

import com.hyrt.saic.bean.Role;
import com.hyrt.saic.bean.RoleSysResource;

import java.util.HashMap;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hyrt001
 * Date: 14-1-3
 * Time: 上午11:04
 * To change this template use File | Settings | File Templates.
 */

public interface RoleResourceService {
/*


 */
    public List getAllRoles();
    public Role selectByPrimaryKey(Integer roleid);
    //获取所有根节点的资源带树形结构
    public List getAllSysResource();
    //获取所有根节点的资源不带树形结构
    public List getAllSysResourcewithoutTree();
    public void updateByPrimaryKeySelective(Role role);
    public void deleteResoureByRole(HashMap<String, String> hashMap) ;
    public void insertResoureByRoel(List<RoleSysResource> roleSysResources)  ;
    public void deleteRole(String roleids);
    public void inserRole(Role role, String[] roleresource);
    public List getChiledResoureBypid( Integer pid);

    public List getRoleNamebyString(String rolename);

    public List getResoureByUserRoleids(String roleids);

    public List getRolesByuserid(String userid);


}
