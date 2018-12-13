package com.zl.server;

import com.zl.bean.CollectSong;

import java.util.List;

public interface CollectSongServer {

    /**
     * չʾĳ�û������ղص�����
     * @param page
     * @param limit
     * @return
     */
    public List<CollectSong> getCollectSongList(Integer page, Integer limit, int userId);

    /**
     * �ղ�����
     * @param collectSong
     * @return
     */
    public boolean addCollectSong(CollectSong collectSong);

    /**
     * ɾ��ĳ���ղص�����
     * @param collectId
     * @return
     */
    public boolean delCollectSong(int collectId);


}
