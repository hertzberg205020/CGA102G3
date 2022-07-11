package com.cga102g3.web.review.controller;

import java.io.*;
import java.sql.Timestamp;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.cga102g3.web.review.model.*;

@WebServlet("/front-end/review/review.do")
public class ReviewServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) //override HttpServlet's doGet()
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) //override HttpServlet's doPost()
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
	
		
		 if ("insert".equals(action)) {
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String reviewContent = req.getParameter("reviewContent");
					if (reviewContent == null || reviewContent.trim().length() == 0) {
						errorMsgs.add("請寫留言內容");
					}
					
					BookReviewVO bookReviewVO = new BookReviewVO();
					Integer mbrID = Integer.valueOf(req.getParameter("mbrID").trim());
//					Integer bookID = Integer.valueOf(req.getParameter("bookID").trim());
					bookReviewVO.setMbrID(mbrID);
					bookReviewVO.setBookID(1);
					bookReviewVO.setReviewContent(reviewContent);
					bookReviewVO.setReviewTime(new Timestamp(System.currentTimeMillis()));
					bookReviewVO.setReviewStatus(1);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("bookReviewVO", bookReviewVO); //含有輸入格式錯誤的bookReviewVO物件,也存入req。
																		//今天沒有上面那行的話，JSP請求中的 getAttribute 全部抓不到資料
						RequestDispatcher failureView = req.getRequestDispatcher("/front-end/review/listAllRev.jsp");
						failureView.forward(req, res);
						return; //程式終止，因為上面已經帶著req,res forward 到了 failureView
					}
					
					/***************************2.開始新增資料***************************************/
					BookReviewService bkrvSvc = new BookReviewService();
					bookReviewVO = bkrvSvc.insert(bookReviewVO);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					RequestDispatcher successView = req.getRequestDispatcher("/front-end/review/listAllRev.jsp");
					successView.forward(req, res);				
			}
		 
		 
		 
			if ("getOne_For_Update".equals(action)) { 
				
					/***************************1.接收請求參數****************************************/
					Integer reviewID = Integer.valueOf(req.getParameter("reviewID"));
					
					/***************************2.開始編輯資料****************************************/
					BookReviewService bkrvSvc = new BookReviewService();
					BookReviewVO bookreviewVO = bkrvSvc.findByPrimaryKey(reviewID);
					/***************************3編輯完成,準備轉交(Send the Success view)************/
					req.setAttribute("bookReviewVO", bookreviewVO);
					RequestDispatcher successView = req.getRequestDispatcher("/front-end/review/listAllRev.jsp");
					successView.forward(req, res);
			}						
			
				if ("update".equals(action)) { 
				
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
			
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String reviewContent = req.getParameter("reviewContent");
				if (reviewContent == null || reviewContent.trim().length() == 0) {
					errorMsgs.add("請寫留言內容");
				}
				Integer reviewID = Integer.valueOf(req.getParameter("reviewID"));
				Integer mbrID = Integer.valueOf(req.getParameter("mbrID"));
				Integer bookID = Integer.valueOf(req.getParameter("bookID"));
				Timestamp reviewDate = new Timestamp(System.currentTimeMillis());
				Integer reviewStatus = Integer.valueOf(req.getParameter("reviewStatus"));

					BookReviewVO bookReviewVO = new BookReviewVO();
					bookReviewVO.setReviewID(reviewID);
					bookReviewVO.setMbrID(mbrID);
					bookReviewVO.setBookID(bookID);
					bookReviewVO.setReviewContent(reviewContent);
					bookReviewVO.setReviewTime(reviewDate);
					bookReviewVO.setReviewStatus(reviewStatus);

					if (!errorMsgs.isEmpty()) {
						req.setAttribute("bookReviewVO", bookReviewVO); // 含有輸入格式錯誤的bookReviewVO物件,也存入req
						RequestDispatcher failureView = req.getRequestDispatcher("/front-end/review/listAllRev.jsp");
						failureView.forward(req, res);
						return; //程式中斷
					}
					
					/***************************2.開始修改資料*****************************************/
					BookReviewService bkrvSvc = new BookReviewService();
					bookReviewVO = bkrvSvc.update(reviewID, bookID, mbrID, reviewContent, reviewDate, reviewStatus);
					
					/***************************3.修改完成,準備轉交(Send the Success view)*************/
					req.setAttribute("bookReviewVO", bookReviewVO); //資料庫update成功後,正確的bookReviewVO物件,存入req
					RequestDispatcher successView = req.getRequestDispatcher("/front-end/review/listAllRev.jsp");
					successView.forward(req, res);
			}
			
		 
			if ("delete".equals(action)) { 
		
					/***************************1.接收請求參數***************************************/
					Integer reviewID = Integer.valueOf(req.getParameter("reviewID"));
					
					/***************************2.開始刪除資料***************************************/
					BookReviewService bkrvSvc = new BookReviewService();
					bkrvSvc.delete(reviewID);
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
					RequestDispatcher successView = req.getRequestDispatcher("/front-end/review/listAllRev.jsp");
					successView.forward(req, res);
		 }
	}
}
