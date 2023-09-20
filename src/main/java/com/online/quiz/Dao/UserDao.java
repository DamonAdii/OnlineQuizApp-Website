package com.online.quiz.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import com.online.quiz.entities.User;

public class UserDao {

	
	
	private Connection con;

	
	
	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	
	// write a method insertUser for registration
	
	public boolean insertUser(User user)
	{
		boolean status = false;
		
		try {
			
			
			// write a query for inserting a user
			//id, name, email, gender, pass, module, profile, rdate
			
			String query = "insert into register(name, email, gender, pass, module) values(?,?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getGender());
			ps.setString(4, user.getPass());
			ps.setString(5, user.getModule());
			
			ps.executeUpdate();
			
			status = true;
			
			
		} catch (Exception e) {
			
			
			e.printStackTrace();
			
			
		}
		
		return status;
		
	}
	
	
	
	
	
	
	
	
	
	// write a method for selecting all the user from db
	
		public User getAllUserByEmailAndPassword(String email,String pass)
		{
			User user = null;
			
			try {
				
				
				// write a query for inserting a user
				//id, name, email, gender, pass, module, profile, rdate
				
				String query = "select * from register where email=? and pass=?";
				
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setString(1, email);
				ps.setString(2, pass);

				ResultSet rSet =  ps.executeQuery();
				
				while(rSet.next())
				{
					
					user = new User();
					
					user.setId(rSet.getInt("id"));
					user.setName(rSet.getString("name"));
					user.setEmail(rSet.getString("email"));
					user.setGender(rSet.getString("gender"));
					user.setPass(rSet.getString("pass"));
					user.setModule(rSet.getString("module"));
					user.setProfile(rSet.getString("profile"));
					user.setRdate(rSet.getTimestamp("rdate"));
					
				   
				}
				
				
				
			} catch (Exception e) {
				
				
				e.printStackTrace();
				
				
			}
			
			return user;
			
		}
	
	
}
