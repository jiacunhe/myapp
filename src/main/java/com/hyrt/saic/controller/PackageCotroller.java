package com.hyrt.saic.controller;

import com.hyrt.saic.service.PackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 13-12-26
 * Time: 下午2:41
 * To change this template use File | Settings | File Templates.
 * 套餐的修改
 */
@Controller
@RequestMapping("/package")
public class PackageCotroller {
    @Autowired
    private PackageService packageService;


}
