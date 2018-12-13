package com.zl.server;

import com.zl.bean.Special;

import java.util.List;

public interface SpecialServer {
    /**
     * ��ȡר���б�
     * @param page
     * @param limit
     * @return
     */
    public List<Special> getSpecialList(Integer page , Integer limit);

    /**
     * ��ȡ�ض�ר��
     * @param specialId
     * @return
     */
    public Special getSpecialById(int specialId);

    /**
     * ��ȡ����
     * @return
     */
    public int getSpecialCount();

    /**
     * ���ר��
     * @param special
     * @return
     */
    public boolean addSpecial(Special special);

    /**
     * �޸�ר����Ϣ
     * @param special
     * @return
     */
    public boolean updateSpecial(Special special);

    /**
     * ɾ��ר��
     * @param specialId
     * @return
     */
    public boolean delSpecial(int specialId);
}
