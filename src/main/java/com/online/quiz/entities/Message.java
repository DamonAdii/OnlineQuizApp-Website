package com.online.quiz.entities;

public class Message {
	
	private String content;
	
	private String type;
	
	private String cssClass;

	public Message(String content, String type, String cssclass) {
		super();
		this.content = content;
		this.type = type;
		this.cssClass = cssclass;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getcssclass() {
		return cssClass;
	}

	public void setcssclass(String cssclass) {
		this.cssClass = cssclass;
	}
	
	

}
