package com.cga102g3.web.faq2.model;

import java.util.*;
import java.sql.*;

public class FaqJDBCDAO implements FaqDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/bookstore?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "abc123";

	private static final String INSERT_STMT = 
		"INSERT INTO `FAQ` (`ques`, `ans`)  VALUES (?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT `FAQ_ID`,`ques`,`ans` FROM `FAQ` order by `FAQ_ID` desc";
	private static final String GET_ONE_STMT = 
		"SELECT `FAQ_ID`,`ques`,`ans` FROM `FAQ` where FAQ_ID = ?";
	private static final String DELETE = 
		"DELETE FROM `FAQ` where FAQ_ID = ?";
	private static final String UPDATE = 
		"UPDATE `FAQ` set `ques`=?, `ans`=? where FAQ_ID = ?";

	@Override
	public void insert(FaqVO faqVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			
			pstmt.setString(1, faqVO.getQues());
			pstmt.setString(2, faqVO.getAns());


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
	public void update(FaqVO faqVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			
			pstmt.setString(1, faqVO.getQues());
			pstmt.setString(2, faqVO.getAns());
			pstmt.setInt(3, faqVO.getFAQ_ID()); //�Ĥ@��PK

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
	public void delete(Integer FAQ_ID) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, FAQ_ID);

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
	public FaqVO findByPrimaryKey(Integer FAQ_ID) {

		FaqVO faqVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, FAQ_ID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]�٬� Domain objects
				faqVO = new FaqVO();
				faqVO.setFAQ_ID(rs.getInt("FAQ_ID"));
				faqVO.setQues(rs.getString("Ques"));
				faqVO.setAns(rs.getString("Ans"));
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
		return faqVO;
	}

	@Override
	public List<FaqVO> getAll() {
		List<FaqVO> list = new ArrayList<FaqVO>();
		FaqVO faqVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO �]�٬� Domain objects
				faqVO = new FaqVO();
				faqVO.setFAQ_ID(rs.getInt("FAQ_ID"));
				faqVO.setQues(rs.getString("Ques"));
				faqVO.setAns(rs.getString("Ans"));
				list.add(faqVO); // Store the row in the list
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

		FaqJDBCDAO dao = new FaqJDBCDAO();

		// �s�W
//		FaqVO faqVO1 = new FaqVO();
//		faqVO1.setQues("�`�����D6");
//		faqVO1.setAns("����6");
//		dao.insert(faqVO1);

		// �ק�
//		FaqVO faqVO2 = new FaqVO();
//		faqVO2.setFAQ_ID(1);
//		faqVO2.setQues("�`�����D8");
//		faqVO2.setAns("����8");
//		dao.update(faqVO2);

		// �R��
//		dao.delete(8);

		// �d��
//		FaqVO faqVO3 = dao.findByPrimaryKey(1);
//		System.out.print(faqVO3.getFAQ_ID() + ",");
//		System.out.print(faqVO3.getQues() + ",");
//		System.out.print(faqVO3.getAns() + ",");
//		System.out.println("---------------------");

		// �d��
		List<FaqVO> list = dao.getAll();
		for (FaqVO aFaq : list) {
			System.out.print(aFaq.getFAQ_ID() + ",");
			System.out.print(aFaq.getQues() + ",");
			System.out.print(aFaq.getAns() + ",");
			System.out.println();
		}
	}
}