package com.zl.server;

import com.zl.bean.Singer;

import java.util.List;

public interface SingerServer {

    /**
     * ��ȡ���и���
     * @return
     */
    public List<Singer> getSingerList(Integer page, Integer limit);

    /**
     * ��ȡĳ������
     * @param singerId
     * @return
     */
    public Singer getSingerById(int singerId);

    /**
     * ͳ�Ƹ���
     * @return
     */
    public int getSingerCount();
    /**
     * ��Ӹ���
     * @param singer
     * @return
     */
    public boolean addSinger(Singer singer);

    /**
     * �޸ĸ�����Ϣ
     * @param singer
     * @return
     */
    public boolean updateSinger(Singer singer);

    /**
     * ͨ�����ֱ��ɾ������
     * @param singerId
     * @return
     */
    public boolean delSinger(int singerId);

}
