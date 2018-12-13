package com.zl.server;

import com.zl.bean.Special;

import java.util.List;

public interface SpecialServer {
    /**
     * 获取专辑列表
     * @param page
     * @param limit
     * @return
     */
    public List<Special> getSpecialList(Integer page , Integer limit);

    /**
     * 获取特定专辑
     * @param specialId
     * @return
     */
    public Special getSpecialById(int specialId);

    /**
     * 获取总数
     * @return
     */
    public int getSpecialCount();

    /**
     * 添加专辑
     * @param special
     * @return
     */
    public boolean addSpecial(Special special);

    /**
     * 修改专辑信息
     * @param special
     * @return
     */
    public boolean updateSpecial(Special special);

    /**
     * 删除专辑
     * @param specialId
     * @return
     */
    public boolean delSpecial(int specialId);
}
