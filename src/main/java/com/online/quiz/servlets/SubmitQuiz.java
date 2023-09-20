package com.online.quiz.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.online.quiz.Dao.QuestionDao;
import com.online.quiz.Dao.QuizResultDao;
import com.online.quiz.entities.Message;
import com.online.quiz.entities.Question;
import com.online.quiz.entities.QuizAnswer;
import com.online.quiz.entities.QuizResult;
import com.online.quiz.entities.User;
import com.online.quiz.helper.ConnectionProvider;

public class SubmitQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
	    
		
		
		
		try {
			
			
			System.out.println("yes im in submit quiz");
			
			if(request.getParameter("SubmitQuiz") != null) {
				
				System.out.println("QuizId value : "+request.getParameter("QuizId"));
				System.out.println("Total No. of Questions : "+request.getParameter("QuizTotalQuestions"));
				
				int quizID = Integer.parseInt(request.getParameter("QuizId"));
				//System.out.println(quizID);
				
				int quizTotalQuestions = Integer.parseInt(request.getParameter("QuizTotalQuestions"));
				//System.out.println(quizTotalQuestions);
				
				
				 User user= (User) session.getAttribute("user");
				 int uid = user.getId();
				 System.out.println("this is user id : "+uid);
				 
				 
				 QuizResultDao quizResultDao = new QuizResultDao(ConnectionProvider.getConnection());
				 
				 QuizResult quizResult = quizResultDao.saveQuizResult(request, quizID, uid, quizTotalQuestions);
				 
				 if(quizResult != null)
				 {
					 System.out.println("total marks is : "+quizResult.getTotalmarksobtained());
					 
				 }
				 else {
					
					 System.out.println("result is not present!!!");
					 
				}
				 
				 request.setAttribute("quizResult", quizResult);
				 RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
				 
				 rd.forward(request, response);
				 
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		
	}

}
