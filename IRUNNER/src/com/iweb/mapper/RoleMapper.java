package com.iweb.mapper;

import com.iweb.model.Role;
import com.iweb.utils.Page;

import java.math.BigDecimal;
import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(BigDecimal rid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(BigDecimal rid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

	List<Role> findList();

	long selectCount();

	List<Role> selectListRoleMenu(Page page);

	long selectMaxId();

	int selectRnameExist(String rname);
}