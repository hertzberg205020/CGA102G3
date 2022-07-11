<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.walletrecord.model.*"%>

<%
WalletrecordVO walletrecordVO = (WalletrecordVO) request.getAttribute("walletrecordVO");
%>

<%-- <%= walletrecordVO==null %>--${walletrecordVO.getDeptno()}--${walletrecordVO.deptno}-- --%>
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
	href="${pageContext.request.contextPath}/static/template/css/front_layout.css">

<title>會員專區 / 錢包管理 / 錢包儲值</title>

</head>
	<%@include file="/static/template/front_layout_header.jsp"%>
<body>

	<main class="main">
		<div class="container">

				<h3>會員專區 / 錢包管理 / 錢包儲值</h3>
<h3>　</h3>

		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<FORM METHOD="post" ACTION="walletrecord.do" name="form1">
			<table>
				<tr>
					<!-- 		<td><b>會員編號</b></td> -->
					<td><input type="hidden" name="mbr_ID" size="60" value="1" />
					</td>
				</tr>
				<tr>
<!-- 							<td><b>錢包使用備註</b></td> -->
					<td><input type="hidden" name="note" size="20" value="0" /></td>
				</tr>

				<tr>
					<td><font size="5"><b>儲值金額</b></font></td>
					<td><input autofocus required placeholder=" 最低100元"
						type="number" step="100" min="100" name="amount" size="30"
						pattern="[1-9]
			 value=" <%=(walletrecordVO == null) ? "" : walletrecordVO.getAmount()%> />
					</td>
					<td><input type="reset" value="重新輸入"></td>
				</tr>
			</table>
			<br>
			<table>
				<tr>
					<td>
						<button type="button" class="btn btn-danger"
							onclick="javascript:location.href='${pageContext.request.contextPath}/front-end/walletrecord/listAllWalletrecord.jsp'">
							取消儲值</button>
					</td>
					<td>　　　　　　　　　　　</td>
					<td><input type="hidden" name="action" value="insert">
						<input type="hidden" name="action2" value="updateMEM">
						<input type="submit" class="btn btn-success" value="確定儲值">
						</td>
				</tr>
			</table>
			<h1>　</h1>
			<h1>　</h1>
			<h1>　</h1>
		</FORM>
		</div>
	</main>
</body>

<%
java.sql.Date hiredate = null;
try {

} catch (Exception e) {
	hiredate = new java.sql.Date(System.currentTimeMillis());
}
%>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<%@include file="/static/template/front_layout_footer.jsp"%>
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- datetimepicker-->
<%--<script src="${pageContext.request.contextPath}/datetimepicker/jquery.js"></script>--%>
<script	src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- bootstrap JS-->
<script	src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script	src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>

</html>