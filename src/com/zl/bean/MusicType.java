package com.zl.bean;

public class MusicType {

    private int musicType_Id;
    private String musicType_Name;
    private String musicType_Introduction;

    public MusicType() {
    }

    public int getMusicType_Id() {
        return musicType_Id;
    }

    public void setMusicType_Id(int musicType_Id) {
        this.musicType_Id = musicType_Id;
    }

    public String getMusicType_Name() {
        return musicType_Name;
    }

    public void setMusicType_Name(String musicType_Name) {
        this.musicType_Name = musicType_Name;
    }

    public String getMusicType_Introduction() {
        return musicType_Introduction;
    }

    public void setMusicType_Introduction(String musicType_Introduction) {
        this.musicType_Introduction = musicType_Introduction;
    }

    @Override
    public String toString() {
        return "MusicType{" +
                "musicType_Id=" + musicType_Id +
                ", musicType_Name='" + musicType_Name + '\'' +
                ", musicType_Introduction='" + musicType_Introduction + '\'' +
                '}';
    }
}
