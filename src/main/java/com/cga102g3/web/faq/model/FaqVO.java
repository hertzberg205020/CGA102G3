package com.cga102g3.web.faq.model;
import java.sql.Date;

public class FaqVO implements java.io.Serializable{
	private Integer FAQ_ID;
	private String ques;
	private String ans;
	public Integer getFAQ_ID() {
		return FAQ_ID;
	}
	public void setFAQ_ID(Integer fAQ_ID) {
		FAQ_ID = fAQ_ID;
	}
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	

	
	
	
}
