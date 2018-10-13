package domain;

import java.util.Date;

public class Mail {
	
	
	private int id;
	private int fromID;
	private String fromName;
	private int toID;
	private String titile;
	private String content;
	private String attachment;
	private int isread;
	private Date createTime;
	private String create;
	private int isDelete;
	
	
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public String getCreate() {
		return create;
	}
	public void setCreate(String create) {
		this.create = create;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFromID() {
		return fromID;
	}
	public void setFromID(int fromID) {
		this.fromID = fromID;
	}
	public int getToID() {
		return toID;
	}
	public void setToID(int toID) {
		this.toID = toID;
	}
	public String getTitile() {
		return titile;
	}
	public void setTitile(String titile) {
		this.titile = titile;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public int getIsread() {
		return isread;
	}
	public void setIsread(int isread) {
		this.isread = isread;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public Mail() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
