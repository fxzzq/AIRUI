package com.iweb.mapper;

import com.iweb.model.Member;
import java.math.BigDecimal;

public interface MemberMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);
}