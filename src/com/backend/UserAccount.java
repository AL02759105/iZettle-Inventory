package com.backend;

public class UserAccount {
	
	private String user_id;
	private String first_name;
	private String last_name;
	private String user_email;
	private String password;

public UserAccount() {
	
}

public String getUser_id() {
	return user_id;
}

public void setUser_id(String user_id) {
	this.user_id = user_id;
}

public String getFirst_name() {
	return first_name;
}

public void setFirst_name(String first_name) {
	this.first_name = first_name;
}

public String getLast_name() {
	return last_name;
}

public void setLast_name(String last_name) {
	this.last_name = last_name;
}

public String getUser_email() {
	return user_email;
}

public void setUser_email(String user_email) {
	this.user_email = user_email;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}
	
}
