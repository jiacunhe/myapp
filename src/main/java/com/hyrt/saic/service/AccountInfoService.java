package com.hyrt.saic.service;

import com.hyrt.saic.bean.AccountInfo;
import me.sfce.library.mybatis.service.BaseService;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 14-1-6
 * Time: 下午5:59
 */
public interface AccountInfoService extends BaseService<AccountInfo> {
    public List select(String userId);
    public Map selectByPage(String userId,Integer page);
}
