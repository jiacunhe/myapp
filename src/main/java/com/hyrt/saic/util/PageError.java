package com.hyrt.saic.util;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-13
 * Time: 下午6:45
 */
public class PageError extends RuntimeException {
    public PageError(String message) {
        super(message);
    }
}
