package mapper;

import java.util.List;

import domain.User;

public interface UserMapper {
	
	public void insert(User user);
	
	public void delete(User user);
	
	public void update(User user);
	
	public User selectById(User user);
	
	public List<User> selectAll();
	
	public User selectByName(User user);

}
