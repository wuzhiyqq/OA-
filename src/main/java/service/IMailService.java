package service;

import java.util.List;

import domain.Mail;
import domain.User;

public interface IMailService {
	
	public void save(Mail mail);
	
	public void remove(Mail mail);
	
	public void modify(Mail mail);
	
	public Mail findById(Mail mail);
	
	public List<Mail> findByFromId(User user);
	
	public List<Mail> findByToId(User user);
	
	public List<Mail> findByAll();

}
