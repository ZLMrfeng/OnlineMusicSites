package com.zl.serverImpl;

import com.zl.bean.SpecialWorks;
import com.zl.mapper.specialWorks.SpecialWorksMapper;
import com.zl.server.SpecialWorksServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpecialWorksServerImpl implements SpecialWorksServer {

    @Autowired
    private SpecialWorksMapper specialWorksMapper;
    @Override
    public List<SpecialWorks> getGeneralList(Integer page, Integer limit) {
        if(page == null || page <=0){
            page = 1;
        }
        if(limit == null || limit <=0){
            limit = 6;
        }
        Integer start = (page -1)* limit;
        return this.specialWorksMapper.getGeneralList(start,limit);
    }

    @Override
    public List<SpecialWorks> getSearchList(String songName) {
        return this.specialWorksMapper.getSearchList(songName);
    }

    @Override
    public int getGeneralCount() {
        return this.specialWorksMapper.getGeneralCount();
    }

    @Override
    public List<SpecialWorks> getGeneralByIdList(Integer page, Integer limit, int singerId) {
        if(page == null || page <=0){
            page = 1;
        }
        if(limit == null || limit <=0){
            limit = 6;
        }
        Integer start = (page -1)* limit;
        return this.specialWorksMapper.getGeneralByIdList(start,limit,singerId);
    }

    @Override
    public int getCeneralByIdCount(int singerId) {
        return this.specialWorksMapper.getCeneralByIdCount(singerId);
    }

    @Override
    public List<SpecialWorks> getGengralWorksId(int songId) {
        return this.specialWorksMapper.getGengralWorksId(songId);
    }

    @Override
    public List<SpecialWorks> getGengralWorksSingerId(int singerId) {
        return this.specialWorksMapper.getGengralWorksSingerId(singerId);
    }

    @Override
    public SpecialWorks getSomeThingList(int specialId) {
        return this.specialWorksMapper.getSomeThingList(specialId);
    }
}
