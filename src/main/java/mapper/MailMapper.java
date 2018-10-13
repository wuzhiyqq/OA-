package mapper;

import java.util.List;

import domain.Mail;
import domain.User;

public interface MailMapper {
	
	public void insert(Mail mail);
	
	public void delete(Mail mail);
	
	public void update(Mail mail);
	
	public Mail selectById(Mail mail);
	
	public List<Mail> selectByFromId(User user);
	
	public List<Mail> selectByToId(User user);
	
	public List<Mail> selectByAll();
	

}
