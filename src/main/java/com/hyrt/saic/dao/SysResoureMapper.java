package com.hyrt.saic.dao;

import com.hyrt.saic.bean.SysResource;

import java.util.List;

public interface SysResoureMapper {

    List getAllSysResource();

    List getAllSysResourcewithoutTree();

    List getChildSysResource(Integer pid);
}