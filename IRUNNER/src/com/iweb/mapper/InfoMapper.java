package com.iweb.mapper;

import java.math.BigDecimal;
import java.util.List;
import java.util.Set;

import com.iweb.model.Info;
import com.iweb.utils.Page;

public interface InfoMapper {
	int deleteByPrimaryKey(BigDecimal pid);

	int insert(Info record);

	int insertSelective(Info record);

	Info selectByPrimaryKey(BigDecimal pid);

	int updateByPrimaryKeySelective(Info record);

	int updateByPrimaryKey(Info record);

	Set<Integer> selectUsedNodes();

	long selectCount();

	List<Info> selectListTypes(Page page);

	int selectInfoExist(String pcode);

	int selectMaxId();

	List<Info> queryInfosStock(Page page);
}