package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.User;
import com.hyrt.saic.dao.CommonMapper;
import com.hyrt.saic.dao.UserMapper;
import com.hyrt.saic.service.TestService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-23
 * Time: 下午3:44
 * To change this template use File | Settings | File Templates.
 */
@Service("TestService")
public class TestServiceImpl<T> implements TestService {


    @Autowired
    private UserMapper userMapper;


    @Override
    @Transactional
    public void testTransaction(User u,User u2) {
        userMapper.insert(u) ;
        userMapper.insert(u2) ;
    }



}
