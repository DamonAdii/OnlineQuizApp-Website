package com.online.quiz.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.online.quiz.Dao.UserDao;
import com.online.quiz.entities.User;
import com.online.quiz.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		
		// fetch all the data from registeration form 
		
		
		String check = request.getParameter("check");
		
		if(check==null)
		{
			System.out.println("terms and condition check box is not checked");
			response.sendRedirect("register.jsp");
		}
		else {
			
			String username = request.getParameter("name1");
			String useremail = request.getParameter("email1");
			String module = request.getParameter("module1");
			String pass = request.getParameter("pass1");
			String cpass = request.getParameter("cpass1");
			String gender = request.getParameter("gender1");
			
			System.out.println(username+" "+useremail+" "+module+" "+pass+" "+cpass+" "+gender);
			
			
			// intilizing the values in User entity
			
			if(pass.equals(cpass)) 
		    {
				
				User user = new User(username,useremail,gender,pass,module);
				
				System.out.println(user);
				
				// now insert user into a database by UserDao
				
				UserDao uDao = new UserDao(ConnectionProvider.getConnection());
				
				
				if(uDao.insertUser(user))
				{
					
					out.println("done");
					System.out.println("Successfylly inserted");
					
				}
				else {
					
					out.println("failed");
					System.out.println("Failed insertion");
					
				}
				
		    }
			else {
				
				System.out.println(pass+" pass is not eual to "+cpass);
				
			}
			
			
			
			
			
			
			
		}
		
		
	}

}
