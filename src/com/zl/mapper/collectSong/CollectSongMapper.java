package com.zl.mapper.collectSong;

import com.zl.bean.CollectSong;

import java.util.List;

public interface CollectSongMapper {

    /**
     * 展示某用户所有收藏的内容
     * @param page
     * @param limit
     * @return
     */
    public List<CollectSong> getCollectSongList(Integer page,Integer limit,int userId);

    /**
     * 收藏内容
     * @param collectSong
     * @return
     */
    public boolean addCollectSong(CollectSong collectSong);

    /**
     * 删除某个收藏的内容
     * @param collectId
     * @return
     */
    public boolean delCollectSong(int collectId);
}
