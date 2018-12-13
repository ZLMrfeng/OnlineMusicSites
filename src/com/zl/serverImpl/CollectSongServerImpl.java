package com.zl.serverImpl;

import com.zl.bean.CollectSong;
import com.zl.mapper.collectSong.CollectSongMapper;
import com.zl.server.CollectSongServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CollectSongServerImpl implements CollectSongServer {

    @Autowired
    private CollectSongMapper collectSongMapper;
    @Override
    public List<CollectSong> getCollectSongList(Integer page, Integer limit, int userId) {

        if(page == null || page <= 0){
            page = 1;
        }
        if(limit == null || limit <=0){
            limit = 10;
        }
        Integer start = (page-1)*limit;
        return this.collectSongMapper.getCollectSongList(start,limit,userId);
    }

    @Override
    public boolean addCollectSong(CollectSong collectSong) {
        return this.collectSongMapper.addCollectSong(collectSong);
    }

    @Override
    public boolean delCollectSong(int collectId) {
        return this.collectSongMapper.delCollectSong(collectId);
    }
}
