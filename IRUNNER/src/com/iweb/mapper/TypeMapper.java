package com.iweb.mapper;

import com.iweb.model.Type;
import java.math.BigDecimal;
import java.util.List;
import java.util.Set;

public interface TypeMapper {
    int deleteByPrimaryKey(BigDecimal ptid);

    int insert(Type record);

    int insertSelective(Type record);

    Type selectByPrimaryKey(BigDecimal ptid);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);

	long selectCount();

	List<Type> selectList();

	List<Type> queryParentNodes();

	int selectCountExist(Type type);

	int selectMaxId();

	Set<Integer> selectAllLeafs();

	Set<Integer> selectDeleteAbleNodes();

	List<Type> selectInfoTypes();
}