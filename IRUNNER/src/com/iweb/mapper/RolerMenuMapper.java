package com.iweb.mapper;

import com.iweb.model.RolerMenu;
import java.math.BigDecimal;
import java.util.List;

public interface RolerMenuMapper {
    int deleteByPrimaryKey(BigDecimal oid);

    int insert(RolerMenu record);

    int insertSelective(RolerMenu record);

    RolerMenu selectByPrimaryKey(BigDecimal oid);

    int updateByPrimaryKeySelective(RolerMenu record);

    int updateByPrimaryKey(RolerMenu record);

	int selectMaxId();

	int selectRoleMenuByRid(BigDecimal rid);

	void deleteByRid(BigDecimal rid);

	List<RolerMenu> selectMeidsByRsid(BigDecimal rid);

	int selectCountByMeid(BigDecimal bigDecimal);
}