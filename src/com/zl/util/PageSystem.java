package com.zl.util;

import java.util.List;

public class PageSystem<T> {

    private int flag;//标志
    private int total;//总条数
    private int limit;//分页大小
    private int page; //当前页数
    private int pages;//总页数
    private List<T> data;//数据存储;

    public PageSystem(){

    }

    public PageSystem(int total, List<T> data) {
        this.total = total;
        this.data = data;
    }

    public PageSystem(int flag, int total, int limit, int page, int pages, List<T> data) {
        this.flag = flag;
        this.total = total;
        this.limit = limit;
        this.page = page;
        this.pages = pages;
        this.data = data;
    }

    public PageSystem(int total, int limit, int page, int pages, List<T> data) {
        this.total = total;
        this.limit = limit;
        this.page = page;
        this.pages = pages;
        this.data = data;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
