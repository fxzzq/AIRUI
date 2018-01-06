package glory.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import glory.dao.UserDao;
import glory.entity.User;
import sun.rmi.server.UnicastServerRef;

import java.util.List;

@Transactional
@Service
public class UserServiceImpl implements glory.service.UserService{
	
	@Resource
	private UserDao userDao;

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	public User findByEmail(String email){
		return userDao.findByEmail(email);
	}

	public void register(User user){
		userDao.save(user);
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

	@Override
	public void deleteUser(User user) {
		userDao.delete(user);
	}

	@Override
	public void updateUser(User user) {
		userDao.update(user);
	}

	@Override
	public List<User> getMyGroup(int id) {
		return userDao.findGroup(id);
	}

}

