package com.hyrt.saic.ex;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-8
 * Time: 下午8:10
 */
public class Function {

    public static boolean contains(java.util.Collection collection, Object object) {
        if (collection == null) {
            return false;
        } else {
            return collection.contains(object);
        }
    }
}
