package com.online.quiz.entities;

import java.sql.Timestamp;

public class Quiz {

	//quiz
	//qid, qtitle, qdescripton, maxMarks, numberOfQuestion, active, cid, uid, qDate
	
	private int qid;
	private String qtitle;
	private String qdescripton;
	private int maxMarks;
	private int numberOfQuestion;
	private String active;
	private int cid;
	private int uid;
	private Timestamp qDate;
	
	
	
	public Quiz(int qid, String qtitle, String qdescripton, int maxMarks, int numberOfQuestion, String active, int cid,
			int uid,Timestamp qDate) {
		super();
		this.qid = qid;
		this.qtitle = qtitle;
		this.qdescripton = qdescripton;
		this.maxMarks = maxMarks;
		this.numberOfQuestion = numberOfQuestion;
		this.active = active;
		this.cid = cid;
		this.uid = uid;
		this.qDate = qDate;
	}



	public Quiz(String qtitle, String qdescripton, int maxMarks, int numberOfQuestion, String active, int cid,
			int uid,Timestamp qDate) {
		super();
		this.qtitle = qtitle;
		this.qdescripton = qdescripton;
		this.maxMarks = maxMarks;
		this.numberOfQuestion = numberOfQuestion;
		this.active = active;
		this.cid = cid;
		this.uid = uid;
		this.qDate = qDate;
	}

	
	
	
	


	public Quiz(int qid, String qtitle, String qdescripton, int maxMarks, int numberOfQuestion, String active, int cid,
			Timestamp qDate) {
		super();
		this.qid = qid;
		this.qtitle = qtitle;
		this.qdescripton = qdescripton;
		this.maxMarks = maxMarks;
		this.numberOfQuestion = numberOfQuestion;
		this.active = active;
		this.cid = cid;
		this.qDate = qDate;
	}



	public Quiz() {
		super();
	}



	public int getQid() {
		return qid;
	}



	public void setQid(int qid) {
		this.qid = qid;
	}



	public String getQtitle() {
		return qtitle;
	}



	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}



	public String getQdescripton() {
		return qdescripton;
	}



	public void setQdescripton(String qdescripton) {
		this.qdescripton = qdescripton;
	}



	public int getMaxMarks() {
		return maxMarks;
	}



	public void setMaxMarks(int maxMarks) {
		this.maxMarks = maxMarks;
	}



	public int getNumberOfQuestion() {
		return numberOfQuestion;
	}



	public void setNumberOfQuestion(int numberOfQuestion) {
		this.numberOfQuestion = numberOfQuestion;
	}



	public String getActive() {
		return active;
	}



	public void setActive(String active) {
		this.active = active;
	}



	public int getCid() {
		return cid;
	}



	public void setCid(int cid) {
		this.cid = cid;
	}



	public int getUid() {
		return uid;
	}



	public void setUid(int uid) {
		this.uid = uid;
	}



	public Timestamp getqDate() {
		return qDate;
	}



	public void setqDate(Timestamp qDate) {
		this.qDate = qDate;
	}
	
	
	
	
	   
}
