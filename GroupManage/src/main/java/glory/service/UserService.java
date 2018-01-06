package glory.service;

import glory.entity.User;

import java.util.List;

public interface UserService {


	 User login(User user);

	 User findByEmail(String email);

	 void register(User user);

	 List<User> findAll();

	 void deleteUser(User user);

	 void updateUser(User user);


	List<User> getMyGroup(int id);
}
