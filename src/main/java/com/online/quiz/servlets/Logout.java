package com.online.quiz.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.online.quiz.entities.Message;


public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("user");
		
		
		Message msg = new Message("Logout Successfully", "sucecss","text-success");
		session.setAttribute("msg", msg);
		System.out.println("logout successfully");
		response.sendRedirect("login.jsp");
		
		
	}

	

}
