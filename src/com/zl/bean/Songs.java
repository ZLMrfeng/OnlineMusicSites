package com.zl.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Songs {

    private int songId;
    private String songName;
    private int singerId;
    private String songLrc;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date songReleseTime;
    private String songLongTime;
    private String songPath;
    public int getSongId() {
        return songId;
    }

    public void setSongId(int songId) {
        this.songId = songId;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public int getSingerId() {
        return singerId;
    }

    public void setSingerId(int singerId) {
        this.singerId = singerId;
    }

    public String getSongLrc() {
        return songLrc;
    }

    public void setSongLrc(String songLrc) {
        this.songLrc = songLrc;
    }

    public Date getSongReleseTime() {
        return songReleseTime;
    }

    public void setSongReleseTime(Date songReleseTime) {
        this.songReleseTime = songReleseTime;
    }

    public int getSongNumberOfClick() {
        return songNumberOfClick;
    }

    public void setSongNumberOfClick(int songNumberOfClick) {
        this.songNumberOfClick = songNumberOfClick;
    }

    private int songNumberOfClick;

    public String getSongLongTime() {
        return songLongTime;
    }

    public void setSongLongTime(String songLongTime) {
        this.songLongTime = songLongTime;
    }

    public String getSongPath() {
        return songPath;
    }

    public void setSongPath(String songPath) {
        this.songPath = songPath;
    }

    public Songs() {
    }

    @Override
    public String toString() {
        return "Songs{" +
                "songId=" + songId +
                ", songName='" + songName + '\'' +
                ", singerId=" + singerId +
                ", songLrc='" + songLrc + '\'' +
                ", songReleseTime=" + songReleseTime +
                ", songLongTime='" + songLongTime + '\'' +
                ", songPath='" + songPath + '\'' +
                ", songNumberOfClick=" + songNumberOfClick +
                '}';
    }
}
