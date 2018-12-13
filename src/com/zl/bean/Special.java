package com.zl.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Special {

    private int specialId;
    private String specialName;
    private String specialImage;
    private String specialIntroduction;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date specialReleseTime;
    private int specialVisitorVolume;
    private Songs song;
    public Special() {
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

    public Songs getSong() {
        return song;
    }

    public void setSong(Songs song) {
        this.song = song;
    }

    public String getSpecialIntroduction() {
        return specialIntroduction;
    }

    public void setSpecialIntroduction(String specialIntroduction) {
        this.specialIntroduction = specialIntroduction;
    }

    public Date getSpecialReleseTime() {
        return specialReleseTime;
    }

    public void setSpecialReleseTime(Date specialReleseTime) {
        this.specialReleseTime = specialReleseTime;
    }

    public int getSpecialVisitorVolume() {
        return specialVisitorVolume;
    }

    public void setSpecialVisitorVolume(int specialVisitorVolume) {
        this.specialVisitorVolume = specialVisitorVolume;
    }

    @Override
    public String toString() {
        return "Special{" +
                "specialId=" + specialId +
                ", specialName='" + specialName + '\'' +
                ", specialImage='" + specialImage + '\'' +
                ", specialIntroduction='" + specialIntroduction + '\'' +
                ", specialReleseTime=" + specialReleseTime +
                ", specialVisitorVolume=" + specialVisitorVolume +
                ", song=" + song +
                '}';
    }
}
