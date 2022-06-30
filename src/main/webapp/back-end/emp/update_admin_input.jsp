<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.emp.model.*"%>

<%
AdminVO adminVO = (AdminVO) request.getAttribute("adminVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>員工資料修改</title>

<style>
table#table-1 {
	background-color: #678F74;

	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3 style="color: white">員工資料修改</h3>
				<h4>
					<a href="select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

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
		<input type="submit" value="送出修改">
	</FORM>
</body>

</html>