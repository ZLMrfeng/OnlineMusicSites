package com.zl.server;

import com.zl.bean.User;


import java.util.List;

public interface UserServer {
    /**
     * 获取用户
     * @return
     */
    public List<User> getUserList(Integer page, Integer limit);

    /**
     * 通过唯一的账户查询指定用户
     * @param user
     * @return
     */
    public User getUserName(User user);

    /**
     * 通过标号获得用户
     * @param userId
     * @return
     */
    public User getUserById(int userId);

    /**
     * 添加用户
     * @param user
     * @return
     */
    public boolean addUser(User user);

    /**
     * 修改用户
     * @param user
     * @return
     */
    public boolean updateUser(User user);

    /**
     * 删除特定用户
     * @param userId
     * @return
     */
   public boolean delUser(Integer userId);
    public int getUserCount();

    /**
     * 模糊查询
     * @param userName
     * @return
     */
    public List<User> getUserListOver(String userName);
}
