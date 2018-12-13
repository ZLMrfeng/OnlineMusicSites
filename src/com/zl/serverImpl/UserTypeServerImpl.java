package com.zl.serverImpl;

import com.zl.bean.UserType;
import com.zl.mapper.userType.UserTypeMapper;
import com.zl.server.UserTypeServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserTypeServerImpl  implements UserTypeServer {
    @Autowired
    private UserTypeMapper userTypeMapper;
    @Override
    public List<UserType> getUserTypeList(Integer page, Integer limit) {
        if(page == null || page <=0){
            page =1;
        }
        if(limit == null || limit <=0){
            limit=10;
        }
        Integer start =(page-1)*limit;
        return this.userTypeMapper.getUserTypeList(start,limit);
    }

    @Override
    public UserType getUserTypeById(int userTypeId) {
        return this.userTypeMapper.getUserTypeById(userTypeId);
    }

    @Override
    public int getUserTypeCount() {
        return this.userTypeMapper.getUserTypeCount();
    }

    @Override
    public boolean addUserType(UserType userType) {
        return this.userTypeMapper.addUserType(userType);
    }

    @Override
    public boolean updateUserType(UserType userType) {
        return this.userTypeMapper.updateUserType(userType);
    }

    @Override
    public boolean delUserType(int userTypeId) {
        return this.userTypeMapper.delUserType(userTypeId);
    }
}
