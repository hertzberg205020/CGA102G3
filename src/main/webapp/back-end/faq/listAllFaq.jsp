<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cga102g3.web.faq.model.*"%>

<%
FaqService faqSvc = new FaqService();
    List<FaqVO> list = faqSvc.getAll();
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
<style>
.pageForm {
	font-size: 20px;
	display: inline;
}
</style>
<title>客服管理 / FAQ管理</title>

</head>
<body>

<header class="header">
    <h1>客服管理 / FAQ管理</h1>
</header>

<%@include file="/static/template/back_layout_aside.jsp"%>

<main class="main">
		<div class="container">


<table id="table-1">
	<tr>
	<th><h2>FAQ管理　　　　　　　　　　　</h2><th>
	<th>
	    <FORM METHOD="post" ACTION="faq.do" >
        <b>　　搜尋 FAQ編號</b>
        <input required type="text" name="FAQ_ID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" class="btn btn-info" value="搜尋">
    	</FORM>
	</th>
			<th>
		 <button type="button" class="btn btn-info"
                 onclick="javascript:location.href='${pageContext.request.contextPath}/back-end/faq/addFaq.jsp'">
                 新增FAQ
         </button>
    </th>
	</tr>
</table>

<table class="table table-bordered text-center table-hover">

	<tr class="table-info">
		<th scope="col" class="col-1">FAQ<br>編號</th>
		<th scope="col" class="col-4">Questions<br>常見問題</th>
		<th scope="col" class="col-6">Answers<br>解答</th>
		<th scope="col" class="col-2">Edit<br>編輯</th>
		<th scope="col" class="col-2">Remove<br>移除</th>	
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="faqVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${faqVO.FAQ_ID}</td>
			<td><b>${faqVO.ques}</b></td>
			<td>${faqVO.ans}</td>
		
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/faq/faq.do" style="margin-bottom: 0px;">
			     <input type="submit" class="btn btn-outline-info" value="修改">
			     <input type="hidden" name="FAQ_ID"  value="${faqVO.FAQ_ID}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			     </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/faq/faq.do" style="margin-bottom: 0px;">
			     <input type="submit" class="btn btn-danger" value="刪除">
			     <input type="hidden" name="FAQ_ID"  value="${faqVO.FAQ_ID}">
			     <input type="hidden" name="action" value="delete">
			     </FORM>
			</td>
		</tr>
	</c:forEach>
</table>
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
<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<script src="${pageContext.request.contextPath}/back-end/book/js/back_book_view.js"></script>

</html>