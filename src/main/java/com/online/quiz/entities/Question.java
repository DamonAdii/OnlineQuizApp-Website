package com.online.quiz.entities;

import java.sql.Timestamp;

public class Question {

	//question
	//quesid, content, option1, option2, option3, option4, answer, cid, uid, qid, quesDate
	
	private int quesid;
	private String content;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String answer;
	private int qid;
	private int uid;
	private Timestamp quesDate;
	
	
	
	
	
	
	public Question(int quesid, String content, String option1, String option2, String option3, String option4,
			String answer, int qid, int uid,Timestamp quesDate) {
		super();
		this.quesid = quesid;
		this.content = content;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.answer = answer;
		this.qid = qid;
		this.uid = uid;
		this.quesDate = quesDate;
	}







	public Question(String content, String option1, String option2, String option3, String option4, String answer, int qid, int uid,Timestamp quesDate) {
		super();
		this.content = content;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.answer = answer;
		this.qid = qid;
		this.uid = uid;
		this.quesDate = quesDate;
	}







	public Question() {
		super();
	}







	public int getQuesid() {
		return quesid;
	}







	public void setQuesid(int quesid) {
		this.quesid = quesid;
	}







	public String getContent() {
		return content;
	}







	public void setContent(String content) {
		this.content = content;
	}







	public String getOption1() {
		return option1;
	}







	public void setOption1(String option1) {
		this.option1 = option1;
	}







	public String getOption2() {
		return option2;
	}







	public void setOption2(String option2) {
		this.option2 = option2;
	}







	public String getOption3() {
		return option3;
	}







	public void setOption3(String option3) {
		this.option3 = option3;
	}







	public String getOption4() {
		return option4;
	}







	public void setOption4(String option4) {
		this.option4 = option4;
	}







	public String getAnswer() {
		return answer;
	}







	public void setAnswer(String answer) {
		this.answer = answer;
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







	public Timestamp getQesDate() {
		return quesDate;
	}







	public void setQesDate(Timestamp qesDate) {
		this.quesDate = qesDate;
	}
	
	
	
	
	
	
	
	
	
	
	
}
