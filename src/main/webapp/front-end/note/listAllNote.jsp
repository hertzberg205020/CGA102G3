<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cga102g3.web.note.model.*"%>

<%
NoteService noteSvc = new NoteService();
    List<NoteVO> list = noteSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">
<meta charset="UTF-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- Bootstrap4.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
<!--    基礎版面樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/template/css/front_layout.css">

<title>首頁>留言板</title>

</head>
<%@include file="/static/template/front_layout_header.jsp"%>
<body>
	<main class="main">
		<div class="container">
<table id="table-1">
	<tr>
	<td>
		 <h1>首頁>留言板　　　　　　　　　　　　　　　　　 　 　</h1>
	</td>
						<th>
						<button type="button" class="btn btn-warning"
							onclick="javascript:location.href='${pageContext.request.contextPath}/front-end/note/addNote.jsp'">
							<b> 我要留言 </b></button>
					</th>
	</tr>
</table>

<div>
	<c:forEach var="noteVO" items="${list}" >
	<div class="container">
  <div class="card bg-light JQellipsis border-warning" >
    <div class="card-body">
      <h5 class="card-title">【${noteVO.note_content_type==0?"Java":"MySQL"}】${noteVO.note_content}</h5>
<%--       <p class="card-text">會員 ${noteVO.mbr_ID}：${noteVO.note_content}</p> --%>
      <span class="text-secondary font-weight-bold">會員 ${noteVO.mbr_ID} 發表於 ${noteVO.note_time}</span>
    </div>
  </div>
</div>
<br>
	</c:forEach>
	</div>

<table class="table table-bordered text-center table-hover table-striped table-borderless table-sm">
	<tr class="table-success">
		<th scope="col" class="col-1">留言<br>編號</th>
		<th scope="col" class="col-1">會員<br>編號</th>
		<th scope="col" class="col-2">主題類型</th>
		<th scope="col" class="col-6">留言內容</th>
		<th scope="col" class="col-3">留言時間</th>

		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="noteVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${noteVO.note_ID}</td>
			<td>${noteVO.mbr_ID}</td>
<%-- 		<td>${noteVO.note_content_type}</td> --%>
			<td class="JQellipsis">${noteVO.note_content_type==0?"Java":"MySQL"}</td>
			<td>${noteVO.note_content}</td>
			<td>${noteVO.note_time}</td>
		
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/note/note.do" style="margin-bottom: 0px;">
			     <input type="submit" class="btn btn-success" value="留言">
			     <input type="hidden" name="note_ID"  value="${noteVO.note_ID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/note/note.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="note_ID"  value="${noteVO.note_ID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>


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
<script
	src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>


</html>