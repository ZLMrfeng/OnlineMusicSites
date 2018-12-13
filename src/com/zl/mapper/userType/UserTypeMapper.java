package com.zl.mapper.userType;

import com.zl.bean.UserType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserTypeMapper {

    /**
     * ����û�������Ϣ
     * @param page
     * @param limit
     * @return
     */
    public List<UserType> getUserTypeList(Integer page,Integer limit);

    /**
     * ����ض��û�����
     * @param userTypeId
     * @return
     */
    public UserType getUserTypeById(int userTypeId);

    /**
     * ͳ���û�����
     * @return
     */
    public int getUserTypeCount();

    /**
     * ����û�����
     * @param userType
     * @return
     */
    public boolean addUserType(UserType userType);

    /**
     * �޸��û�������Ϣ
     * @param userType
     * @return
     */
    public boolean updateUserType(UserType userType);

    /**
     * ɾ���û�����
     * @param userTypeId
     * @return
     */
    public boolean delUserType(int userTypeId);
}
