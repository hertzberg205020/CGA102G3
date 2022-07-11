<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cga102g3.web.walletrecord.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
WalletrecordService walletrecordSvc = new WalletrecordService();
    List<WalletrecordVO> list = walletrecordSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<%-- <%-- <% --%> 
<!-- // 	WalletrecordService walletrecordSvc = new WalletrecordService(); -->
<!-- //     List<WalletrecordVO> list = walletrecordSvc.getOneWalletrecord2(5); -->
<!-- //     pageContext.setAttribute("list",list); -->
<%-- <%-- %> --%> 

<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8">
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="0">
    <Meta http-equiv="ReFresh" Content="10">
    <Meta http-equiv="ReFresh" Content="10">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
    <!--    基礎版面樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
   

<title>金流管理 / 查詢錢包使用紀錄 / 所有會員</title>

</head>
<body>

<header class="header">
        <h1>金流管理 / 查詢錢包使用紀錄 / 所有會員</h1>
</header>


<%@include file="/static/template/back_layout_aside.jsp"%>

<main class="main">
<div class="container">
<table id="table-1">
<h4><a href="select_page.jsp">返回查詢會員</a><h4> 
	<tr>

<!-- 	<td> -->
<!-- 	    <FORM METHOD="post" ACTION="walletrecord.do" > -->
<!--         <b>　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　搜尋FAQ編號</b> -->
<!--         <input class="walletrecord" type="text" name="wallet_rec_no"> -->
<!--         <input class="walletrecord" type="hidden" name="action" value="getOne_For_Display"> -->
<!--         <input class="walletrecord" type="submit" value="送出"> -->
<!--     	</FORM> -->
<!-- 	</td> -->
	</tr>
</table>

<table class="table table-striped text-center table-hover">

	<tr class="table-info">
<!-- 		<th scope="col" class="col-2">錢包使用紀錄編號</th> -->
		<th scope="col" class="col-1">會員編號</th>
		<th scope="col" class="col-3">錢包使用備註</th>
		<th scope="col" class="col-2">金額(元)</th>
		<th scope="col" class="col-3">紀錄時間</th>	
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="walletrecordVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
<%-- 			<td>${walletrecordVO.wallet_rec_no}</td> --%>
			<td>${walletrecordVO.mbr_ID}</td>
			<td>
<c:set var="note" value="${walletrecordVO.note}"/>
			<c:choose>
    <c:when test="${note == 0}">
       <b><font color=green>會員儲值(+)</font></b>
    </c:when>
    <c:when test="${note == 1}">
       <b><font color=red>支出(-)</font></b>
    </c:when>
    <c:when test="${note == 2}">
       <b><font color=green>收入(平台支付二手賣家)(+)</font></b>
    </c:when>
    <c:when test="${note == 3}">
       <b><font color=red>競標預扣除金額(-)</font></b>
    </c:when>
    <c:when test="${note == 4}">
       <b><font color=green>競標金額退回(+)</font></b>
    </c:when> 
    <c:otherwise>
        --
    </c:otherwise>
</c:choose>
</td>
			<td><b>${walletrecordVO.amount}</b></td>
<%-- 			<td>${walletrecordVO.rec_time}</td> --%>
<td><fmt:formatDate type="both" value="${walletrecordVO.rec_time}" /></td>

		
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/walletrecord/walletrecord.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input class="walletrecord" type="submit" value="修改"> -->
<%-- 			     <input class="walletrecord" type="hidden" name="wallet_rec_no"  value="${walletrecordVO.wallet_rec_no}"> --%>
<!-- 			     <input class="walletrecord" type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/walletrecord/walletrecord.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input class="walletrecord" type="submit" value="刪除"> -->
<%-- 			     <input class="walletrecord" type="hidden" name="wallet_rec_no"  value="${walletrecordVO.wallet_rec_no}"> --%>
<!-- 			     <input class="walletrecord" type="hidden" name="action" value="delete"></FORM> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
		
</table>

	<td>       
         <input type="hidden" name="action" value="5">
	</td>
	
</div>

<div class="text-center">
<%@ include file="page2.file" %>
</div>
</main>
</body>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>
</html>