package com.hyrt.saic.dao;

import com.hyrt.saic.bean.SysMessage;
import me.sfce.library.mybatis.util.Page;

import java.util.List;

public interface SysMessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysMessage record);

    int insertSelective(SysMessage record);

    SysMessage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysMessage record);

    int updateByPrimaryKey(SysMessage record);

    List<SysMessage> getUserMessageList(Page page);

    void   changeMessageStatus(String messageIds);

    void   deleteMessageByIds(String messageIds);
}