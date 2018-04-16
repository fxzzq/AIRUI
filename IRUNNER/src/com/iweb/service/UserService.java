package com.iweb.service;

import java.util.List;
import java.util.Map;

import com.iweb.model.Menu;
import com.iweb.model.Role;
import com.iweb.model.User;
import com.iweb.model.UserRoler;
import com.iweb.utils.DataGrid;
import com.iweb.utils.ObJUtil;
import com.iweb.utils.Page;


public interface UserService {

	DataGrid queryUserRole(Page page);

	User registerUser(User user);

	int deleteSelected(String ids);

	User updateUser(User user);

	List<Role> getRoleCombobox();

	String addManagerRole(UserRoler userRoler);

	DataGrid querygljs(Page page);

	List<Map<String, Object>> queryMenus();

	void addRole(Role role);

	int deleteRole(String[] ids);

	void updateRole(Role role);

	DataGrid queryglqx(Page page);

	void addMenu(ObJUtil util,Menu menu);

	int deleteMenus(String[] ids);


}
