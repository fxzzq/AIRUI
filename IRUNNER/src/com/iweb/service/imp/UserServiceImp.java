package com.iweb.service.imp;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iweb.interceptor.RoleUtils;
import com.iweb.mapper.MenuMapper;
import com.iweb.mapper.RoleMapper;
import com.iweb.mapper.RolerMenuMapper;
import com.iweb.mapper.UserMapper;
import com.iweb.mapper.UserRolerMapper;
import com.iweb.model.Menu;
import com.iweb.model.Role;
import com.iweb.model.RolerMenu;
import com.iweb.model.User;
import com.iweb.model.UserRoler;
import com.iweb.service.UserService;
import com.iweb.utils.DataGrid;
import com.iweb.utils.Encrypt;
import com.iweb.utils.ObJUtil;
import com.iweb.utils.Page;
import com.iweb.utils.RunnerUtils;

@Service("userService")
public class UserServiceImp implements UserService {
	
	@Autowired
	private RunnerUtils runnerUtils;
	
	@Autowired
	private RoleUtils roleUtils;

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private RoleMapper roleMapper;

	@Autowired
	private UserRolerMapper userRolerMapper;

	@Autowired
	private MenuMapper menuMapper;

	@Autowired
	private RolerMenuMapper rolerMenuMapper;

	public DataGrid queryUserRole(Page page) {

		DataGrid dataGrid = new DataGrid();

		long total = userMapper.findCount();
		List<User> rows = userMapper.findListUserRole(page);
		dataGrid.setTotal(total);
		dataGrid.setRows(rows);
		return dataGrid;
	}

	/**
	 * 判断用户是否存在
	 * 如果不存在则注册
	 */
	public synchronized User registerUser(User user) {

		int count = userMapper.selectCountByName(user.getUsname());

		if (count != 0) {
			throw new RuntimeException("用户已存在");
		}
		//设置主键
		BigDecimal usid = new BigDecimal(userMapper.selectMaxId() + 1);
		user.setUsid(usid);
		user.setPasswd(Encrypt.md5(user.getPasswd()));
		userMapper.insertSelective(user);
		return user;
	}

	/**
	 * 分割ids得到id的数组
	 * 一条一条的删除数据
	 * 需要删除和用户关联的角色关联数据
	 */
	public synchronized int deleteSelected(String ids) {

		String[] usids = ids.split(",");
		BigDecimal usid = null;
		int count = 0;
		for (String id : usids) {
			if (id != null && !"".equals(id.trim()) && !"1".equals(id.trim())) {
				usid = new BigDecimal(id);
				userMapper.deleteByPrimaryKey(usid);
				userRolerMapper.deleteUsid(usid);
				count++;
			}
		}
		return count;
	}

	/**
	 * 因为密码加密了,如果接受到的是密文,要先和数据库密文对比,如果正确不修改密码,否则加密后修改密码
	 */
	public synchronized User updateUser(User user) {
		User dbu = userMapper.selectByPrimaryKey(user.getUsid());
		User u = null;
		if (dbu == null) {
			throw new RuntimeException("用户已删除");
		} else {
			String md5 = dbu.getPasswd();
			if (md5.equals(user.getPasswd())) {
				user.setPasswd(null);
			} else {
				user.setPasswd(Encrypt.md5(user.getPasswd()));
			}
			userMapper.updateByPrimaryKeySelective(user);
			u = userMapper.selectByPrimaryKey(user.getUsid());
		}

		return u;
	}

	/**
	 * 查询ir-right_role表
	 */
	public List<Role> getRoleCombobox() {

		return roleMapper.findList();
	}

	/**
	 * 1.确定是新设置权限还是修改权限
	 * 2.如果是设置权限则执行insert否则执行update
	 */
	public synchronized String addManagerRole(UserRoler userRoler) {
		int val = userRolerMapper.selectMaxiId();
		BigDecimal oid = new BigDecimal(val + 1);

		UserRoler ur = userRolerMapper.selectByUsid(userRoler.getUsid());
		String msg = "";
		if (ur == null) {
			userRoler.setOid(oid);
			userRolerMapper.insertSelective(userRoler);
			msg= "添加管理员角色成功";
		} else {
			userRoler.setOid(ur.getOid());
			userRolerMapper.updateByPrimaryKeySelective(userRoler);
			msg="修改管理员角色成功";
		}
		roleUtils.setRoleMap(runnerUtils.flushRoleMap());
		return msg;
	}

	public DataGrid querygljs(Page page) {

		DataGrid dg = new DataGrid();

		long total = roleMapper.selectCount();
		dg.setTotal(total);

		List<Role> rows = roleMapper.selectListRoleMenu(page);
		dg.setRows(rows);
		return dg;
	}

	/**
	 * 查询权限清单表select * from ir_right_menu
	 */
	public List<Map<String, Object>> queryMenus() {

		List<Map<String, Object>> maps = new ArrayList<Map<String, Object>>();

		List<Menu> list = menuMapper.selectList();

		Map<String, Object> map = null;

		for (Menu menu : list) {
			map = new HashMap<String, Object>();
			map.put("id", menu.getMeid());
			map.put("text", menu.getMname());
			map.put("children", new String[0]);
			maps.add(map);
		}
		return maps;
	}

