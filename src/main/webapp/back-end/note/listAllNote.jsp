<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cga102g3.web.note.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
NoteService noteSvc = new NoteService();
    List<NoteVO> list = noteSvc.getAll();
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
<title>客服管理 / 留言板管理</title>

</head>
<body>

<header class="header">
    <h1>客服管理 / 留言板管理</h1>
</header>

<%@include file="/static/template/back_layout_aside.jsp"%>

<main class="main">
		<div class="container">

<table id="table-1">
	<tr>
	<th><h2>留言板管理　　　　　　　　　</h2><th>
<!-- 	<th> -->
<!-- 	    <FORM METHOD="post" ACTION="note.do" > -->
<!--         <b>　　　　搜尋留言編號</b> -->
<!--         <input required type="text" name="note_ID"> -->
<!--         <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--         <input type="submit" class="btn btn-warning" value="搜尋"> -->
<!--     	</FORM> -->
<!-- 	</th> -->
<!-- 	<th> -->
<!-- 		 <button type="button" class="btn btn-warning" -->
<%--                  onclick="javascript:location.href='${pageContext.request.contextPath}/back-end/note/addNote.jsp'"> --%>
<!--                  新增公告 -->
<!--          </button> -->
<!--     </th> -->
	</tr>
</table>

<table class="table table-striped text-center table-hover">

	<tr class="table-warning">
		<th scope="col" class="col-1">留言<br>編號</th>
		<th scope="col" class="col-1">主題<br>分類</th>
		<th scope="col" class="col-1">會員<br>編號</th>
		<th scope="col" class="col-4">Content<br>留言板內容</th>
		<th scope="col" class="col-3">Time<br>留言時間</th>
		<th scope="col" class="col-1">Remove<br>移除</th>	
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="noteVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${noteVO.note_ID}</td>
			<td>
			<span class="badge badge-pill badge-warning">
<c:set var="note_content_type" value="${noteVO.note_content_type}"/>
<c:choose>
    <c:when test="${note_content_type == 0}">--</c:when>
    <c:when test="${note_content_type == 1}">Java</c:when>
    <c:when test="${note_content_type == 2}">MySQL</c:when>
    <c:when test="${note_content_type == 3}">C#</c:when>
    <c:when test="${note_content_type == 4}">HTML</c:when>
    <c:when test="${note_content_type == 5}">JavaScript</c:when>
    <c:when test="${note_content_type == 6}">Android</c:when>
    <c:when test="${note_content_type == 7}">資安</c:when>

    <c:otherwise>--</c:otherwise>
</c:choose>
</span>
			</td>
			<td>${noteVO.mbr_ID}</td>
			<td>${noteVO.note_content}</td>
			<td><fmt:formatDate type="both" value="${noteVO.note_time}" /></td>	
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/note/note.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" class="btn btn-outline-warning btn-sm" value="修改"> -->
<%-- 			     <input type="hidden" name="note_ID"  value="${noteVO.note_ID}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"> -->
<!-- 			     </FORM> -->
<!-- 			</td> -->
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/note/note.do" style="margin-bottom: 0px;">
			     <input type="submit" class="btn btn-danger btn-sm" value="刪除">
			     <input type="hidden" name="note_ID" value="${noteVO.note_ID}">
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