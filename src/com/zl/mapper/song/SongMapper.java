package com.zl.mapper.song;


import java.util.List;


import com.zl.bean.Song;
import com.zl.bean.Songs;

public interface SongMapper {
	/**
	 * ��ȡ���и���
	 * @param page
	 * @param limit
	 * @return
	 */
	public  List<Songs> getSongList(Integer page ,Integer limit);

	/**
	 * ��ȡ�ض�����
	 * @param songId
	 * @return
	 */
	public Songs getSongById(int songId);

	/**
	 * ͳ�Ƹ���
	 * @return
	 */
	public int getSongCount();

	/**
	 * ��Ӹ���
	 * @param songs
	 * @return
	 */
	public boolean addSong(Songs songs);

	/**
	 * �޸ĸ���
	 * @param songs
	 * @return
	 */
	public boolean updateSong(Songs songs);

	/**
	 * ɾ������
	 * @param songId
	 * @return
	 */
	public boolean delSong(int songId);
}
