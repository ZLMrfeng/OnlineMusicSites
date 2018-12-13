package com.zl.server;

import com.zl.bean.GeneralWorks;

import java.util.List;

public interface GeneralWorksServer {
    /**
     * 获取所有信息
     * @param page
     * @param limit
     * @return
     */
    public List<GeneralWorks> getGeneralList(Integer page,Integer limit);

    /**
     * 模糊查询
     * @param songName
     * @return
     */
    public List<GeneralWorks> getSearchList(String songName);
    /**
     * 统计记录
     * @return
     */
    public int getGeneralCount();

    /**
     * 获得某歌手的所有信息
     * @param page
     * @param limit
     * @return
     */
    public List<GeneralWorks> getGeneralByIdList(Integer page,Integer limit,int singerId);

    /**
     * 指定歌手的歌曲总数
     * @param singerId
     * @return
     */
    public int getCeneralByIdCount(int singerId);

    /**
     * 获取特定的歌曲集
     * @param songId
     * @return
     */
    public List<GeneralWorks>  getGengralWorksId(int songId);

    /**
     * 获取歌曲
     * @param songId
     * @return
     */
    public GeneralWorks getGengralWorksById(int songId);
    /**
     * 获取歌手
     * @param singerId
     * @return
     */
    public List<GeneralWorks> getGengralWorksSingerId(int singerId);

    /**
     * 获取特定歌手
     * @param singerId
     * @return
     */
    public GeneralWorks getGengralWorksBySingerId(int singerId);

}
