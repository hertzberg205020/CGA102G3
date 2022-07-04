<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cga102g3.web.walletrecord.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	WalletrecordService walletrecordSvc = new WalletrecordService();
    List<WalletrecordVO> list = walletrecordSvc.getOneWalletrecord2(7);
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8">
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="0">
    <Meta http-equiv="ReFresh" Content="10">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
    <!--    基礎版面樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
   

<title>會員專區>錢包管理</title>

</head>
<body>
<%@include file="/static/template/front_layout_header.jsp"%>
<header class="header">
    
</header>


<main class="main">
		<div class="container">
<table id="table-1">

	<tr>
<h2>會員專區>錢包管理</h2>
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
			<td>
<c:set var="note" value="${walletrecordVO.note}"/>
			<c:choose>
    <c:when test="${note == 0}">
       會員儲值
    </c:when>
    <c:when test="${note == 1}">
       支出
    </c:when>
    <c:when test="${note == 2}">
       收入(平台支付二手賣家)
    </c:when>
    <c:when test="${note == 3}">
       競標預扣除金額
    </c:when>
    <c:when test="${note == 4}">
       競標金額退回
    </c:when> 
    <c:otherwise>
        .
    </c:otherwise>
</c:choose>
</td>
			<td>${walletrecordVO.amount}</td>
<td><fmt:formatDate type="both" value="${walletrecordVO.rec_time}" /></td>
			
<%-- 			<td><fmt:formatDate value="${walletrecordVO.rec_time}" pattern="yyyy-MM-dd"/></td>		 --%>
		
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/walletrecord/walletrecord.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input class="walletrecord" type="submit" value="修改"> -->
<%-- 			     <input class="walletrecord" type="hidden" name="mbr_ID"  value="${walletrecordVO.mbr_ID}"> --%>
<!-- 			     <input class="walletrecord" type="hidden" name="action"	value="updateMEM"></FORM> -->
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
		 <button type="button" class="btn btn-success"
                 onclick="javascript:location.href='${pageContext.request.contextPath}/front-end/walletrecord/addWalletrecord.jsp'">
                 我要儲值
         </button>
         
         <input type="hidden" name="action" value="7">
	</td>
	<%@ include file="page2.file" %>
	</div>
</main>
</body>

<%@include file="/static/template/front_layout_footer.jsp"%>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>
<script src="${pageContext.request.contextPath}/front-end/book/js/front_book_view.js"></script>

</html>