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

<title>首頁 / 討論留言板</title>

</head>
<%@include file="/static/template/front_layout_header.jsp"%>
<body>
<main class="main">
<div class="container" style="background-color:	#FFF3DE;border: solid 10px;border-radius: 40px 40px 40px 40px;border-color:#FFF3DE ">
<table id="table-1">
<tr>	
<th><h4><b><br>　首頁 / 討論留言板　　　　　　　　　　　　　　　　　　　　　　　　　</b></h4></th>

<th><button type="button" class="btn btn-warning"
		onclick="javascript:location.href='${pageContext.request.contextPath}/front-end/note/addNote.jsp'">
		<b> 我要留言 </b></button></th>
</tr>
</table><br>

	<c:forEach var="noteVO" items="${list}" >
	<div class="container">
  <div class="card bg-light JQellipsis border-warning" >

    <div class="card-body ">
    <div>
    		<a>${noteVO.note_ID}樓</a>
<span class="badge badge-pill badge-warning">
<c:set var="note_content_type" value="${noteVO.note_content_type}"/>
<c:choose>
    <c:when test="${note_content_type == 0}">閒聊</c:when>
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
<font size="5" class="card-title"> ${noteVO.note_content}</font>
    </div>
    

 <div class="text-right">

      <h6 class="text-right text-secondary font-weight-bold">會員 ${noteVO.mbr_ID} 發表於 <fmt:formatDate type="both" value="${noteVO.note_time}" /></h6>
    </div>
    </div>
  </div>
</div>
<br>
	</c:forEach>


<div>

	<%@ include file="page1.file" %> 
	<c:forEach var="noteVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		

<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/note/note.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" class="btn btn-success" value="留言"> -->
<%-- 			     <input type="hidden" name="note_ID"  value="${noteVO.note_ID}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->

<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/note/note.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="刪除"> -->
<%-- 			     <input type="hidden" name="note_ID"  value="${noteVO.note_ID}"> --%>
<!-- 			     <input type="hidden" name="action" value="delete"></FORM> -->

	</c:forEach>
</div>

<div class="text-right">
  <a type="button" style="border-radius:60px" class="btn btn-warning" href='listAllNote.jsp'>▲<br>TOP</a>
</div>
<%-- <%@ include file="page2.file" %> --%>
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

</html>