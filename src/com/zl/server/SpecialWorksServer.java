package com.zl.server;


import com.zl.bean.SpecialWorks;

import java.util.List;

public interface SpecialWorksServer {
    /**
     * 获取所有信息
     * @param page
     * @param limit
     * @return
     */
    public List<SpecialWorks> getGeneralList(Integer page, Integer limit);

    /**
     * 模糊查询
     * @param songName
     * @return
     */
    public List<SpecialWorks> getSearchList(String songName);
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
    public List<SpecialWorks> getGeneralByIdList(Integer page, Integer limit, int specialId);

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
    public List<SpecialWorks>  getGengralWorksId(int songId);
    /**
     * 获取歌手
     * @param singerId
     * @return
     */
    public List<SpecialWorks> getGengralWorksSingerId(int singerId);
    /**
     * 获取特定的专辑
     * @param specialId
     * @return
     */
    public SpecialWorks getSomeThingList(int specialId);

}
