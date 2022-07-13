<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.emp.model.*"%>


<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- datetimepicker樣式 -->
    <link   rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.css" />
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
    <!--    基礎版面樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
    <!--    後台書籍管理添加樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back-end/book/css/back_book_add.css">
    
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />    
<title>員工資料</title>

<style>
  table {
/* 	margin-left:10px;; */
  }
  
 h4 {
	color: red;
	font-size: 15px;
	margin-bottom: 1px;
	margin-left:10px;
	margin-top:20px;
	color: blue; 
}
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 1px solid #6699CC;
  }
  table, th, td {
/*     border: 1px solid #678F74; */
  }
  th, td {
/*     padding: 5px; */
    text-align: center;
  }
  table thead {
  background-color: #6699CC;
  color: white;
}
</style>

</head>
<body>
<header class="header">
    <h1>員工資料</h1>
</header>

<%@include file="/static/template/back_layout_aside.jsp"%>
<main class="main">

		 <h4><a href="select_page.jsp">回首頁</a></h4>

<div class="container">
<table class ="table table-bordered text-center table-hover">
	<thead class="table-success">
	<tr>
		<th>員工編號</th>
		<th>員工帳號</th>
		<th>員工密碼</th>
		<th>員工姓名</th>
		<th>員工電話</th>
		<th>員工照片</th>
	</tr>
	</thead>
	<tr>
		<td  style="vertical-align:middle">${AdminVO.adminID}</td>
		<td  style="vertical-align:middle">${AdminVO.adminAccount}</td>
		<td  style="vertical-align:middle">${AdminVO.adminPassword}</td>
		<td  style="vertical-align:middle">${AdminVO.adminName}</td>
		<td  style="vertical-align:middle">${AdminVO.adminPhone}</td>
		<td><img src = "${pageContext.request.contextPath}/static/images/emp/${AdminVO.adminID}.png" width="80" height="80"></td>
	</tr>
</table>
</div>
</main>>

<script type="text/javascript">
var imgs=document.images;
for (var i=0;i<imgs.length;i++){
imgs[i].onerror=function(){this.src="${pageContext.request.contextPath}/static/images/nopic.png"}
}
</script>

<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- datetimepicker-->
<%--<script src="${pageContext.request.contextPath}/datetimepicker/jquery.js"></script>--%>
<script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<script src="${pageContext.request.contextPath}/back-end/book/js/back_book_add.js"></script>
</body>
</html>