package com.mxp.service;

import java.util.List;

import com.mxp.entity.TbUser;
import com.mxp.entity.Tree;

public interface LoginService {

	public boolean findUser(TbUser tbUser) throws Exception;

	public List<Tree> getTreeData(String nid) throws Exception;

}
