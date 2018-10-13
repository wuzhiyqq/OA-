package mapper;

import java.util.List;

import domain.Leave;

public interface LeaveMapper {
	
	public void insert(Leave leave);
	
	public void delete(Leave leave);
	
	public void update(Leave leave);
	
	public Leave selectById(Leave leave);
	
	public List<Leave> selectByAll();

}
