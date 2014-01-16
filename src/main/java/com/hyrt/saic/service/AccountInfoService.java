package com.hyrt.saic.service;

import com.hyrt.saic.bean.AccountInfo;
import com.hyrt.saic.bean.AccountInfoKey;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 14-1-6
 * Time: 下午5:59
 * To change this template use File | Settings | File Templates.
 */
public interface AccountInfoService {
    public List select(String userId);
    public Map selectByPage(String userId,Integer page);
}
