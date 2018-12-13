package com.zl.util;

import java.util.List;

public class PageSystem<T> {

    private int flag;//��־
    private int total;//������
    private int limit;//��ҳ��С
    private int page; //��ǰҳ��
    private int pages;//��ҳ��
    private List<T> data;//���ݴ洢;

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
