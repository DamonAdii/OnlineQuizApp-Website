package com.online.quiz.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import com.mysql.cj.x.protobuf.MysqlxCursor.Fetch;
import com.online.quiz.entities.Quiz;
import com.online.quiz.entities.QuizAnswer;
import com.online.quiz.entities.QuizResult;

public class QuizResultDao {

	 
	private Connection con;

	public QuizResultDao(Connection con) {
		super();
		this.con = con;
	}
	

	//public int saveQuizResult(QuizResult quizResult)
	public QuizResult saveQuizResult(HttpServletRequest request, int qid, int uid, int tottalnumberofquestion)
	{
		QuizResult quizResult = null;
		
		int last_inserted_id = 0;
		
		try {
			
			//qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active, cid, uid, qDate
			//rid, total_marks, rightAnswerCount, wrongAnswerCount, qid, uid, resDate, totalquestion, totalmarksobtained
			
			//String queryString ="insert into quizresult(total_marks, rightAnswerCount, wrongAnswerCount, qid, uid, totalquestion, totalmarksobtained) values(?,?,?,?,?,?,?)";
			
			//String queryString ="insert into quizresult (select 0 rid,maxMarks total_marks,'0' rightAnswerCount,'0' wrongAnswerCount, qid, '1' uid,now() resDate,numberOfQuestions totalquestion,'' totalmarksobtained from quiz where qid = '6')";
			String queryString ="insert into quizresult (select 0 rid,maxMarks total_marks,'0' rightAnswerCount,'0' wrongAnswerCount, qid, '1' uid,now() resDate,numberOfQuestion totalquestion, '0' totalmarksobtained from quiz where qid = ?)";
			
			
			PreparedStatement ps = con.prepareStatement(queryString, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, qid);
			
			/*
			ps.setInt(1, quizResult.getTotal_marks());
			ps.setInt(2, quizResult.getRightAnswerCount());
			ps.setInt(3, quizResult.getWrongAnswerCount());
			ps.setInt(4, quizResult.getQid());
			ps.setInt(5, quizResult.getUid());
			ps.setInt(6, quizResult.getTotalquestion());
			ps.setInt(7, quizResult.getTotalmarksobtained());
			*/
			
			int quizresultInserted = ps.executeUpdate();
			
			ResultSet rs = ps.getGeneratedKeys();
            
			if(rs.next())
            {
                last_inserted_id = rs.getInt(1);
            }
			
            
            //Inserting uizanswerw
            // //qaid, answered, answer, correct, rid, qid, uid
			
			
			//String rows = "";
			String query = "";
			
			for(int i=1; i<=tottalnumberofquestion;i++) {
				int questionID = Integer.parseInt(request.getParameter("question"+i));
				
				String useranswer = request.getParameter("radio"+i);
				
				int answered = Integer.parseInt(request.getParameter("questionanswered"+i));
				
				
				
				String row = "";
				if(i == 1) {
					row = "insert into quizanswers values(0,'"+answered+"','"+useranswer+"','0','"+last_inserted_id+"','"+questionID+"','"+uid+"') ";
				} else {
					row = ",(0,'"+answered+"','"+useranswer+"','0','"+last_inserted_id+"','"+questionID+"','"+uid+"')";
				}
				
				query = query + row;
				
				
				
				/*
				if( answered == 1 ) {
					//qaid, answered, answer, correct, rid, qid, uid
					rows = "insert into answered(answered, answer, correct, rid, qid, uid) values(0,?,?,?,?,?)";
					
					PreparedStatement ps2 = con.prepareStatement(rows);
					ps2.setInt(1, answered);
					ps2.setString(2, "");
					ps2.setInt(3, 0);
					ps2.setInt(4, last_inserted_id);
					ps2.setInt(5, qid);
					ps2.setInt(6, uid);
					
					ps2.executeUpdate();
					
					
				}*/
				
				
				
			}
			
			Statement stmt = con.createStatement();
			int noOfRowsOfAnswersInsertedCount = stmt.executeUpdate(query);
				
			int answersInserted = 0;
			if(noOfRowsOfAnswersInsertedCount == tottalnumberofquestion) {
				answersInserted++;
			}
            
            
            //steps given
            
			String query3 = "update quizanswers qa inner join question q  on q.quesid = qa.qid set qa.correct = case when qa.answer = q.answer then 1 else 0 end  where qa.rid=?";
			PreparedStatement ps3 = con.prepareStatement(query3);
			ps3.setInt(1, last_inserted_id);
			ps3.executeUpdate();
			
			String query4 = "update quizresult qr set rightAnswerCount = (select sum(correct) from quizanswers qa where qa.rid = ?) where qr.rid = ?;";
			PreparedStatement ps4 = con.prepareStatement(query4);
			ps4.setInt(1, last_inserted_id);
			ps4.setInt(2, last_inserted_id);
			ps4.executeUpdate();
			
			String query5 = "update quizresult set wrongAnswerCount = totalquestion - rightAnswerCount,totalmarksobtained = rightAnswerCount*(total_marks/totalquestion) where rid = ?";
			PreparedStatement ps5 = con.prepareStatement(query5);
			ps5.setInt(1, last_inserted_id);
			ps5.executeUpdate();
			
            
            //Fetch Result
			String query6 = "select * from quizresult where rid = ?";
			PreparedStatement ps6 = con.prepareStatement(query6);
			ps6.setInt(1, last_inserted_id);
			ResultSet rs2 = ps6.executeQuery();
			int resultExists = 0;
			while(rs2.next())
			{
				//rid, total_marks, rightAnswerCount, wrongAnswerCount, qid, uid, resDate, totalquestion, totalmarksobtained
				int rid = rs2.getInt("rid");
				int total_marks = rs2.getInt("total_marks");
				int rightAnswerCount = rs2.getInt("rightAnswerCount");
				int wrongAnswerCount = rs2.getInt("wrongAnswerCount");
				Timestamp resDate = rs2.getTimestamp("resDate");
				int totalquestion = rs2.getInt("totalquestion");
				int totalmarksobtained = rs2.getInt("totalmarksobtained");
				
				quizResult = new QuizResult(rid, total_marks, rightAnswerCount, wrongAnswerCount, qid, uid, totalquestion, totalmarksobtained, resDate);
				resultExists++;
			}
			
			quizResult.setResultExists(resultExists);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		
		return quizResult;
		
	}
	
	
	
	
	
	
	
	public QuizResult getQuizResult(int qid, int uid)
	{
		QuizResult quizResult = null;
		
		try {
			
			////rid, total_marks, rightAnswerCount, wrongAnswerCount, qid, uid, resDate, totalquestion, totalmarksobtained
			String queryString ="select * from quizresult where qid=? and uid = ?";
			
			PreparedStatement ps = con.prepareStatement(queryString);
			ps.setInt(1, qid);
			ps.setInt(1, uid);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				int rid = rs.getInt("rid");
				int total_marks = rs.getInt("total_marks");
				int rightAnswerCount = rs.getInt("rightAnswerCount");
				int wrongAnswerCount = rs.getInt("wrongAnswerCount");
				int qid2 = rs.getInt("qid");
				int uid2 = rs.getInt("uid");
				Timestamp resDate = rs.getTimestamp("resDate");
				int totalquestion = rs.getInt("totalquestion");
				int totalmarksobtained = rs.getInt("totalmarksobtained");
                
				quizResult = new QuizResult(rid, total_marks, rightAnswerCount, wrongAnswerCount, qid2, uid2, totalquestion, totalmarksobtained, resDate);
				
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		
		return quizResult;
		
	}
	
	
	
	
}
