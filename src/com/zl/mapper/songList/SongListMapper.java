package com.zl.mapper.songList;

import com.zl.bean.SongList;

import java.util.List;

public interface SongListMapper {

    /**
     * ��ȡ���и赥
     * @param page
     * @param limit
     * @return
     */
    public List<SongList> getSongLists(Integer page,Integer limit);

    /**
     * �����赥
     * @param songList
     * @return
     */
    public boolean addSongList(SongList songList);

    /**
     * ɾ���赥
     * @param songListId
     * @return
     */
    public boolean delSongList(int songListId);

    /**
     * ���ĸ赥
     * @param songListId
     * @return
     */
    public boolean updateSongList(int songListId);
}
