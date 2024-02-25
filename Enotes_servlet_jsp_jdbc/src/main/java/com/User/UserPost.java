package com.User;

import java.sql.Date;

public class UserPost {
	
	private int id;
	private String title;
	private String content;
	private Date ndate;
	private UserData user;
	
	
	
	public UserPost() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserPost(int id, String title, String content, Date ndate, UserData user) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.ndate = ndate;
		this.user = user;
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
	public UserData getUser() {
		return user;
	}
	public void setUser(UserData user) {
		this.user = user;
	}
	
	

}
