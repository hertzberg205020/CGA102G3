<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.faq.model.*"%>

<%
FaqVO faqVO = (FaqVO) request.getAttribute("faqVO");
%>

<%-- <%= faqVO==null %>--${faqVO.getDeptno()}--${faqVO.deptno}-- --%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- Bootstrap4.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
<!--    基礎版面樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/template/css/back_layout.css">

<title>客服管理>FAQ管理>FAQ新增</title>

</head>
<body>
	<header class="header">
		<h1>客服管理 / FAQ管理 / FAQ新增</h1>
	</header>
	<%@include file="/static/template/back_layout_aside.jsp"%>
	<main class="main">
		<div class="container">
<h1>FAQ新增</h1>
			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>

			<FORM METHOD="post" ACTION="faq.do" name="form1">
				<table>
					<tr>
						<td><b>常見問題</b></td>
						<td><input class="faq" type="TEXT" name="ques" size="60"
							value="<%=(faqVO == null) ? "" : faqVO.getQues()%>" /></td>
					</tr>
					<tr>
						<td><b>解答</b></td>
						<td><input class="faq" type="TEXT" name="ans" size="60"
							value="<%=(faqVO == null) ? "" : faqVO.getAns()%>" /></td>
					</tr>

				</table>
				<br>

				<tr>
					<td>
						<button type="button" class="btn btn-danger"
							onclick="javascript:location.href='${pageContext.request.contextPath}/back-end/faq/listAllFaq.jsp'">
							取消新增</button>
					</td>
				</tr>
				<tr>
					<td><input type="hidden" name="action" value="insert">
						<input type="submit" class="btn btn-info" value="確定新增"></td>
				</tr>
			</FORM>
	</main>
	</div>
</body>


<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%
java.sql.Date hiredate = null;
try {

} catch (Exception e) {
	hiredate = new java.sql.Date(System.currentTimeMillis());
}
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

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


</html>