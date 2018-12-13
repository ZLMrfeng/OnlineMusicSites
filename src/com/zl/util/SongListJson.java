package com.zl.util;

import java.util.List;

public class SongListJson<T> {

    private List<T> data;

    public SongListJson(){

    }
    public SongListJson(List<T> data) {
        this.data = data;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
