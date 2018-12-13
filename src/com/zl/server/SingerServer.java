package com.zl.server;

import com.zl.bean.Singer;

import java.util.List;

public interface SingerServer {

    /**
     * 获取所有歌手
     * @return
     */
    public List<Singer> getSingerList(Integer page, Integer limit);

    /**
     * 获取某个歌手
     * @param singerId
     * @return
     */
    public Singer getSingerById(int singerId);

    /**
     * 统计歌手
     * @return
     */
    public int getSingerCount();
    /**
     * 添加歌手
     * @param singer
     * @return
     */
    public boolean addSinger(Singer singer);

    /**
     * 修改歌手信息
     * @param singer
     * @return
     */
    public boolean updateSinger(Singer singer);

    /**
     * 通过歌手编号删除歌手
     * @param singerId
     * @return
     */
    public boolean delSinger(int singerId);

}
