package com.zl.server;

import com.zl.bean.GeneralWorks;

import java.util.List;

public interface GeneralWorksServer {
    /**
     * ��ȡ������Ϣ
     * @param page
     * @param limit
     * @return
     */
    public List<GeneralWorks> getGeneralList(Integer page,Integer limit);

    /**
     * ģ����ѯ
     * @param songName
     * @return
     */
    public List<GeneralWorks> getSearchList(String songName);
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
    public List<GeneralWorks> getGeneralByIdList(Integer page,Integer limit,int singerId);

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
    public List<GeneralWorks>  getGengralWorksId(int songId);

    /**
     * ��ȡ����
     * @param songId
     * @return
     */
    public GeneralWorks getGengralWorksById(int songId);
    /**
     * ��ȡ����
     * @param singerId
     * @return
     */
    public List<GeneralWorks> getGengralWorksSingerId(int singerId);

    /**
     * ��ȡ�ض�����
     * @param singerId
     * @return
     */
    public GeneralWorks getGengralWorksBySingerId(int singerId);

}
