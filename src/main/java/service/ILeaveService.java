package service;

import java.util.List;

import domain.Leave;

public interface ILeaveService {
	
	public void save(Leave leave);
	
	public void remove(Leave leave);
	
	public void modify(Leave leave);
	
	public Leave findById(Leave leave);
	
	public List<Leave> findByAll();

}
