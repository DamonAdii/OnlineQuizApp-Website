package com.online.quiz.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	
	  private static Connection con;
	  
	  public static Connection getConnection() {
		  
		  try {
			
			  
			  if(con==null)
			  {
				  
				  // if connection is null then only create new connection
				  
				  // step 1: upload a driver class by class.forname()
				  
				  Class.forName("com.mysql.cj.jdbc.Driver");
				  
				  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequizapp","root","root");
				  
				  System.out.println("Connection is created"+con);
				  
			  }
			  
			  
			  
			  
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		  
		  
		  
		  return con;
		  
	  }
	
	
}
