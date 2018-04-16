package com.iweb.mapper;

import com.iweb.model.UserRoler;
import java.math.BigDecimal;

public interface UserRolerMapper {
    int deleteByPrimaryKey(BigDecimal oid);

    int insert(UserRoler record);

    int insertSelective(UserRoler record);

    UserRoler selectByPrimaryKey(BigDecimal oid);

    int updateByPrimaryKeySelective(UserRoler record);

    int updateByPrimaryKey(UserRoler record);

	int selectMaxiId();

	int selectUsedRid(BigDecimal rid);

	UserRoler selectByUsid(BigDecimal usid);

	void deleteUsid(BigDecimal usid);
}