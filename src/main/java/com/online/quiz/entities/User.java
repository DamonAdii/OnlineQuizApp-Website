package com.online.quiz.entities;

import java.sql.Timestamp;

public class User {

	//id, name, email, gender, pass, module, profile, rdate
	
	private int id;
	private String name;
	private String email;
	private String gender;
	private String pass;
	private String module;
	private String profile;
	private Timestamp rdate;
	
	
	
	
	
	public User(int id, String name, String email, String gender, String pass, String module, String profile,
			Timestamp rdate) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.pass = pass;
		this.module = module;
		this.profile = profile;
		this.rdate = rdate;
	}





	public User(String name, String email, String gender, String pass, String module) {
		super();
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.pass = pass;
		this.module = module;
	}





	public User() {

	}





	public int getId() {
		return id;
	}





	public void setId(int id) {
		this.id = id;
	}





	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}





	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}





	public String getGender() {
		return gender;
	}





	public void setGender(String gender) {
		this.gender = gender;
	}





	public String getPass() {
		return pass;
	}





	public void setPass(String pass) {
		this.pass = pass;
	}





	public String getModule() {
		return module;
	}





	public void setModule(String module) {
		this.module = module;
	}





	public String getProfile() {
		return profile;
	}





	public void setProfile(String profile) {
		this.profile = profile;
	}





	public Timestamp getRdate() {
		return rdate;
	}





	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	
	
	
	
	
	
}
