package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.SysMessage;
import com.hyrt.saic.dao.SysMessageMapper;
import com.hyrt.saic.service.SysMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 14-1-27
 * Time: 上午9:52
 * To change this template use File | Settings | File Templates.
 */
@Service
public class SysMessageServiceImpl implements SysMessageService {
    @Autowired
    SysMessageMapper sysMessageMapper;

    @Override
    public void messageSubmit(SysMessage sysMessage) {
        sysMessageMapper.insertSelective(sysMessage);
    }
}
