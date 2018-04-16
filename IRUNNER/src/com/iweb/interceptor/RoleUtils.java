package com.iweb.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.iweb.mapper.UserMapper;
import com.iweb.model.Menu;
import com.iweb.model.User;

@Component
public class RoleUtils implements ApplicationListener<ContextRefreshedEvent> {

	@Autowired
	private UserMapper userMapper;

	private Map<String, Map<String, Integer>> roleMap = new HashMap<String, Map<String, Integer>>();
	
	public void setRoleMap(Map<String, Map<String, Integer>> roleMap) {
		this.roleMap = roleMap;
	}

	public Map<String, Map<String, Integer>> getRoleMap() {
		return roleMap;
	}

	public void onApplicationEvent(ContextRefreshedEvent event) {

		List<User> users = userMapper.selectUserRoles();
		for (User user : users) {
			Map<String, Integer> map = new HashMap<String, Integer>();

			List<Menu> menus = user.getMenus();

			for (Menu menu : menus) {
				map.put(menu.getMemethod().trim(), 1);
			}
			roleMap.put(String.valueOf(user.getUsid()), map);
		}
	}

}
