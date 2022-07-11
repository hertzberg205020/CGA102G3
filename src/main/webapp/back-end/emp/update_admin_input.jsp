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
<title>員工資料修改</title>

<style>


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
	width: 500px;
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

div.errmsg{
margin-left: 10px;
}
input.updateEmp{
display:block ;
/*             margin-top: 10px; */
			margin-left: 10px;
            background:#678F74;
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
    <h1>員工資料</h1>
</header>

<%@include file="/static/template/back_layout_aside.jsp"%>
<main class="main">

		 <h4><a href="select_page.jsp">回首頁</a></h4><br>
	<div class="errmsg">
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤：</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	</div>

	<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/back-end/emp/emp.do" name="form1" enctype="multipart/form-data">
		<table>
			<tr>
		<td>員工編號:<font color=red><b>*</b></font></td>
		<td><%=adminVO.getAdminID()%></td>
	</tr>
			<tr>
				<td>員工帳號:</td>
				<td><input type="TEXT" name="account" size="45"
					value="<%=(adminVO == null) ? "請輸入帳號" : adminVO.getAdminAccount()%>" /></td>
			</tr>
			<tr>
				<td>員工密碼:</td>
				<td><input type="TEXT" name="password" size="45"
					value="<%=(adminVO == null) ? "請輸入密碼" : adminVO.getAdminPassword()%>" /></td>
			</tr>
			<tr>
				<td>員工姓名:</td>
				<td><input type="TEXT" name="name" size="45"
					value="<%=(adminVO == null) ? "請輸入姓名" : adminVO.getAdminName()%>" /></td>
			</tr>
			<tr>
				<td>員工電話:</td>
				<td><input type="TEXT" name="phone" size="45"
					value="<%=(adminVO == null) ? "請輸入電話" : adminVO.getAdminPhone()%>" /></td>
			</tr>
				
<!-- 		<tr>		 -->
<!--         <td><input type="file" name="upfile1"></td> -->
<!-- 		</tr>		 -->
			
		</table>
		<table>
		<tr>
		<td>照片上傳:</td>
		<td><input type="file" name="upfile1"></td>
		</tr>
		</table>
		<br> <input type="hidden" name="action" value="update"> 
		<input type="hidden" name="adminID" value="<%=adminVO.getAdminID()%>">
		<input class = "updateEmp" type="submit" value="送出修改">
	</FORM>
	
	</main>
	
	
	
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