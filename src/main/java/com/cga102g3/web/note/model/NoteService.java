package com.cga102g3.web.note.model;

import java.sql.Timestamp;
import java.util.List;

public class NoteService {

	private NoteDAO_interface dao;

	public NoteService() {
		//dao = new EmpDAO();
		dao = new NoteJDBCDAO();
	}

	public NoteVO addNote(Integer mbr_ID, Integer note_content_type, String note_content) {

		NoteVO noteVO = new NoteVO();
		noteVO.setMbr_ID(mbr_ID);
		noteVO.setNote_content_type(note_content_type);
		noteVO.setNote_content(note_content);
		
		dao.insert(noteVO);

		return noteVO;
	}

	public NoteVO updateNote(Integer mbr_ID, Integer note_content_type, String note_content, Integer note_id) {

		NoteVO noteVO = new NoteVO();

		noteVO.setMbr_ID(mbr_ID);
		noteVO.setNote_content_type(note_content_type);
		noteVO.setNote_content(note_content);
		noteVO.setNote_ID(note_id);
		dao.update(noteVO);

		return noteVO;
	}

	public void deleteNote(Integer note_ID) {
		dao.delete(note_ID);
	}

	public NoteVO getOneNote(Integer note_ID) {
		return dao.findByPrimaryKey(note_ID);
	}

	public List<NoteVO> getAll() {
		return dao.getAll();
	}


}
