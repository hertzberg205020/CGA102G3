package com.cga102g3.web.note.model;
import java.sql.Clob;
import java.sql.Date;
import java.sql.Timestamp;

public class NoteVO implements java.io.Serializable{
	private Integer note_ID;
	private Integer mbr_ID;
	private Timestamp note_time;
	private Integer note_content_type;
	private String note_content;
	public Integer getNote_ID() {
		return note_ID;
	}
	public void setNote_ID(Integer note_ID) {
		this.note_ID = note_ID;
	}
	public Integer getMbr_ID() {
		return mbr_ID;
	}
	public void setMbr_ID(Integer mbr_ID) {
		this.mbr_ID = mbr_ID;
	}
	public Timestamp getNote_time() {
		return note_time;
	}
	public void setNote_time(Timestamp note_time) {
		this.note_time = note_time;
	}
	public Integer getNote_content_type() {
		return note_content_type;
	}
	public void setNote_content_type(Integer note_content_type) {
		this.note_content_type = note_content_type;
	}
	public String getNote_content() {
		return note_content;
	}
	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}
	

	
}
