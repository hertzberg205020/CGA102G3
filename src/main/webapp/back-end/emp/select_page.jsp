<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<%
//     Object account = session.getAttribute("account");                  // 從 session內取出 (key) account的值
//     if (account == null) {                                             // 如為 null, 代表此user未登入過 , 才做以下工作
//       session.setAttribute("location", request.getRequestURI());       //*工作1 : 同時記下目前位置 , 以便於login.html登入成功後 , 能夠直接導至此網頁(須配合LoginHandler.java)
//       response.sendRedirect(request.getContextPath()+"/back-end/emp/empLogin.jsp");   //*工作2 : 請該user去登入網頁(login.html) , 進行登入
//       return; }
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
<title>員工管理首頁</title>
<style>
main.main {
	background: linear-gradient(rgba(255, 255, 255, 0.5),
		rgba(255, 255, 255, 0.5)),
		url('http://www.hr.org.tw/Activities/hr/189267395.996006.jpg');
	background-repeat: no-repeat;
	background-size: 100% auto;
	opacity: 0.9;
}

div#div-1 {
	background-color: #678F74;
	margin-bottom: 5px;
	height: 80px;
	width: 100%;
	display: flex;
	/* 水平置中 */
	justify-content: center;
	/* 垂直置中 */
	align-items: center;
}

ul{
list-style-type:none;
padding-top:20px;
}

input {
	opacity: 0.8;
}

input.out {
	/* 	margin-top: 10px; */
	/* 	margin-bottom: 10px; */
	background: #00ffd9;
	color: white;
	/* 	padding: 14px 20px; */
	border: none;
	cursor: pointer;
	border-radius: 2px
}
</style>

</head>
<body>

	<header class="header">
    <h1>員工管理首頁</h1>
</header>

<%@include file="/static/template/back_layout_aside.jsp"%>
<main class="main">

	<ul>
		<li><a href='listAllAdmin.jsp' style="text-decoration: none;">查看全部員工</a>
			<br> <br></li>

		<li>
			<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/back-end/emp/emp.do">
				<b>輸入員工編號 (如1):</b> <input type="text" name="adminID"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					class="out" type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="empSvc" scope="page" class="com.cga102g3.web.emp.model.AdminService"/>

		<li>
			<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/back-end/emp/emp.do">
				<b>選擇員工編號:</b> <select size="1" name="adminID">
					<c:forEach var="AdminVO" items="${empSvc.all}">
						<option value="${AdminVO.adminID}">${AdminVO.adminID}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input class="out" type="submit" value="送出">
			</FORM>
		</li>

		<li>
			<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/back-end/emp/emp.do">
				<b>選擇員工姓名:</b> <select size="1" name="adminID">
					<c:forEach var="AdminVO" items="${empSvc.all}">
						<option value="${AdminVO.adminID}">${AdminVO.adminName}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input class="out" type="submit" value="送出">
			</FORM>
		</li>
		<li><a href='addAdmin.jsp' style="text-decoration: none;">新增員工</a></li>
<%-- 		<FORM METHOD="get" ACTION="${pageContext.request.contextPath}/back-end/emp/emplogout"> --%>
<!-- 		<li><input class="out" type="submit" value="登出"></li> -->
<!-- 		</FORM> -->
	</ul>
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