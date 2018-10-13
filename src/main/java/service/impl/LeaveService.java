package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import domain.Leave;
import mapper.LeaveMapper;
import service.ILeaveService;

@Service
@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
public class LeaveService implements ILeaveService {
	
	@Autowired
	private LeaveMapper mapper;
	
	public void save(Leave leave) {
		
		mapper.insert(leave);
	}

	public void remove(Leave leave) {
		
		mapper.delete(leave);

	}

	public void modify(Leave leave) {
		mapper.update(leave);

	}
	@Transactional(readOnly=true)
	public Leave findById(Leave leave) {
		Leave findleave = mapper.selectById(leave);
		return findleave;
	}
	@Transactional(readOnly=true)
	public List<Leave> findByAll() {
		
		return mapper.selectByAll();
	}

}
