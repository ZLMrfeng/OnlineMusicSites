package com.zl.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class GeneralWorks  {
   private int songId;
   private String songName;
   private String songLrc;
   @JsonFormat(pattern = "yyyy-MM-dd")
   private Date songReleseTime;
   private String songLongTime;
   private int songNumberOfClick;
   private String songPath;
   private int singerId;
   private String singernameChinese;
   private String singernameForgin;
   private String singernameArt;
   private String singerImage;
   private String singerIntroduction;

   public GeneralWorks(){
   }
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

    public String getSongLongTime() {
        return songLongTime;
    }

    public void setSongLongTime(String songLongTime) {
        this.songLongTime = songLongTime;
    }

    public int getSongNumberOfClick() {
        return songNumberOfClick;
    }

    public void setSongNumberOfClick(int songNumberOfClick) {
        this.songNumberOfClick = songNumberOfClick;
    }

    public int getSingerId() {
        return singerId;
    }

    public void setSingerId(int singerId) {
        this.singerId = singerId;
    }

    public String getSingernameChinese() {
        return singernameChinese;
    }

    public void setSingernameChinese(String singernameChinese) {
        this.singernameChinese = singernameChinese;
    }

    public String getSingernameForgin() {
        return singernameForgin;
    }

    public void setSingernameForgin(String singernameForgin) {
        this.singernameForgin = singernameForgin;
    }

    public String getSingernameArt() {
        return singernameArt;
    }

    public void setSingernameArt(String singernameArt) {
        this.singernameArt = singernameArt;
    }

    public String getSingerImage() {
        return singerImage;
    }

    public void setSingerImage(String singerImage) {
        this.singerImage = singerImage;
    }

    public String getSingerIntroduction() {
        return singerIntroduction;
    }

    public void setSingerIntroduction(String singerIntroduction) {
        this.singerIntroduction = singerIntroduction;
    }

    public String getSongPath() {
        return songPath;
    }

    public void setSongPath(String songPath) {
        this.songPath = songPath;
    }

    @Override
    public String toString() {
        return "GeneralWorks{" +
                "songId=" + songId +
                ", songName='" + songName + '\'' +
                ", songLrc='" + songLrc + '\'' +
                ", songReleseTime=" + songReleseTime +
                ", songLongTime='" + songLongTime + '\'' +
                ", songNumberOfClick=" + songNumberOfClick +
                ", songPath='" + songPath + '\'' +
                ", singerId=" + singerId +
                ", singernameChinese='" + singernameChinese + '\'' +
                ", singernameForgin='" + singernameForgin + '\'' +
                ", singernameArt='" + singernameArt + '\'' +
                ", singerImage='" + singerImage + '\'' +
                ", singerIntroduction='" + singerIntroduction + '\'' +
                '}';
    }
}
