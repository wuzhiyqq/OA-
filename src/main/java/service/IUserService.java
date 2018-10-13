package service;

import java.util.List;

import domain.User;

public interface IUserService {
	
	public void save(User user);
	
	public void remove(User user);
	
	public void modify(User user);
	
	public User findById(User user);
	
	public List<User> findAll();
	
	public User findByName(User user);

}
