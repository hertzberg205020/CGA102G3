package com.cga102g3.web.sale.dao.impl;

import java.util.*;

import com.cga102g3.web.sale.dao.SaleDAO_interface;
import com.cga102g3.web.sale.entity.SaleVO;

import java.sql.*;

public class SaleJDBCDAO implements SaleDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/bookstore?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "abc123";
	
	private static final String INSERT_STMT = 
		"INSERT INTO sale (sale_start, sale_end) VALUES (?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT sale_ID, sale_start, sale_end FROM sale order by sale_ID";
	private static final String GET_ONE_STMT = 
		"SELECT sale_ID, sale_start, sale_end FROM sale where sale_ID = ?";
	private static final String DELETE = 
		"DELETE FROM sale where sale_ID = ?";
	private static final String UPDATE = 
		"UPDATE sale set sale_start=?, sale_end=? where sale_ID = ?";

		
		@Override
		public void insert(SaleVO saleVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setDate(1, saleVO.getSaleStart());
				pstmt.setDate(2, saleVO.getSaleEnd());
				
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
		public void update(SaleVO saleVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(UPDATE);

				pstmt.setDate(1, saleVO.getSaleStart());
				pstmt.setDate(2, saleVO.getSaleEnd());
				pstmt.setInt(3, saleVO.getSaleID());

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
		public void delete(Integer sale_ID) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(DELETE);

				pstmt.setInt(1, sale_ID);

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
		public SaleVO findByPrimaryKey(Integer sale_ID) {

			SaleVO saleVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setInt(1, sale_ID);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					// saleVO �]�٬� Domain objects
					saleVO = new SaleVO();
					saleVO.setSaleID(rs.getInt("sale_ID"));
					saleVO.setSaleStart(rs.getDate("sale_start"));
					saleVO.setSaleEnd(rs.getDate("sale_end"));
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
			return saleVO;
		}
		
		
		@Override
		public List<SaleVO> getAll() {
			List<SaleVO> list = new ArrayList<SaleVO>();
			SaleVO saleVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// saleVO �]�٬� Domain objects
					saleVO = new SaleVO();
					saleVO.setSaleID(rs.getInt("sale_ID"));
					saleVO.setSaleStart(rs.getDate("sale_start"));
					saleVO.setSaleEnd(rs.getDate("sale_end"));
					list.add(saleVO); // Store the row in the list
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

			SaleJDBCDAO dao = new SaleJDBCDAO();

			// �s�W
//			SaleVO saleVO1 = new SaleVO();
//			saleVO1.setSaleStart(java.sql.Date.valueOf("2022-06-06"));
//			saleVO1.setSaleEnd(java.sql.Date.valueOf("2022-07-07"));
//			dao.insert(saleVO1);

//			// �ק�
//			SaleVO saleVO2 = new SaleVO();
//			saleVO2.setSaleStart(java.sql.Date.valueOf("2022-07-06"));
//			saleVO2.setSaleEnd(java.sql.Date.valueOf("2022-07-26"));
//			saleVO2.setSaleID(5);
//			dao.update(saleVO2);

			// �R��
//			dao.delete(5);

			// PK�d��
//			SaleVO saleVO3 = dao.findByPrimaryKey(1);
//			System.out.println("SaleID: " + saleVO3.getSaleID() + ", ");
//			System.out.println("�_�l��: " + saleVO3.getSaleStart() + ", ");
//			System.out.println("������: " + saleVO3.getSaleEnd() + ".");

			// �d��ALL
			List<SaleVO> list = dao.getAll();
			for (SaleVO aSale : list) {
				System.out.print("SaleID: " + aSale.getSaleID() + ", ");
				System.out.print("�_�l��: " + aSale.getSaleStart() + ", ");
				System.out.print("������: " + aSale.getSaleEnd() + ".");
				System.out.println();
			}
		}


		@Override
		public void insert(SaleVO saleVO) {
			// TODO Auto-generated method stub
			
		}


		@Override
		public void update(SaleVO saleVO) {
			// TODO Auto-generated method stub
			
		}


		@Override
		public SaleVO findByPrimaryKey(Integer saleID) {
			// TODO Auto-generated method stub
			return null;
		}
		
}
