package com.zl.server;

import com.zl.bean.Information;

import java.util.List;

public interface InformationServer {
    /**
     * ��ȡ��Ϣ�б�
     * @return
     */
    public List<Information> getInformationList(Integer page, Integer limit);

    public int countInformation();
    /**
     * ��ȡ�ض���Ϣ
     * @param informationId
     * @return
     */
    public Information getInformationById(int informationId);

    /**
     * �����Ѷ
     * @return
     */
    public boolean addInformation(Information information);

    /**
     * �޸���Ѷ
     * @param information
     * @return
     */
    public boolean updateInformation(Information information);

    /**
     * ɾ���ض���Ѷ
     * @param informationId
     * @return
     */
    public boolean delInformation(int informationId);
}
