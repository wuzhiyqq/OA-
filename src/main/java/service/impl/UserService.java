package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import domain.User;
import mapper.UserMapper;
import service.IUserService;

@Service
@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
public class UserService implements IUserService{
	
	@Autowired
	private UserMapper mapper;
	public void save(User user) {
		
		mapper.insert(user);
		
	}

	public void remove(User user) {
		
		mapper.delete(user);
		
	}

	public void modify(User user) {
		
		mapper.update(user);
		
	}
	@Transactional(readOnly=true)
	public User findById(User user) {
		
		return mapper.selectById(user);
	}
	@Transactional(readOnly=true)
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return mapper.selectAll();
	}
	@Transactional(readOnly=true)
	public User findByName(User user) {
		
		return mapper.selectByName(user);
	}

	
	

}
