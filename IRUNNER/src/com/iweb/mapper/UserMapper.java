package com.iweb.mapper;

import java.math.BigDecimal;
import java.util.List;

import com.iweb.model.User;
import com.iweb.utils.Page;

public interface UserMapper {
    int deleteByPrimaryKey(BigDecimal usid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(BigDecimal usid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	long findCount();

	List<User> findListUserRole(Page page);

	int selectMaxId();

	int selectCountByName(String usname);

	List<User> selectUserRoles();

	User selectUser(User user);
}