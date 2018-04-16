package com.iweb.mapper;

import com.iweb.model.Proorder;
import com.iweb.utils.Page;

import java.math.BigDecimal;
import java.util.List;

public interface ProorderMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Proorder record);

    int insertSelective(Proorder record);

    Proorder selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Proorder record);

    int updateByPrimaryKey(Proorder record);

	int selectMaxId();

	List<Proorder> selectCountPidUsed(BigDecimal pid);

	long selectCount();

	List<Proorder> selectListUserInfo(Page page);

	String selectOrderStatus(BigDecimal id);

	int selectOrderCount(BigDecimal id);
}