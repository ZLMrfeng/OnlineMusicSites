package com.zl.mapper.userType;

import com.zl.bean.UserType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserTypeMapper {

    /**
     * 获得用户类型信息
     * @param page
     * @param limit
     * @return
     */
    public List<UserType> getUserTypeList(Integer page,Integer limit);

    /**
     * 获得特定用户类型
     * @param userTypeId
     * @return
     */
    public UserType getUserTypeById(int userTypeId);

    /**
     * 统计用户类型
     * @return
     */
    public int getUserTypeCount();

    /**
     * 添加用户类型
     * @param userType
     * @return
     */
    public boolean addUserType(UserType userType);

    /**
     * 修改用户类型信息
     * @param userType
     * @return
     */
    public boolean updateUserType(UserType userType);

    /**
     * 删除用户类型
     * @param userTypeId
     * @return
     */
    public boolean delUserType(int userTypeId);
}
