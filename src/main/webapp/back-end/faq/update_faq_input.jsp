<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.faq.model.*"%>

<%
  FaqVO faqVO = (FaqVO) request.getAttribute("faqVO"); //FaqServlet.java (Concroller) 存入req的faqVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<%-- <%= faqVO==null %>--${faqVO.getFAQ_ID()}--${faqVO.FAQ_ID}-- --%>

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

<title>客服管理 / FAQ管理 / FAQ修改</title>

</head>
<body>

<header class="header">
    <h1>客服管理 / FAQ管理 / FAQ修改</h1>
</header>

<%@include file="/static/template/back_layout_aside.jsp"%>

<main class="main">
		<div class="container">
<h1>FAQ修改</h1>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="faq.do" name="form1">
<table>
	<tr>
		<td><b>FAQ編號</b><font color=red><b>*</b></font></td>
		<td>${faqVO.FAQ_ID}</td>
	</tr>
	<tr>
		<td><b>修改常見問題</b></td>
		<td><input type="TEXT" name="ques" size="60" value="<%=faqVO.getQues()%>" /></td>
	</tr>
	<tr>
		<td><b>修改解答</b></td>
		<td><input type="TEXT" name="ans" size="60"	value="<%=faqVO.getAns()%>" /></td>
	</tr>
</table>
<br>

	<tr>
		<td>
		 <button type="button" class="btn btn-danger"
                 onclick="javascript:location.href='${pageContext.request.contextPath}/back-end/faq/listAllFaq.jsp'">
                 取消修改
         </button>
         	</td>
	</tr>
	<tr>
		<td>
<input type="hidden" name="action" value="update">
<input type="hidden" name="FAQ_ID" value="<%=faqVO.getFAQ_ID()%>">
<input type="submit" class="btn btn-info" value="送出修改">
</td>
	</tr>

</FORM>
</div>
</main>
</body>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<script src="${pageContext.request.contextPath}/back-end/book/js/back_book_view.js"></script>

</html>