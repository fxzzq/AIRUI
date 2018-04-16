package com.iweb.mapper;

import java.util.List;

import com.iweb.model.Tree;

public interface TreeMapper {
    int deleteByPrimaryKey(String id);

    int insert(Tree record);

    int insertSelective(Tree record);

    Tree selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Tree record);

    int updateByPrimaryKey(Tree record);

	long selectCount();

	List<Tree> findTreeList(String id);

	List<Tree> findTreeListRoot();
}