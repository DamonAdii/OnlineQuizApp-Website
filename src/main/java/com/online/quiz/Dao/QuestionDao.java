package com.online.quiz.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.eclipse.jdt.internal.compiler.ast.AND_AND_Expression;
import org.eclipse.jdt.internal.compiler.lookup.ImplicitNullAnnotationVerifier;

import com.mysql.cj.x.protobuf.MysqlxCrud.Insert;
import com.mysql.cj.x.protobuf.MysqlxCrud.Update;
import com.online.quiz.entities.Question;
import com.online.quiz.entities.Quiz;

public class QuestionDao {
	
	private Connection con;

	public QuestionDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	// insert the new question 
	
		public boolean insertQuestion(Question question)
		{
			boolean status = false;
			
			try {
				
				//question
				//quesid, content, option1, option2, option3, option4, answer, cid, uid, qid, quesDate
				
				String query = "insert into question(content, option1, option2, option3, option4, answer, uid, qid) values(?,?,?,?,?,?,?,?)";
				
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setString(1, question.getContent());
				ps.setString(2, question.getOption1());
				ps.setString(3, question.getOption2());
				ps.setString(4, question.getOption3());
				ps.setString(5, question.getOption4());
				ps.setString(6, question.getAnswer());
				ps.setInt(7, question.getUid());
				ps.setInt(8, question.getQid());
				
				ps.executeUpdate();
				
				status = true;
				
				
			} catch (Exception e) {
				
				
				e.printStackTrace();
			}
			
			return status;
		
		}
		
		
		
		
		
		
		
		
		
		// fetch all the question by quiz id 
		
