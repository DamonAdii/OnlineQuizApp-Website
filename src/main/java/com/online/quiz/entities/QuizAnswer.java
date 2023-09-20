package com.online.quiz.entities;

public class QuizAnswer {

	
	  //qaid, answered, answer, correct, rid, qid, uid
	private int qaid;
	private int answered;
	private String answer;
	private int correct;
	private int rid;
	private int qid;
	private int uid;
	
	
	


	public QuizAnswer(int qaid, int answered, String answer, int correct, int rid, int qid, int uid) {
		super();
		this.qaid = qaid;
		this.answered = answered;
		this.answer = answer;
		this.correct = correct;
		this.rid = rid;
		this.qid = qid;
		this.uid = uid;
	}

	
	


	public QuizAnswer(int answered, String answer, int correct, int rid, int qid, int uid) {
		super();
		this.answered = answered;
		this.answer = answer;
		this.correct = correct;
		this.rid = rid;
		this.qid = qid;
		this.uid = uid;
	}





	public int getQaid() {
		return qaid;
	}



	public void setQaid(int qaid) {
		this.qaid = qaid;
	}



	public int getAnswered() {
		return answered;
	}



	public void setAnswered(int answered) {
		this.answered = answered;
	}

 







	public int getCorrect() {
		return correct;
	}



	public void setCorrect(int correct) {
		this.correct = correct;
	}


	


	public String getAnswer() {
		return answer;
	}





	public void setAnswer(String answer) {
		this.answer = answer;
	}





	public int getRid() {
		return rid;
	}





	public void setRid(int rid) {
		this.rid = rid;
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
	
	
	
	
	
	
}
