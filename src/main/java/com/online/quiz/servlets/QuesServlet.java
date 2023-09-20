package com.online.quiz.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.online.quiz.Dao.QuestionDao;
import com.online.quiz.entities.Message;
import com.online.quiz.entities.Question;
import com.online.quiz.entities.User;
import com.online.quiz.helper.ConnectionProvider;


public class QuesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		
		
		try {
			
			
			//qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active, cid, uid, qDate
			
			int qid =Integer.parseInt(request.getParameter("quizID"));
			
			System.out.println(qid);
			
			String quesTitle1 = request.getParameter("quesTitle1");
			
			System.out.println(quesTitle1);
			
			String quesOption1 = request.getParameter("quesA");
			
			System.out.println(quesOption1);
			
			String quesOption2 = request.getParameter("quesB");
			
			System.out.println(quesOption2);
			
			String quesOption3 = request.getParameter("quesC");
			
			System.out.println(quesOption3);
			
			String quesOption4 = request.getParameter("quesD");
			
			System.out.println(quesOption4);
			
			String quesAns1 = request.getParameter("answerQue");
			
			System.out.println(quesAns1);
			
			
			
			User user = (User) session.getAttribute("user");
			
			System.out.println(user.getId());
			
			
			
			Question question = new Question(quesTitle1, quesOption1, quesOption2, quesOption3, quesOption4, quesAns1, qid, user.getId(), null);
			
			
			QuestionDao uQuestionDao = new QuestionDao(ConnectionProvider.getConnection());
			
			boolean status = uQuestionDao.insertQuestion(question);
			
			if(status)
			{
				
				out.println("done");
				System.out.println("quiz inserted successfully");
				Message msg = new Message("Question Added Successfully!!!", "success", "text-success");
				session.setAttribute("msg", msg);
				response.sendRedirect("createQuestion.jsp");
			}
			else {
				
				out.println("failed");
				System.out.println("quiz not inserted");
				Message msg = new Message("Question Invalid!!!", "error", "text-danger");
				session.setAttribute("msg", msg);
				response.sendRedirect("createQuestion.jsp");
				
				
			}
			
			
			
			
			
			
		} catch (Exception e) {
			
			
			e.printStackTrace();
			
			
			
		}
		
	}

}
