package com.zl.util;

import com.google.gson.Gson;

import java.util.List;

public class RequestJsons <T>{

    private int code;
    private String message;
    private int count;
    private List<T> dataList;

    public RequestJsons(){

    }

    public RequestJsons(int code, String message, int count, List<T> dataList) {
        this.code = code;
        this.message = message;
        this.count = count;
        this.dataList = dataList;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    public String toJson(){
        Gson gson = new Gson();
        String json = gson.toJson(this);
        return json;
    }
}
