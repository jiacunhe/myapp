package com.hyrt.saic.validator;

import com.hyrt.saic.bean.User;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-2
 * Time: 下午6:27
 */
public class UserValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmpty(errors, "userId", "user.userId.required", "请输入用户名");
        ValidationUtils.rejectIfEmpty(errors, "password", "user.password.required", "请输入密码");
    }
}
