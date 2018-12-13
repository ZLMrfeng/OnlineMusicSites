package com.zl.serverImpl;

import com.zl.bean.Information;
import com.zl.mapper.informations.InformationsMapper;
import com.zl.server.InformationServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class InformationImpl implements InformationServer {

    @Autowired
    private InformationsMapper informationsMapper;
    @Override
    public List<Information> getInformationList(Integer page, Integer limit) {
        if(page == null || page <=0){
            page=1;
        }
        if(limit == null || limit <=0){
            limit=10;
        }
        Integer start = (page-1 )* limit;
        return this.informationsMapper.getInformationList(start,limit);
    }

    @Override
    public int countInformation() {
        return this.informationsMapper.countInformation();
    }

    @Override
    public Information getInformationById(int informationId) {
        return this.informationsMapper.getInformationById(informationId);
    }

    @Override
    public boolean addInformation(Information information) {
        return this.informationsMapper.addInformation(information);
    }

    @Override
    public boolean updateInformation(Information information) {
        return this.informationsMapper.updateInformation(information);
    }

    @Override
    public boolean delInformation(int informationId) {
        return this.informationsMapper.delInformation(informationId);
    }
}
