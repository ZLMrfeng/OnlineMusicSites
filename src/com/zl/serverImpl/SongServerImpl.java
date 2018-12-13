package com.zl.serverImpl;


import com.zl.bean.Songs;
import com.zl.mapper.song.SongMapper;
import com.zl.server.SongServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SongServerImpl implements SongServer {

    @Autowired
    private SongMapper songMapper;
    @Override
    public List<Songs> getSongList(Integer page, Integer limit) {
        if(page == null || page <=0){
            page=1;
        }
        if(limit == null || limit <=0){
            limit=10;
        }
        Integer start = (page-1 )* limit;
        return this.songMapper.getSongList(start,limit);
    }

    @Override
    public Songs getSongById(int songId) {
        return this.songMapper.getSongById(songId);
    }

    @Override
    public int getSongCount() {
        return this.songMapper.getSongCount();
    }

    @Override
    public boolean addSong(Songs songs) {
        return this.songMapper.addSong(songs);
    }

    @Override
    public boolean updateSong(Songs songs) {
        return this.songMapper.updateSong(songs);
    }

    @Override
    public boolean delSong(int songId) {
        return this.songMapper.delSong(songId);
    }
}
