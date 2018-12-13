package com.zl.server;

import com.zl.bean.Song;
import com.zl.bean.Songs;

import java.util.List;

public interface SongServer {
    /**
     * 获取所有歌曲
     * @param page
     * @param limit
     * @return
     */
    public  List<Songs> getSongList(Integer page , Integer limit);

    /**
     * 获取特定歌曲
     * @param songId
     * @return
     */
    public Songs getSongById(int songId);

    /**
     * 统计歌曲
     * @return
     */
    public int getSongCount();

    /**
     * 添加歌曲
     * @param songs
     * @return
     */
    public boolean addSong(Songs songs);

    /**
     * 修改歌曲
     * @param songs
     * @return
     */
    public boolean updateSong(Songs songs);

    /**
     * 删除歌曲
     * @param songId
     * @return
     */
    public boolean delSong(int songId);
}

