package com.zl.mapper.songList;

import com.zl.bean.SongList;

import java.util.List;

public interface SongListMapper {

    /**
     * 获取所有歌单
     * @param page
     * @param limit
     * @return
     */
    public List<SongList> getSongLists(Integer page,Integer limit);

    /**
     * 创建歌单
     * @param songList
     * @return
     */
    public boolean addSongList(SongList songList);

    /**
     * 删除歌单
     * @param songListId
     * @return
     */
    public boolean delSongList(int songListId);

    /**
     * 更改歌单
     * @param songListId
     * @return
     */
    public boolean updateSongList(int songListId);
}
