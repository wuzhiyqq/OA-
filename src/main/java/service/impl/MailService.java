package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import domain.Mail;
import domain.User;
import mapper.MailMapper;
import service.IMailService;

@Service
@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
public class MailService implements IMailService {
	
	@Autowired
	private MailMapper mapper;
	
	public void save(Mail mail) {
		
		mapper.insert(mail);
		
	}

	public void remove(Mail mail) {
		mapper.delete(mail);
		
	}

	public void modify(Mail mail) {
		
		mapper.update(mail);
		
	}
	@Transactional(readOnly=true)
	public Mail findById(Mail mail) {
		Mail findmail = new  Mail();
		findmail = mapper.selectById(mail);
		return findmail;
	}
	@Transactional(readOnly=true)
	public List<Mail> findByFromId(User user) {
		List<Mail> mails = new ArrayList<Mail>();
		mails = mapper.selectByFromId(user);
		return mails;
	}
	@Transactional(readOnly=true)
	public List<Mail> findByToId(User user) {
		List<Mail> mails = new ArrayList<Mail>();
		mails = mapper.selectByToId(user);
		return mails;
	}
	@Transactional(readOnly=true)
	public List<Mail> findByAll() {
		List<Mail> mails = new ArrayList<Mail>();
		mails = mapper.selectByAll();
		return mails;
	}

}
