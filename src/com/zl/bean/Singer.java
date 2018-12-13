package com.zl.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Singer {

    private int singerId;
    private String singernameChinese;
    private String singernameForgin;
    private String singernameArt;
    private String singerSex;
    private String singerAddress;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date singerBirthday;
    private String singerHobby;
    private String singerProduction;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date singerDebut;
    private String singerIntroduction;
    private String singerImage;
    private String companyName;
    private int singerVisitorVolume;

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

    public String getSingerSex() {
        return singerSex;
    }

    public void setSingerSex(String singerSex) {
        this.singerSex = singerSex;
    }

    public String getSingerAddress() {
        return singerAddress;
    }

    public void setSingerAddress(String singerAddress) {
        this.singerAddress = singerAddress;
    }

    public Date getSingerBirthday() {
        return singerBirthday;
    }

    public void setSingerBirthday(Date singerBirthday) {
        this.singerBirthday = singerBirthday;
    }

    public String getSingerHobby() {
        return singerHobby;
    }

    public void setSingerHobby(String singerHobby) {
        this.singerHobby = singerHobby;
    }

    public String getSingerProduction() {
        return singerProduction;
    }

    public void setSingerProduction(String singerProduction) {
        this.singerProduction = singerProduction;
    }

    public Date getSingerDebut() {
        return singerDebut;
    }

    public void setSingerDebut(Date singerDebut) {
        this.singerDebut = singerDebut;
    }

    public String getSingerIntroduction() {
        return singerIntroduction;
    }

    public void setSingerIntroduction(String singerIntroduction) {
        this.singerIntroduction = singerIntroduction;
    }

    public String getSingerImage() {
        return singerImage;
    }

    public void setSingerImage(String singerImage) {
        this.singerImage = singerImage;
    }


    public int getSingerVisitorVolume() {
        return singerVisitorVolume;
    }

    public void setSingerVisitorVolume(int singerVisitorVolume) {
        this.singerVisitorVolume = singerVisitorVolume;
    }

    public Singer() {
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @Override
    public String toString() {
        return "Singer{" +
                "singerId=" + singerId +
                ", singernameChinese='" + singernameChinese + '\'' +
                ", singernameForgin='" + singernameForgin + '\'' +
                ", singernameArt='" + singernameArt + '\'' +
                ", singerSex='" + singerSex + '\'' +
                ", singerAddress='" + singerAddress + '\'' +
                ", singerBirthday=" + singerBirthday +
                ", singerHobby='" + singerHobby + '\'' +
                ", singerProduction='" + singerProduction + '\'' +
                ", singerDebut=" + singerDebut +
                ", singerIntroduction='" + singerIntroduction + '\'' +
                ", singerImage='" + singerImage + '\'' +
                ", companyName='" + companyName + '\'' +
                ", singerVisitorVolume=" + singerVisitorVolume +
                '}';
    }
}