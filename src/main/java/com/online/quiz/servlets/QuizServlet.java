package com.online.quiz.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.online.quiz.Dao.QuizDao;
import com.online.quiz.entities.Quiz;
import com.online.quiz.entities.User;
import com.online.quiz.helper.ConnectionProvider;


@MultipartConfig
//@WebServlet(name = "QuizServlet1", urlPatterns = {"/QuizServlet1"})
public class QuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		try {
			
//			if(request.getParameter("submitQuiz") != null) {
//				System.out.println("value : "+request.getParameter("QuizId"));
//				System.out.println("value : "+request.getParameter("QuizTotalQuestions"));
//			} else {
			
				//qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active, cid, uid, qDate
				
				int cid =Integer.parseInt(request.getParameter("quizexamcategoryid"));
				
				System.out.println(cid);
				
				String qtitle = request.getParameter("qtitle1");
				
				System.out.println(qtitle);
				
				String quizcontent = request.getParameter("quizcontent1");
				
				System.out.println(quizcontent);
				
				int questionnumber =Integer.parseInt(request.getParameter("questionnumber1"));
				
				System.out.println(questionnumber);
				
				int maxMarks = questionnumber * 5;
				
				System.out.println(maxMarks);
				
				User user = (User) session.getAttribute("user");
				
				System.out.println(user.getId());
				
				
				Quiz quiz = new Quiz(qtitle, quizcontent, maxMarks, questionnumber, "yes", cid, user.getId(),null);
				
				QuizDao qDao = new QuizDao(ConnectionProvider.getConnection());
				
				boolean  status =  qDao.insertQuiz(quiz);
				
				if(status)
				{
					
					out.println("done");
					System.out.println("quiz inserted successfully");
					
				}
				else {
					
					out.println("failed");
					System.out.println("quiz not inserted");
					
				}
				
				
			// }
			
			
			
			
			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		
		
	}

}
