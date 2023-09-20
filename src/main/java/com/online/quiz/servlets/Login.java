package com.online.quiz.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.online.quiz.Dao.UserDao;
import com.online.quiz.entities.Message;
import com.online.quiz.entities.User;
import com.online.quiz.helper.ConnectionProvider;




public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		
		// for checking username and email we have to get all the user from db to compare
		UserDao uDao = new UserDao(ConnectionProvider.getConnection());
		
		User user =  uDao.getAllUserByEmailAndPassword(email, pass);
		
		if(user == null)
		{
			System.out.println("login failed");
			out.println("username or password is wrong, try again");
			Message msg = new Message("Email And Password is invalid!!!", "error", "text-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect("login.jsp");
			
		}
		else {
			
			
			System.out.println("Login Successfully");
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			out.println("Login Successfully");
			response.sendRedirect("profile.jsp");
			
		
		}
		
		
		
		
		
	}

}
