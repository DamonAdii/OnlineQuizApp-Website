package com.online.quiz.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.online.quiz.entities.Category;

public class CategoryDao {

	
	
	private Connection con;

	public CategoryDao(Connection con) {
		this.con = con;
	}
	
	
	
	
	// write a method for fetching all category
	
    public ArrayList<Category> getAllCategories(){
		
		
		  ArrayList<Category> list = new ArrayList<Category>();
		
		
		    try {
		    	
		    	//category
		    	//cid, ctitle, cdescripton, uid
		    	String query = "select * from category";
		    		
		    	PreparedStatement ps= con.prepareStatement(query);
		    	ResultSet rs = ps.executeQuery();
		    	
		    	while(rs.next())
		    	{
		    		
		    		int cid = rs.getInt("cid");
		    		String ctitle = rs.getString("ctitle");
		    		String cdescription = rs.getString("cdescripton");
		    		int uid = rs.getInt("uid");
		    		
		    		Category c = new Category(cid,ctitle,cdescription,uid,null);
		    		
		    		list.add(c);
		    		
		    	}
		    	
		    		
			} catch (Exception e) {
				
				
				e.printStackTrace();
				
				
			}
		   
		
		return list;
		
	} 
	
	
	
	
	
	
}
