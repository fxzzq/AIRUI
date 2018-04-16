package com.iweb.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.iweb.mapper.UserMapper;
import com.iweb.model.Menu;
import com.iweb.model.User;

@Component
public class RunnerUtils {
	
	@Autowired
	private UserMapper userMapper;
	
	public  Map<String, Map<String, Integer>> flushRoleMap(){
		Map<String, Map<String, Integer>> roleMap = new HashMap<String, Map<String, Integer>>();
		
		List<User> users = userMapper.selectUserRoles();
		for (User user : users) {
			Map<String, Integer> map = new HashMap<String, Integer>();

			List<Menu> menus = user.getMenus();

			for (Menu menu : menus) {
				map.put(menu.getMemethod().trim(), 1);
			}
			roleMap.put(String.valueOf(user.getUsid()), map);
		}
		return roleMap;
		
		
	}

}
