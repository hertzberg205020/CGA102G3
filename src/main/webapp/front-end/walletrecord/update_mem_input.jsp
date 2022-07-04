<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.walletrecord.model.*"%>

<%
  WalletrecordVO walletrecordVO = (WalletrecordVO) request.getAttribute("walletrecordVO"); //WalletrecordServlet.java (Concroller) 存入req的walletrecordVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<%-- <%= walletrecordVO==null %>--${walletrecordVO.getmbr_ID()}--${walletrecordVO.mbr_ID}-- --%>

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
    <!--    後台書籍管理添加樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back-end/book/css/back_book_view.css">

<title>客服管理>FAQ管理>FAQ修改</title>

</head>
<body>

<header class="header">
    <h1>客服管理>FAQ管理>FAQ修改</h1>
</header>

<%@include file="/static/template/back_layout_aside.jsp"%>

<main class="main">
<table id="table-1">

</table>


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="walletrecord.do" name="form1">
<table>
	<tr>
		<td><b>FAQ編號</b><font color=red><b>*</b></font></td>
<%-- 		<td><%=faqVO.getFAQ_ID()%></td> --%>
		<td>${walletrecordVO.mbr_ID}</td>
	</tr>
	<tr>
		<td><b>修改常見問題</b></td>
		<td><input type="TEXT" name="note" size="60" value="0" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="updateMEM">
<input type="hidden" name="mbr_ID" value="<%=walletrecordVO.getMbr_ID()%>">
<input type="submit" value="送出修改">
</FORM>

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