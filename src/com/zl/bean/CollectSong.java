package com.zl.bean;

public class CollectSong {
    private int collectId;
    private int songId;
    private int singerId;
    private int userId;

    public CollectSong() {
    }

    public CollectSong( int singerId, int userId) {
        this.singerId = singerId;
        this.userId = userId;
    }
    public CollectSong(int singerId,int userId,int songId) {
        this.singerId = singerId;
        this.songId = songId;
        this.userId = userId;
    }

    public int getCollectId() {
        return collectId;
    }

    public void setCollectId(int collectId) {
        this.collectId = collectId;
    }

    public int getSongId() {
        return songId;
    }

    public void setSongId(int songId) {
        this.songId = songId;
    }

    public int getSingerId() {
        return singerId;
    }

    public void setSingerId(int singerId) {
        this.singerId = singerId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
