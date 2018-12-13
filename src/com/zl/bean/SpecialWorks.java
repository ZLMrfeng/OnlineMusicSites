package com.zl.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class SpecialWorks {
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
    private int specialId;
    private String specialName;
    private String specialImage;
    private String spcialIntroduction;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date  specialRelesetime;
    private int specialVisitorVolume;

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

    public String getSongPath() {
        return songPath;
    }

    public void setSongPath(String songPath) {
        this.songPath = songPath;
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

    public int getSpecialId() {
        return specialId;
    }

    public void setSpecialId(int specialId) {
        this.specialId = specialId;
    }

    public String getSpecialName() {
        return specialName;
    }

    public void setSpecialName(String specialName) {
        this.specialName = specialName;
    }

    public String getSpecialImage() {
        return specialImage;
    }

    public void setSpecialImage(String specialImage) {
        this.specialImage = specialImage;
    }

    public String getSpcialIntroduction() {
        return spcialIntroduction;
    }

    public void setSpcialIntroduction(String spcialIntroduction) {
        this.spcialIntroduction = spcialIntroduction;
    }

    public Date getSpecialRelesetime() {
        return specialRelesetime;
    }

    public void setSpecialRelesetime(Date specialRelesetime) {
        this.specialRelesetime = specialRelesetime;
    }

    public int getSpecialVisitorVolume() {
        return specialVisitorVolume;
    }

    public void setSpecialVisitorVolume(int specialVisitorVolume) {
        this.specialVisitorVolume = specialVisitorVolume;
    }
}
