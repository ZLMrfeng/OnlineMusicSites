package com.zl.bean;

public class SongCollection {

    private String name;
    private String artist;
    private String url;
    private String cover;
    private String lrc;


    public SongCollection(){

    }

    public SongCollection(String name, String artist, String url, String cover, String lrc) {
        this.name = name;
        this.artist = artist;
        this.url = url;
        this.cover = cover;
        this.lrc = lrc;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getLrc() {
        return lrc;
    }

    public void setLrc(String lrc) {
        this.lrc = lrc;
    }

    @Override
    public String toString() {
        return "SongCollection{" +
                "name='" + name + '\'' +
                ", artist='" + artist + '\'' +
                ", url='" + url + '\'' +
                ", cover='" + cover + '\'' +
                ", lrc='" + lrc + '\'' +
                '}';
    }
}