			public ArrayList<Question> getAllQuestionsByGid(int qid,int limit)
			{
				ArrayList<Question> qList = new ArrayList<Question>();
				
				try {
					
					//question
					//quesid, content, option1, option2, option3, option4, answer, uid, qid, quesDate
					
					String query = "select * from question where qid = ? limit ?";
					
					PreparedStatement ps = con.prepareStatement(query);
					
					ps.setInt(1, qid);
					ps.setInt(2, limit);
					
					ResultSet rs = ps.executeQuery();
					
					while(rs.next())
					{
						
						int quesId = rs.getInt("quesid");
						String content = rs.getString("content");
						String option1 = rs.getString("option1");
						String option2 = rs.getString("option2");
						String option3 = rs.getString("option3");
						String option4 = rs.getString("option4");
						String answer = rs.getString("answer");
						int uid = rs.getInt("uid");
						int qid2 = rs.getInt("qid");
						Timestamp quesDate = rs.getTimestamp("quesDate");
 						
						Question question = new Question(quesId, content, option1, option2, option3, option4, answer, qid2, uid, quesDate);
						
						qList.add(question);
						
						
					}
					
					
				} catch (Exception e) {
					
					
					e.printStackTrace();
				}
				
				return qList;
			
			}
		
		
			
			
			// a method for checking answer
			public Question getQuestionByQuesId(int quesid,int quizid,int fetchNext)
			{
				Question question = null;
				
				  try {
					
					  
						
						//question
						//quesid, content, option1, option2, option3, option4, answer, uid, qid, quesDate
					  /*
					  String query = "select * from question where quesid = ?";
					  PreparedStatement ps = con.prepareStatement(query);
					  ps.setInt(1, quesid);
					  if(con == null ) {
						  System.out.println("con is null");
					  } else {
						  System.out.println("con is not null");
					  }*/
					  
					  String query = "";
					  PreparedStatement ps = null;
					  if(quesid == 0) {
						  query = "select * from question where qid = ? limit 1";
						  ps = con.prepareStatement(query);
						  ps.setInt(1, quizid);
						  System.out.println("1");
					  } else if(fetchNext == 1){
						  query = "select * from question where qid = ? and quesid > ? limit 1;";
						  ps = con.prepareStatement(query);
						  ps.setInt(1, quizid);
						  ps.setInt(2, quesid);
						  System.out.println("2");
					  }else if(fetchNext == -1){
							  query = "select * from question where qid = ? and quesid > ? limit 1;";
							  ps = con.prepareStatement(query);
							  ps.setInt(1, quizid);
							  ps.setInt(2, quesid);
							  System.out.println("-1");
					  }  else {
						  query = "select * from question where qid = ? and quesid = ?";
						  ps = con.prepareStatement(query);
						  ps.setInt(1, quizid);
						  ps.setInt(2, quesid);
						  System.out.println("3");
					  }
					  
					  
					  
						ResultSet rSet = ps.executeQuery();
						
						if(rSet.next())
						{
							int quesId = rSet.getInt("quesid");
							String content = rSet.getString("content");
							String option1 = rSet.getString("option1");
							String option2 = rSet.getString("option2");
							String option3 = rSet.getString("option3");
							String option4 = rSet.getString("option4");
							String answer = rSet.getString("answer");
							int uid = rSet.getInt("uid");
							int qid2 = rSet.getInt("qid");
							Timestamp quesDate = rSet.getTimestamp("quesDate");
							
							question = new Question(quesId, content, option1, option2, option3, option4, answer, qid2, uid, quesDate);
							
						}
					  
					  
				} catch (Exception e) {
					
					
					e.printStackTrace();
					
				}
				
				return question;
			}
		
			
			
//			public int saveQuizAnswersOnSubmit(HttpServletRequest req,int TotalQuestions,int QuizId) {
//			req.	
//			int status = 0;
//				try {
//					1) Insert quizresult AND_get rid
//					//rid, total_marks, rightAnswerCount, wrongAnswerCount, qid, uid, resDate, totalquestion, totalmarksobtained
//					insert into quizresult (select 0 rid,maxMarks total_marks,'0' rightAnswerCount,'0' wrongAnswerCount, qid,'uid' uid,now() resDate,numberOfQuestions totalquestion,'' totalmarksobtained from quiz where qid = '6');
//
//					String rows = "";
//					for() {
//						//String questionid = 
//						//String useranswer =
//						//
//						
//						if(answered == 1 ) {
//							//slno,quizresultid, qid , answered(0/1) , answer , correct
//							String row = "(0,rid,qid,useranswer,answer,'0')";
//						}
//						
//						if(rows.equalsIgnoreCase("")) {
//							rows = row;
//						} else {
//							rows = rows + "," + row;
//						}
//						
//					}
//					
//					if(rows.equalsIgnoreCase("")) {
//						//No answers
//					} else {
//						rows = "insert into answers values "+rows + "," + row;
//					}
//					
//					3) Update correct anseres in quiz answer table
//
//					4) Update quizresult for ResultSet
//
//					5) show result
//					
//					
//					
//					
//				} catch (Exception exe) {
//					exe.printStackTrace();
//				}
//				return status;
//			}
			
			
			
			
			
			
			// fetch all the question answerer by question id and quiz id
			
				public Question getQuestionAnswer(int quesid,int qid)
				{
					Question question = null;
					
					try {
						
						//question
						//quesid, content, option1, option2, option3, option4, answer, uid, qid, quesDate
						
						String query = "select * from question where quesid = ? and qid = ?";
						
						PreparedStatement ps = con.prepareStatement(query);
						
						ps.setInt(1, quesid);
						ps.setInt(2, qid);
						
						ResultSet rs = ps.executeQuery();
						
						if(rs.next())
						{
							
							int quesId = rs.getInt("quesid");
							String content = rs.getString("content");
							String option1 = rs.getString("option1");
							String option2 = rs.getString("option2");
							String option3 = rs.getString("option3");
							String option4 = rs.getString("option4");
							String answer = rs.getString("answer");
							int uid = rs.getInt("uid");
							int qid2 = rs.getInt("qid");
							Timestamp quesDate = rs.getTimestamp("quesDate");
	 						
							question = new Question(quesId, content, option1, option2, option3, option4, answer, qid2, uid, quesDate);
							
						}
						
						
					} catch (Exception e) {
						
						
						e.printStackTrace();
					}
					
					return question;
				
				}
				
			
			
			
			
			
		
		

}
