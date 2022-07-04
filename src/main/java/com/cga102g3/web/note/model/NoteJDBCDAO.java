package com.cga102g3.web.note.model;

import java.util.*;
import java.sql.*;

public class NoteJDBCDAO implements NoteDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/bookstore?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "abc123";

	private static final String INSERT_STMT = 
		"INSERT INTO `note` (`mbr_ID`, `note_content_type`, `note_content`)  VALUES (?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT `note_ID`,`mbr_ID`,`note_time`, `note_content_type`, `note_content` FROM `note` order by note_ID desc";
	private static final String GET_ONE_STMT = 
		"SELECT `note_ID`,`mbr_ID`,`note_time`, `note_content_type`, `note_content` FROM `note` where note_ID = ?";
	private static final String DELETE = 
		"DELETE FROM `note` where note_ID = ?";
	private static final String UPDATE = 
		"UPDATE `note` set `mbr_ID`=?, `Note_time`, `note_content_type`, `note_content` where note_ID = ?";

	@Override
	public void insert(NoteVO noteVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			
			pstmt.setInt(1, noteVO.getMbr_ID());
			pstmt.setInt(2, noteVO.getNote_content_type());
			pstmt.setString(3, noteVO.getNote_content());


			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(NoteVO noteVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			
			pstmt.setInt(1, noteVO.getMbr_ID());
			pstmt.setTimestamp(2, noteVO.getNote_time());
			pstmt.setInt(3, noteVO.getNote_content_type());
			pstmt.setString(4, noteVO.getNote_content());
			pstmt.setInt(5, noteVO.getNote_ID()); //�Ĥ@��PK

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer note_ID) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, note_ID);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public NoteVO findByPrimaryKey(Integer note_ID) {

		NoteVO noteVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, note_ID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// noteVo �]�٬� Domain objects
				noteVO = new NoteVO();
				noteVO.setNote_ID(rs.getInt("Note_ID"));
				noteVO.setMbr_ID(rs.getInt("Mbr_ID"));
				noteVO.setNote_time(rs.getTimestamp("Note_time"));
				noteVO.setNote_content_type(rs.getInt("Note_content_type"));
				noteVO.setNote_content(rs.getString("Note_content"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return noteVO;
	}

	@Override
	public List<NoteVO> getAll() {
		List<NoteVO> list = new ArrayList<NoteVO>();
		NoteVO noteVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// noteVO �]�٬� Domain objects
				noteVO = new NoteVO();
				noteVO.setNote_ID(rs.getInt("Note_ID"));
				noteVO.setMbr_ID(rs.getInt("Mbr_ID"));
				noteVO.setNote_time(rs.getTimestamp("Note_time"));
				noteVO.setNote_content_type(rs.getInt("Note_content_type"));
				noteVO.setNote_content(rs.getString("Note_content"));
				list.add(noteVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) {

		NoteJDBCDAO dao = new NoteJDBCDAO();

		// �s�W
//		NoteVO noteVO1 = new NoteVO();
//		noteVO1.setMbr_ID(1);
//		noteVO1.setNote_content_type(0);
//		noteVO1.setNote_content("�q�����e2");
//		dao.insert(noteVO1);

		// �ק�
		NoteVO noteVO2 = new NoteVO();
		noteVO2.setMbr_ID(2);
		noteVO2.setNote_time(new Timestamp(System.currentTimeMillis()));		
		noteVO2.setNote_content_type(2);
		noteVO2.setNote_content("通知內容222");
		noteVO2.setNote_ID(21);
		dao.update(noteVO2);

		// �R��
//		dao.delete(1);

		// �d��
//		NoteVO noteVO3 = dao.findByPrimaryKey(5);
//		System.out.print(noteVO3.getNote_ID() + ",");
//		System.out.print(noteVO3.getMbr_ID() + ",");
//		System.out.print(noteVO3.getNote_time() + ",");
//		System.out.print(noteVO3.getNote_content_type() + ",");
//		System.out.print(noteVO3.getNote_content() + ",");
//		
//		System.out.println("---------------------");

		// �d��
//		List<NoteVO> list = dao.getAll();
//		for (NoteVO aNote : list) {
//			System.out.print(aNote.getNote_ID() + ",");
//			System.out.print(aNote.getMbr_ID() + ",");
//			System.out.print(aNote.getNote_time() + ",");
//			System.out.print(aNote.getNote_content_type() + ",");
//			System.out.print(aNote.getNote_content() + ",");
//			System.out.println();
//		}
	}
}