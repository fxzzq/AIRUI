package com.iweb.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iweb.mapper.TreeMapper;
import com.iweb.mapper.UserMapper;
import com.iweb.model.Tree;
import com.iweb.model.User;
import com.iweb.service.SystemService;
import com.iweb.utils.Encrypt;

@Service("systemService")
public class SystemServiceImp implements SystemService {

	@Autowired
	private TreeMapper treeMapper;

	@Autowired
	private UserMapper userMapper;

	public List<Tree> getTree(String id) throws Exception {

		if (id == null) {
			return treeMapper.findTreeListRoot();
		}
		return treeMapper.findTreeList(id);
	}

	public User login(User user) {

		user.setPasswd(Encrypt.md5(user.getPasswd()));
		User u = userMapper.selectUser(user);

		if (u == null) {
			throw new RuntimeException("用户名或密码不正确");
		}
		return u;
	}

}
