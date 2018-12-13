package com.zl.mapper.user;

import com.zl.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface UserMapper {
    /**
     * ��ȡ�û�
     * @return
     */
    public List<User> getUserList(Integer page, Integer limit);

    /**
     * ͨ��Ψһ���˻���ѯָ���û�
     * @param user
     * @return
     */
    public User getUserName(User user);

    /**
     * ͨ����Ż���û�
     * @param userId
     * @return
     */
    public User getUserById(int userId);

    /**
     * ����û�
     * @param user
     * @return
     */
    public boolean addUser(User user);

    /**
     * �޸��û�
     * @param user
     * @return
     */
    public boolean updateUser(User user);

    /**
     * ɾ���ض��û�
     * @param userId
     * @return
     */
    public boolean delUser(Integer userId);

    /**
     * ����û�����
     * @return
     */
    public int getUserCount();

    /**
     * ģ����ѯ
     * @param userName
     * @return
     */
    public List<User> getUserListOver(String userName);
}