	/**
	 * 生成角色主键
	 * 
	 * 添加保存角色信息的同时要更新角色权限关联表
	 */
	public synchronized void addRole(Role role) {
		long rid = roleMapper.selectMaxId();
		role.setRid(new BigDecimal(rid + 1));

		if (roleMapper.selectRnameExist(role.getRname()) != 0) {
			throw new RuntimeException("违反唯一条件约束");
		}
		String[] meids = role.getDescription().split(",");
		String description = "";

		BigDecimal meid = null;
		RolerMenu rolerMenu = new RolerMenu();
		for (String id : meids) {
			if (id != null && !"".equals(id.trim())) {
				meid = new BigDecimal(id);
				int selectMaxId = rolerMenuMapper.selectMaxId();
				rolerMenu.setOid(new BigDecimal((selectMaxId==0?100:selectMaxId) + 1));
				rolerMenu.setRsid(role.getRid());
				rolerMenu.setMeid(meid);
				rolerMenuMapper.insert(rolerMenu);
				description += menuMapper.selectByPrimaryKey(meid).getMname() + ",";
			}
		}
		description = description.substring(0, description.length() - 1);

		role.setDescription(description);

		roleMapper.insert(role);
		
		roleUtils.setRoleMap(runnerUtils.flushRoleMap());;

	}

	/**
	 * 1.确定角色是否被使用,如果使用则抛出异常
	 * 2.确认角色权限关联表数据,查看角色是否关联权限
	 * 3.删除关联关系
	 * 4.删除角色
	 */
	public synchronized int deleteRole(String[] ids) {

		int count = 0;
		BigDecimal rid = null;

		for (String id : ids) {
			if (id != null && !"".equals(id.trim())) {
				rid = new BigDecimal(id);
				int counts = rolerMenuMapper.selectRoleMenuByRid(rid);
				int used_rid_count = userRolerMapper.selectUsedRid(rid);
				if (used_rid_count == 0) {
					if (counts > 0) {
						rolerMenuMapper.deleteByRid(rid);
					}
					roleMapper.deleteByPrimaryKey(rid);
					count++;
				}
			}
		}

		return count;
	}

	/**
	 * 1.修改角色权限关联关系：同步关联关系表
	 * 2.修改角色描述
	 */
	public synchronized void updateRole(Role role) {

		List<RolerMenu> rms = rolerMenuMapper.selectMeidsByRsid(role.getRid());

		//区分需要删除的权限和新增的权限
		List<String> parms = Arrays.asList(role.getDescription().split(","));
		Set<BigDecimal> delete_oids = getDeleteOids(rms, parms);
		Set<BigDecimal> insert_meids = getInsertOids(rms, parms);

		//删除
		for (BigDecimal oid : delete_oids) {
			rolerMenuMapper.deleteByPrimaryKey(oid);
		}
		RolerMenu rm = null;
		int maxid = rolerMenuMapper.selectMaxId();
		for (BigDecimal meid : insert_meids) {
			rm = new RolerMenu();
			rm.setOid(new BigDecimal(++maxid));
			rm.setRsid(role.getRid());
			rm.setMeid(meid);
			rolerMenuMapper.insert(rm);
		}

		String description = "";

		for (String parm : parms) {
			description += menuMapper.selectByPrimaryKey(new BigDecimal(parm)).getMname() + ",";
		}
		description = description.substring(0, description.length() - 1);
		role.setDescription(description);
		role.setRname(null);
		roleMapper.updateByPrimaryKeySelective(role);

	}

	private Set<BigDecimal> getDeleteOids(List<RolerMenu> rms, List<String> parms) {
		Set<BigDecimal> set = new HashSet<BigDecimal>();
		for (RolerMenu rm : rms) {
			if (!parms.toString().contains(rm.getMeid().toString())) {
				set.add(rm.getOid());
			}
		}
		return set;
	}

	private Set<BigDecimal> getInsertOids(List<RolerMenu> rms, List<String> parms) {
		Set<BigDecimal> set = new HashSet<BigDecimal>();
		Set<BigDecimal> meids = new HashSet<BigDecimal>();
		for (RolerMenu rm : rms) {
			meids.add(rm.getMeid());
		}

		for (String meid : parms) {
			if (!meids.contains(new BigDecimal(meid))) {
				set.add(new BigDecimal(meid));
			}
		}
		return set;
	}

	/**
	 * 查询权限清单表
	 */
	public DataGrid queryglqx(Page page) {
		DataGrid grid = new DataGrid();
		long total = menuMapper.selectCount();
		grid.setTotal(total);

		List<Menu> list = menuMapper.selectListPage(page);
		grid.setRows(list);

		return grid;
	}

	/**
	 * 向权限菜单表写入数据
	 */
	public synchronized void addMenu(ObJUtil util, Menu menu) {
		int maxId = menuMapper.selectMaxId();
		int count = menuMapper.selectCountByMname(menu.getMname());
		if (count != 0) {
			throw new RuntimeException("权限已存在");
		}
		menu.setMeid(new BigDecimal(maxId + 1));
		menuMapper.insert(menu);
		util.setObject(menu);
	}

	/**
	 * 删除权限数据
	 * 判断权限是否关联
	 */
	public synchronized int deleteMenus(String[] ids) {
		int count = 0;
		for (String meid : ids) {
			if (rolerMenuMapper.selectCountByMeid(new BigDecimal(meid)) == 0) {
				count += menuMapper.deleteByPrimaryKey(new BigDecimal(meid));
			} else {
				throw new RuntimeException(meid + "权限已关联无法删除");
			}

		}
		return count;
	}

}
