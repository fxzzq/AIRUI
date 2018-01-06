package glory.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import glory.entity.User;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements glory.dao.UserDao {


	/**
	 * 登录
	 * @param user
	 * @return User
	 */
	public User login(User user) {
		String hql = "from User where email = ? and password = ?";
		@SuppressWarnings("unchecked")
		List<User> userList =  (List<User>) super.hibernateTemplate.find(hql,user.getEmail(),user.getPassword());
		if(userList.size()>0){
			// 查到数据返回第一个
			System.out.println(userList.get(0).getName()+"查找成功");
			return userList.get(0);
		}
		return null;
	}


	/**
	 * 根据用户名查找
	 * @param  email
	 * @return User
	 */
	public User findByEmail(String email) {
		String hql = "from User where email=?";
		@SuppressWarnings("unchecked")
		List<User> userList =  (List<User>) super.hibernateTemplate.find(hql, email);
		if(userList.size() > 0){
			// 查到数据返回第一个
			System.out.println("hha:"+email+"bb:"+ userList.size()+"cc:"+userList.get(0));
			return userList.get(0);
		}
		return null;
	}

	/**
	 * 注册
	 * @param  user
	 * @return
	 */
	public void register(User user){
		super.save(user);
	}


	/**
	 * 根据组id查找组成员
	 * @param  id
	 * @return List<User>
	 */
	public List<User> findGroup(int id) {
		String hql = "from User where id=?";
		@SuppressWarnings("unchecked")
		List<User> userList =  (List<User>) super.hibernateTemplate.find(hql, id);
		return userList;
	}

	
}
