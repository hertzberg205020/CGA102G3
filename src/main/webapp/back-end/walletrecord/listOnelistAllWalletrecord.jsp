<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cga102g3.web.walletrecord.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>


<%--
<!-- //   WalletrecordVO walletrecordVO = (WalletrecordVO) request.getAttribute("walletrecordVO"); //WalletrecordServlet.java(Concroller), 存入req的walletrecordVO物件 -->
--%>

<%
	WalletrecordService walletrecordSvc = new WalletrecordService();
    List<WalletrecordVO> list = walletrecordSvc.getOneWalletrecord2(5);
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8">
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
    <!--    基礎版面樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">

    <title>金流管理>查詢錢包使用紀錄</title>
</head>
<body>
<header class="header">
    <h1>金流管理>查詢錢包使用紀錄</h1>
</header>

<%@include file="/static/template/back_layout_aside.jsp"%>

<main class="main">
<table id="table-1">
	<tr>
		 <h3><a href="select_page.jsp">回錢包管理</a></h3>
	</tr>
</table>

<table class="table table-bordered text-center table-hover">

	<tr class="table-success">
<!-- 		<th scope="col" class="col-2">錢包使用紀錄編號</th> -->
		<th scope="col" class="col-2">會員編號</th>
		<th scope="col" class="col-2">錢包使用備註</th>
		<th scope="col" class="col-2">金額(元)</th>
		<th scope="col" class="col-4">紀錄時間</th>	
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="walletrecordVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">		
	<tr>
<%-- 			<td>${walletrecordVO.wallet_rec_no}</td> --%>
			<td>${walletrecordVO.mbr_ID}</td>
			<td>${walletrecordVO.note}</td>
			<td>${walletrecordVO.amount}</td>
			<td>${walletrecordVO.rec_time}</td>		
		
	</tr>
	</c:forEach>

<!-- <table id="table-2"> -->
<!-- 	<tr> -->
<!-- 		<th scope="col" class="col-2">會員編號</th> -->
<!-- 		<th scope="col" class="col-2">錢包使用備註</th> -->
<!-- 		<th scope="col" class="col-2">金額(元)</th> -->
<!-- 		<th scope="col" class="col-4">紀錄時間</th>	 -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 			<td>${walletrecordVO.mbr_ID}</td> --%>
<%-- 			<td>${walletrecordVO.note}</td> --%>
<%-- 			<td>${walletrecordVO.amount}</td> --%>
<%-- 			<td>${walletrecordVO.rec_time}</td> --%>
<!-- 	</tr> -->
</table>

</main>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<script src="${pageContext.request.contextPath}/back-end/book/js/back_book_view.js"></script>
</body>
</html>