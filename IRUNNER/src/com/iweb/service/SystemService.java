package com.iweb.service;

import java.util.List;

import com.iweb.model.Tree;
import com.iweb.model.User;


public interface SystemService {

	List<Tree> getTree(String id)throws Exception;

	User login(User user);



}
