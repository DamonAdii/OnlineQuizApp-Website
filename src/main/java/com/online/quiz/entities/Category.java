package com.online.quiz.entities;

import java.sql.Timestamp;

public class Category {
	
	//category
	//cid, ctitle, cdescripton, uid, cDate
	private int cid;
	private String ctitle;
	private String cdescripton;
	private int uid;
	private Timestamp cDate;
	
	
	
	public Category(int cid, String ctitle, String cdescripton, int uid,Timestamp cDate) {
		super();
		this.cid = cid;
		this.ctitle = ctitle;
		this.cdescripton = cdescripton;
		this.uid = uid;
		this.cDate = cDate;
	}



	public Category(String ctitle, String cdescripton, int uid,Timestamp cDate) {
		super();
		this.ctitle = ctitle;
		this.cdescripton = cdescripton;
		this.uid = uid;
		this.cDate = cDate;
	}



	public Category() {
		super();
	}



	public int getCid() {
		return cid;
	}



	public void setCid(int cid) {
		this.cid = cid;
	}



	public String getCtitle() {
		return ctitle;
	}



	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}



	public String getCdescripton() {
		return cdescripton;
	}



	public void setCdescripton(String cdescripton) {
		this.cdescripton = cdescripton;
	}



	public int getUid() {
		return uid;
	}



	public void setUid(int uid) {
		this.uid = uid;
	}



	public Timestamp getcDate() {
		return cDate;
	}



	public void setcDate(Timestamp cDate) {
		this.cDate = cDate;
	}
	
	
	
	

}
