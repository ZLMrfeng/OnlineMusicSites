package com.zl.server;

import com.zl.bean.Information;

import java.util.List;

public interface InformationServer {
    /**
     * 获取信息列表
     * @return
     */
    public List<Information> getInformationList(Integer page, Integer limit);

    public int countInformation();
    /**
     * 获取特定信息
     * @param informationId
     * @return
     */
    public Information getInformationById(int informationId);

    /**
     * 添加资讯
     * @return
     */
    public boolean addInformation(Information information);

    /**
     * 修改资讯
     * @param information
     * @return
     */
    public boolean updateInformation(Information information);

    /**
     * 删除特定资讯
     * @param informationId
     * @return
     */
    public boolean delInformation(int informationId);
}
