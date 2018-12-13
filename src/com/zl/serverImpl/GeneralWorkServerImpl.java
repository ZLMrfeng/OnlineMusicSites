package com.zl.serverImpl;

import com.zl.bean.GeneralWorks;
import com.zl.mapper.generalWorks.GeneralWorksMapper;
import com.zl.server.GeneralWorksServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GeneralWorkServerImpl implements GeneralWorksServer {

    @Autowired
    private GeneralWorksMapper generalWorksMapper;


    @Override
    public List<GeneralWorks> getGeneralList(Integer page, Integer limit) {
        if(page == null || page <=0){
            page=1;
        }
        if(limit == null || limit <=0){
            limit=10;
        }
        Integer start = (page - 1)*limit;
        return this.generalWorksMapper.getGeneralList(start,limit);
    }

    @Override
    public List<GeneralWorks> getSearchList(String songName) {
        return this.generalWorksMapper.getSearchList(songName);
    }

    @Override
    public int getGeneralCount() {
        return this.generalWorksMapper.getGeneralCount();
    }

    @Override
    public List<GeneralWorks> getGeneralByIdList(Integer page, Integer limit, int singerId) {

        if(page == null || page <=0){
            page = 1;
        }
        if(limit == null || limit <=0){
            limit = 6;
        }
        Integer start = (page -1)* limit;
        return this.generalWorksMapper.getGeneralByIdList(start,limit,singerId);
    }

    @Override
    public int getCeneralByIdCount(int singerId) {
        return this.generalWorksMapper.getCeneralByIdCount(singerId);
    }

    @Override
    public List<GeneralWorks>  getGengralWorksId(int songId) {
        return this.generalWorksMapper.getGengralWorksId(songId);
    }

    @Override
    public GeneralWorks getGengralWorksById(int songId) {
        return this.generalWorksMapper.getGengralWorksById(songId);
    }

    @Override
    public List<GeneralWorks> getGengralWorksSingerId(int singerId) {
        return this.generalWorksMapper.getGengralWorksSingerId(singerId);
    }

    @Override
    public GeneralWorks getGengralWorksBySingerId(int singerId) {
        return this.generalWorksMapper.getGengralWorksBySingerId(singerId);
    }
}
