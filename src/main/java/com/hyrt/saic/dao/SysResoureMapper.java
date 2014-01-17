package com.hyrt.saic.dao;

import com.hyrt.saic.bean.SysResource;

import java.util.List;

public interface SysResoureMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysResource record);

    int insertSelective(SysResource record);

    SysResource selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysResource record);

    int updateByPrimaryKey(SysResource record);

    List getAllSysResource();
    List getAllSysResourcewithoutTree();
    List getChildSysResource(Integer pid);
}