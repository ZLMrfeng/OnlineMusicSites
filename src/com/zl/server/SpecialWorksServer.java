package com.zl.server;


import com.zl.bean.SpecialWorks;

import java.util.List;

public interface SpecialWorksServer {
    /**
     * ��ȡ������Ϣ
     * @param page
     * @param limit
     * @return
     */
    public List<SpecialWorks> getGeneralList(Integer page, Integer limit);

    /**
     * ģ����ѯ
     * @param songName
     * @return
     */
    public List<SpecialWorks> getSearchList(String songName);
    /**
     * ͳ�Ƽ�¼
     * @return
     */
    public int getGeneralCount();

    /**
     * ���ĳ���ֵ�������Ϣ
     * @param page
     * @param limit
     * @return
     */
    public List<SpecialWorks> getGeneralByIdList(Integer page, Integer limit, int specialId);

    /**
     * ָ�����ֵĸ�������
     * @param singerId
     * @return
     */
    public int getCeneralByIdCount(int singerId);

    /**
     * ��ȡ�ض��ĸ�����
     * @param songId
     * @return
     */
    public List<SpecialWorks>  getGengralWorksId(int songId);
    /**
     * ��ȡ����
     * @param singerId
     * @return
     */
    public List<SpecialWorks> getGengralWorksSingerId(int singerId);
    /**
     * ��ȡ�ض���ר��
     * @param specialId
     * @return
     */
    public SpecialWorks getSomeThingList(int specialId);

}
