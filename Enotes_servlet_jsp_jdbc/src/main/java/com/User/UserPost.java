package com.User;

import java.sql.Date;

public class UserPost {
	
	private int id;
	private String title;
	private String content;
	private Date ndate;
	private int uid;
	
	
	
	public UserPost() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserPost(int id, String title, String content, Date ndate, int uid) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.ndate = ndate;
		this.uid = uid;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	

}
