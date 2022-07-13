<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<meta charset="UTF-8">
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- Bootstrap4.6 -->
<link rel="stylesheet"href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
<!--    基礎版面樣式  -->
<link rel="stylesheet"href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
<!--    後台書籍管理添加樣式  -->
<link rel="stylesheet"href="${pageContext.request.contextPath}/back-end/book/css/back_book_update.css">

<title>管理後臺</title>
</head>
<body>

	<header class="header">
		<h1>後台首頁</h1>
	</header>
	<%@include file="/static/template/back_layout_aside.jsp"%>
    <main class="main">
    <p>歡迎光臨，${AdminVO.adminName}</p>
         <img src="${pageContext.request.contextPath}/static/images/dashboard.jpg">
    </main>
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- datetimepicker-->
    <%--<script src="${pageContext.request.contextPath}/datetimepicker/jquery.js"></script>--%>
    <script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script>
    <!-- sweetalert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- bootstrap JS-->
    <script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
    <!-- 模板的JS -->
    <script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<%--<script>--%>
<%--           $(".label").find("span").click(function(){--%>
<%--             $(this).toggleClass("rotate");--%>
<%--           });--%>
<%--</script>--%>
</body>
</html>