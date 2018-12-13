package com.zl.serverImpl;

import com.zl.bean.Singer;
import com.zl.mapper.singers.SingerMapper;
import com.zl.server.SingerServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SingerServerImpl implements SingerServer{

    @Autowired
    private SingerMapper singerMapper;

    @Override
    public List<Singer> getSingerList(Integer page, Integer limit) {
        if(page == null || page <= 0){
            page = 1;
        }
        if(limit == null || limit <=0){
            limit = 10;
        }
        Integer start = (page-1)*limit;
        return this.singerMapper.getSingerList(start,limit);
    }

    @Override
    public Singer getSingerById(int singerId) {
        return this.singerMapper.getSingerById(singerId);
    }

    @Override
    public int getSingerCount() {
        return this.singerMapper.getSingerCount();
    }

    @Override
    public boolean addSinger(Singer singer) {
        return this.singerMapper.addSinger(singer);
    }

    @Override
    public boolean updateSinger(Singer singer) {
        return this.singerMapper.updateSinger(singer);
    }

    @Override
    public boolean delSinger(int singerId) {
        return this.singerMapper.delSinger(singerId);
    }
}
