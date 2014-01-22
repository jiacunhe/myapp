package com.hyrt.saic.service;

import com.hyrt.saic.bean.UserOperation;
import me.sfce.library.mybatis.service.BaseService;
import me.sfce.library.mybatis.util.Page;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-16
 * Time: 上午10:51
 */
public interface UserOperationService extends BaseService<UserOperation> {
    public List<UserOperation> getAllListDescByDate(Page page);
}
