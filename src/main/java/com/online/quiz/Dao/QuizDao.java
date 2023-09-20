package com.online.quiz.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.online.quiz.entities.Category;
import com.online.quiz.entities.Quiz;

public class QuizDao {

	
	private Connection con;

	public QuizDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	
	// insert the new quiz 
	
	public boolean insertQuiz(Quiz quiz)
	{
		boolean status = false;
		
		try {
			
			
			//qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active, cid, uid, qDate
			
			String query = "insert into quiz(qtitle, qdescripton, maxMarks, numberOfQuestion, cid, uid) values(?,?,?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, quiz.getQtitle());
			ps.setString(2, quiz.getQdescripton());
			ps.setInt(3, quiz.getMaxMarks());
			ps.setInt(4, quiz.getNumberOfQuestion());
			ps.setInt(5, quiz.getCid());
			ps.setInt(6, quiz.getUid());
			
			ps.executeUpdate();
			
			status = true;
			
			
		} catch (Exception e) {
			
			
			e.printStackTrace();
		}
		
		return status;
	
	}
	
	
	
	
	
	
	// get the total count
	
	public int getTotalCount() {
		
		int count = 0;
		
		try {
			
			String query = "select count(*) from quiz";
			
			PreparedStatement ps = con.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt(1);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
		
	}
	
	
	
	
	
// write a method for fetching all the quizes
	
    public ArrayList<Quiz> getAllQuizes(int pageNumber,int pageSize){
		
		
		  ArrayList<Quiz> list = new ArrayList<Quiz>();
		
		
		    try {
		    	
		    	//quiz
		    	//qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active, cid, uid, qDate
		    	String query = "select * from quiz limit ?, ?";
		    		
		    	PreparedStatement ps= con.prepareStatement(query);
		    	ps.setInt(1, pageNumber);
		    	ps.setInt(2, pageSize);
		    	ResultSet rs = ps.executeQuery();
		    	
		    	while(rs.next())
		    	{
		    		
		    		int qid = rs.getInt("qid");
		    		String qtitle = rs.getString("qtitle");
		    		String qdescripton = rs.getString("qdescripton");
		    		String active = rs.getString("active");
		    		int maxMarks = rs.getInt("maxMarks");
		    		int numberOfQuestion = rs.getInt("numberOfQuestion");
		    		int cid = rs.getInt("cid");
		    		int uid = rs.getInt("uid");
		    		Timestamp qDate = rs.getTimestamp("qDate");		
		    		
		    		Quiz quiz = new Quiz(qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active, cid, uid, qDate);
		    		
		    		list.add(quiz);
		    		
		    		
		    	}
		    	
		    		
			} catch (Exception e) {
				
				
				e.printStackTrace();
				
				
			}
		   
		
		return list;
		
	} 
	
	
	
	
	
    
// write a method for fetching all the quizzes by userid
	
    public ArrayList<Quiz> getAllQuizesByCatId(int cid){
		
		
		  ArrayList<Quiz> list = new ArrayList<Quiz>();
		
		
		    try {
		    	
		    	//quiz
		    	//qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active, cid, uid, qDate
		    	String query = "select * from quiz where cid = ?";
		    		
		    	PreparedStatement ps= con.prepareStatement(query);
		    	ps.setInt(1, cid);
		    	
		    	ResultSet rs = ps.executeQuery();
		    	
		    	
		    	while(rs.next())
		    	{
		    		
		    		int qid = rs.getInt("qid");
		    		String qtitle = rs.getString("qtitle");
		    		String qdescripton = rs.getString("qdescripton");
		    		String active = rs.getString("active");
		    		int maxMarks = rs.getInt("maxMarks");
		    		int numberOfQuestion = rs.getInt("numberOfQuestion");
		    		int cid1 = rs.getInt("cid");
		    		int uid = rs.getInt("uid");
		    		Timestamp qDate = rs.getTimestamp("qDate");		
		    		
		    		Quiz quiz = new Quiz(qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active,cid1, uid,qDate);
		    		
		    		list.add(quiz);
		    		
		    		
		    	}
		    	
		    		
			} catch (Exception e) {
				
				
				e.printStackTrace();
				
				
			}
		   
		
		return list;
		
	} 
    
    
    
    
    
   
    
    
    
    
// write a method for fetching all the quiz info by quizID
	
    public Quiz getQuizByQuizId(int quiz){
		
		
		  Quiz qlist = null;
		
		
		    try {
		    	
		    	//quiz
		    	//qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active, cid, uid, qDate
		    	String query = "select * from quiz where qid = ?";
		    		
		    	PreparedStatement ps= con.prepareStatement(query);
		    	ps.setInt(1, quiz);
		    	
		    	ResultSet rs = ps.executeQuery();
		    	
		    	
		    	if(rs.next())
		    	{
		    		
		    		int qid = rs.getInt("qid");
		    		String qtitle = rs.getString("qtitle");
		    		String qdescripton = rs.getString("qdescripton");
		    		String active = rs.getString("active");
		    		int maxMarks = rs.getInt("maxMarks");
		    		int numberOfQuestion = rs.getInt("numberOfQuestion");
		    		int cid1 = rs.getInt("cid");
		    		int uid = rs.getInt("uid");
		    		Timestamp qDate = rs.getTimestamp("qDate");		
		    		
		    		qlist = new Quiz(qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active,cid1, uid,qDate);
		    		
		    			
		    	}
		    	
		    		
			} catch (Exception e) {
				
				
				e.printStackTrace();
				
				
			}
		   
		
		return qlist;
		
	} 
    
    
    
    
    
    
    
    
    
    
    
    
// write a method for fetching all the quizzes by userid
	
    public ArrayList<Quiz> getAllQuizesByUserId(int uid){
		
		
		  ArrayList<Quiz> list = new ArrayList<Quiz>();
		
		
		    try {
		    	
		    	//quiz
		    	//qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active, cid, uid, qDate
		    	String query = "select * from quiz where uid = ?";
		    		
		    	PreparedStatement ps= con.prepareStatement(query);
		    	ps.setInt(1, uid);
		    	
		    	ResultSet rs = ps.executeQuery();
		    	
		    	
		    	while(rs.next())
		    	{
		    		
		    		int qid = rs.getInt("qid");
		    		String qtitle = rs.getString("qtitle");
		    		String qdescripton = rs.getString("qdescripton");
		    		String active = rs.getString("active");
		    		int maxMarks = rs.getInt("maxMarks");
		    		int numberOfQuestion = rs.getInt("numberOfQuestion");
		    		int cid = rs.getInt("cid");
		    		Timestamp qDate = rs.getTimestamp("qDate");		
		    		
		    		Quiz quiz = new Quiz(qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active, cid,qDate);
		    		
		    		list.add(quiz);
		    		
		    		
		    	}
		    	
		    		
			} catch (Exception e) {
				
				
				e.printStackTrace();
				
				
			}
		   
		
		return list;
		
	} 
	
	
	
	
	
	
	
	
	
	
	
	
}
