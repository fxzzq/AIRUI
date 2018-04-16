package com.iweb.mapper;

import com.iweb.model.Shopping;
import java.math.BigDecimal;

public interface ShoppingMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Shopping record);

    int insertSelective(Shopping record);

    Shopping selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Shopping record);

    int updateByPrimaryKey(Shopping record);

	int selectCountPidUsed(BigDecimal pid);
}