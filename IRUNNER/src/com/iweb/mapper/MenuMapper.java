package com.iweb.mapper;

import com.iweb.model.Menu;
import com.iweb.utils.Page;

import java.math.BigDecimal;
import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(BigDecimal meid);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(BigDecimal meid);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

	List<Menu> selectList();

	long selectCount();

	List<Menu> selectListPage(Page page);

	int selectMaxId();

	int selectCountByMname(String mname);
}