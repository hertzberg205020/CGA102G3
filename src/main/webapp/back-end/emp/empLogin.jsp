<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
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
<title>員工登入</title>
<style>
body {
/* 	text-align: center; */
}

main.main2{

            background-color: rgb(255, 255, 255);
            border: 1px solid lightgray;
            width: calc(100% - var(--aside-width));
            margin: 3% auto;
            min-height: calc(100vh - var(--header-height));
            border-radius: 5px;
            box-shadow: 3px 3px 3px rgba(150, 150, 150, 0.5);
        }

div.head{
margin: 5% auto;
text-align: center;
font-size:2em;
font-weight: 800;
}

div.login {
	text-align: center;
	border: 3px solid #ccc;
	background-color: #ffffff;
	margin: 0 auto;
	width: 500px;
	padding-top: 10px;
	border-radius: 10px /* border: 2px solid rgb(162, 160, 160); */
}



div.formcontrol {
	padding: 5px 5px;
}

input.login {
	margin-top: 10px;
	margin-bottom: 10px;
	background: #678F74;
	color: white;
	padding: 14px 20px;
	border: none;
	cursor: pointer;
	width: 30%;
	border-radius: 5px
}

input.login:hover {
	opacity: 0.8;
}
</style>
</head>
<body>
	

	<main class="main2">

		<div class="head">
		<h>員工登入</h>
		</div>
		<div class="login">
			<form action="${pageContext.request.contextPath}/back-end/emp/emplogin" method="post">


					<div class="formcontrol">
						<input  class="admAccount" required="required"
							type="text" name="account" placeholder="Account">
		
			</div>
	
				<div class="formcontrol">
						<input  class="admPsw" type="password"
							required="required" name="password" placeholder="Password">
					</div>
			
				<input class="login" type="submit" value="Log in">
			</form>
		</div>



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