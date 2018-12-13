package com.zl.server;

import com.zl.bean.Song;
import com.zl.bean.Songs;

import java.util.List;

public interface SongServer {
    /**
     * ��ȡ���и���
     * @param page
     * @param limit
     * @return
     */
    public  List<Songs> getSongList(Integer page , Integer limit);

    /**
     * ��ȡ�ض�����
     * @param songId
     * @return
     */
    public Songs getSongById(int songId);

    /**
     * ͳ�Ƹ���
     * @return
     */
    public int getSongCount();

    /**
     * ��Ӹ���
     * @param songs
     * @return
     */
    public boolean addSong(Songs songs);

    /**
     * �޸ĸ���
     * @param songs
     * @return
     */
    public boolean updateSong(Songs songs);

    /**
     * ɾ������
     * @param songId
     * @return
     */
    public boolean delSong(int songId);
}

