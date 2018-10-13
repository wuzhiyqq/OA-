package domain;

import java.util.Date;

public class Leave {
	
	private int id ;
	private int applyID;
	private int approveID;
	private Date startTime;
	private Date endTime;
	private int days;
	private String reason;
	private int state;
	
	private String apply;
	private String start;
	private String end;
	
	
	public String getApply() {
		return apply;
	}
	public void setApply(String apply) {
		this.apply = apply;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getApplyID() {
		return applyID;
	}
	public void setApplyID(int applyID) {
		this.applyID = applyID;
	}
	public int getApproveID() {
		return approveID;
	}
	public void setApproveID(int approveID) {
		this.approveID = approveID;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Leave() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
