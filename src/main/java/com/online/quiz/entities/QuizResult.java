package com.online.quiz.entities;

import java.sql.Timestamp;

public class QuizResult {
	
	//rid, total_marks, rightAnswerCount, wrongAnswerCount, qid, uid, resDate, totalquestion, totalmarksobtained
	
	private int rid;
	private int total_marks;
	private int rightAnswerCount;
	private int wrongAnswerCount;
	private int qid;
	private int uid;
	private int totalquestion;
	private int totalmarksobtained;
	private Timestamp resDate;
	private int resultExists;
	
	
	


	public int getResultExists() {
		return resultExists;
	}





	public void setResultExists(int resultExists) {
		this.resultExists = resultExists;
	}





	public QuizResult(int rid, int total_marks, int rightAnswerCount, int wrongAnswerCount, int qid, int uid,
			int totalquestion, int totalmarksobtained, Timestamp resDate) {
		super();
		this.rid = rid;
		this.total_marks = total_marks;
		this.rightAnswerCount = rightAnswerCount;
		this.wrongAnswerCount = wrongAnswerCount;
		this.qid = qid;
		this.uid = uid;
		this.totalquestion = totalquestion;
		this.totalmarksobtained = totalmarksobtained;
		this.resDate = resDate;
	}

	
	


	public QuizResult(int total_marks, int rightAnswerCount, int wrongAnswerCount, int qid, int uid, int totalquestion,
			int totalmarksobtained, Timestamp resDate) {
		super();
		this.total_marks = total_marks;
		this.rightAnswerCount = rightAnswerCount;
		this.wrongAnswerCount = wrongAnswerCount;
		this.qid = qid;
		this.uid = uid;
		this.totalquestion = totalquestion;
		this.totalmarksobtained = totalmarksobtained;
		this.resDate = resDate;
	}





	public QuizResult() {
		super();
	}



	public int getRid() {
		return rid;
	}



	public void setRid(int rid) {
		this.rid = rid;
	}



	public int getTotal_marks() {
		return total_marks;
	}



	public void setTotal_marks(int total_marks) {
		this.total_marks = total_marks;
	}



	public int getRightAnswerCount() {
		return rightAnswerCount;
	}



	public void setRightAnswerCount(int rightAnswerCount) {
		this.rightAnswerCount = rightAnswerCount;
	}



	public int getWrongAnswerCount() {
		return wrongAnswerCount;
	}



	public void setWrongAnswerCount(int wrongAnswerCount) {
		this.wrongAnswerCount = wrongAnswerCount;
	}




	public int getQid() {
		return qid;
	}



	public void setQid(int qid) {
		this.qid = qid;
	}



	public int getUid() {
		return uid;
	}



	public void setUid(int uid) {
		this.uid = uid;
	}



	public Timestamp getResDate() {
		return resDate;
	}



	public void setResDate(Timestamp resDate) {
		this.resDate = resDate;
	}



	public int getTotalquestion() {
		return totalquestion;
	}



	public void setTotalquestion(int totalquestion) {
		this.totalquestion = totalquestion;
	}



	public int getTotalmarksobtained() {
		return totalmarksobtained;
	}



	public void setTotalmarksobtained(int totalmarksobtained) {
		this.totalmarksobtained = totalmarksobtained;
	}
	
	
	
	
	

}
