<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.emp.model.*"%>

<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>


<%
AdminVO adminVO = (AdminVO) request.getAttribute("adminVO");

%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- datetimepicker樣式 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.css" />
<!-- Bootstrap4.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
<!--    基礎版面樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
<!--    後台書籍管理添加樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/back-end/book/css/back_book_add.css">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>員工權限更改</title>

<style>
h4 {
	color: red;
	font-size: 15px;
	margin-bottom: 1px;
	margin-left: 10px;
	margin-top: 20px;
	color: blue;
}
</style>

<style>
table {

	background-color: white;
	margin-top: 1px;
	margin-left: 10px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}

div.errmsg {
	margin-left: 10px;
}

div.checkbox{
	margin-left: 10px;
}

input.updateEmp {
	display: block;
	/*             margin-top: 10px; */
	margin-left: 10px;
	background: #678F74;
	color: white;
	padding: 7px 10px;
	border: none;
	cursor: pointer;
	width: 100px;
	border-radius: 5px
}
</style>

</head>
<body bgcolor='white'>

	<header class="header">
		<h1>員工權限更改</h1>
	</header>

	<%@include file="/static/template/back_layout_aside.jsp"%>
	<main class="main">

		<h4>
			<a
				href="${pageContext.request.contextPath}/back-end/emp/listAdminAuth.jsp">回上頁</a>
		</h4>
		<br>


		<FORM METHOD="post"
			ACTION="${pageContext.request.contextPath}/back-end/emp/emp.do"
			name="form1" enctype="multipart/form-data">
			<table>
				<tr>
					<td>員工編號：</td>
					<td><%=adminVO.getAdminID()%></td>
				</tr>
				<tr>
					<td>員工姓名：</td>
					<td><%=adminVO.getAdminName()%></td>
				</tr>

			</table>
			<br>
			<div class="checkbox">
				<input type="checkbox" id="cbox1" name="auth" value="1"> 
				<label for="cbox1">員工管理權限</label> 
				<input type="checkbox" id="cbox2" name="auth" value="2"> 
				<label for="cbox2">會員資料修改權限</label>
				<input type="checkbox" id="cbox3" name="auth" value="3"> 
				<label for="cbox3">錢包管理權限</label><br> 
				<input type="checkbox" id="cbox4" name="auth" value="4"> 
				<label for="cbox4">一般商城管理權限</label>
				<input type="checkbox" id="cbox5" name="auth" value="5"> 
				<label for="cbox5">商城競標管理權限</label> 
				<input type="checkbox" id="cbox6" name="auth" value="6"> 
				<label for="cbox6">客服管理權限</label> <br>
				<input type="checkbox" id="cbox7" name="auth" value="7"> 
				<label for="cbox7">書目管理權限</label>
			</div>

			<br> <input type="hidden" name="action" value="updateAuth">
			<input type="hidden" name="adminID" value="<%=adminVO.getAdminID()%>">
			<input class="updateEmp" type="submit" value="送出修改">
		</FORM>



	</main>



	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- datetimepicker-->
	<%--<script src="${pageContext.request.contextPath}/datetimepicker/jquery.js"></script>--%>
	<script
		src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- bootstrap JS-->
	<script
		src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
	<script
		src="${pageContext.request.contextPath}/back-end/book/js/back_book_add.js"></script>



</body>

</html>