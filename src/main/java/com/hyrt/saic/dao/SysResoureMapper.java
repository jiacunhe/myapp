package com.hyrt.saic.dao;

import com.hyrt.saic.bean.SysResoure;

import java.util.List;

public interface SysResoureMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysResoure record);

    int insertSelective(SysResoure record);

    SysResoure selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysResoure record);

    int updateByPrimaryKey(SysResoure record);

    List getAllSysResource();
    List getAllSysResourcewithoutTree();
    List getChildSysResource(Integer pid);
}