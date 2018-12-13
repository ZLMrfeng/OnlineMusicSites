package com.zl.util;

public class StringEmpty {

    public static boolean isEmpty(String countName){
        if(countName != null && !(countName.equals(""))){
            return true;
        }
        return false;
    }
}
