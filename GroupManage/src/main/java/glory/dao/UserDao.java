package glory.dao;

import glory.entity.User;

import java.util.List;

public interface UserDao extends BaseDao<User>{

	User login(User user);

	User findByEmail(String email);

	void register(User user);

	List<User> findGroup(int id);

}
