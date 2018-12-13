package com.zl.serverImpl;

import com.zl.bean.User;
import com.zl.mapper.user.UserMapper;
import com.zl.server.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServerImpl implements UserServer {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getUserList(Integer page, Integer limit) {
        if(page == null || page <=0){
            page=1;
        }
        if(limit == null || limit <=0){
            limit=10;
        }
        Integer start = (page-1 )* limit;
        return this.userMapper.getUserList(start,limit);
    }

    @Override
    public User getUserName(User user) {
        return this.userMapper.getUserName(user);
    }

    @Override
    public int getUserCount() {
        return this.userMapper.getUserCount();
    }

    @Override
    public List<User> getUserListOver(String userName) {
        return this.userMapper.getUserListOver(userName);
    }

    @Override
    public boolean delUser(Integer userId) {
        return this.userMapper.delUser(userId);
    }


    @Override
    public User getUserById(int userId) {
        return this.userMapper.getUserById(userId);
    }

    @Override
    public boolean updateUser(User user) {
        return this.userMapper.updateUser(user);
    }

    @Override
    public boolean addUser(User user) {
        return this.userMapper.addUser(user);
    }



}
