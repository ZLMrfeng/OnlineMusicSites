package com.zl.serverImpl;

import com.zl.bean.Special;
import com.zl.mapper.special.SpecialMapper;
import com.zl.server.SpecialServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SpecialServerImpl implements SpecialServer {
    @Autowired
    private SpecialMapper specialMapepr;
    @Override
    public List<Special> getSpecialList(Integer page, Integer limit) {

        if(page == null || page<=0){
            page =1;
        }
        if(limit == null || limit <=0){
            limit =10;
        }
        Integer start =(page -1)*limit;
        return this.specialMapepr.getSpecialList(start,limit);
    }

    @Override
    public Special getSpecialById(int specialId) {
        return this.specialMapepr.getSpecialById(specialId);
    }

    @Override
    public int getSpecialCount() {
        return this.specialMapepr.getSpecialCount();
    }

    @Override
    public boolean addSpecial(Special special) {
        return this.specialMapepr.addSpecial(special);
    }

    @Override
    public boolean updateSpecial(Special special) {
        return this.specialMapepr.updateSpecial(special);
    }

    @Override
    public boolean delSpecial(int specialId) {
        return this.specialMapepr.delSpecial(specialId);
    }
}
