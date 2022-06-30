<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.mem.model.*"%>


<%
// Object memVO = session.getAttribute("memVO"); // 從 session內取出 (key) account的值
// if (memVO == null) { // 如為 null, 代表此user未登入過 , 才做以下工作
// 	session.setAttribute("location", request.getRequestURI()); //*工作1 : 同時記下目前位置 , 以便於login.html登入成功後 , 能夠直接導至此網頁(須配合LoginHandler.java)
// 	response.sendRedirect(request.getContextPath() + "/front-end/mem/login.jsp"); //*工作2 : 請該user去登入網頁(login.html) , 進行登入
// 	return;
// }
%>

<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- Bootstrap4.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
<!--    基礎版面樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/template/css/front_layout.css">

<title>會員資料</title>

<style>
main.main {
	display: flex;
	justify-content: center;
}

table.list {
	width: 500px;
	margin: 2% auto;
	border: 8px solid #EEEEEE;
	border-collapse: separate;
	border-radius: 10px;
}


th, td {
	padding: 10px;
	text-align: center;
}

td.left {
	text-align: left;
}

div.pic, div.mid {
	/* display: flex; */
	/*     justify-content: flex-start; */
	
}

div.pic {
	margin-top: 30px;
	width: 180px;
	text-align: center;
}

div.div2 {
	text-align: center;
	margin: 0 auto;
}

input.submitbtn {
	width: 150px;
	height: 40px;
	background-color: #FFD026;
	border: 1px solid #FFD026;
	border-radius:5px;
	margin-bottom: 10px;
	margin-top: 10px;
}

input.submitPic {
	width: 90px;
	height: 35px;
	background-color: #FFD026;
	border: 1px solid #FFD026;
	border-radius:5px;
	margin-bottom: 10px;
	margin-top: 10px;
}

input:hover {
	opacity: 0.8;
}
</style>

</head>
<body>
	<%@include file="/static/template/front_layout_header.jsp"%>
	<header class="header"> </header>

	<main class="main">


		<div class="pic">

			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/back-end/mem/mem.do"
				enctype="multipart/form-data">
				<img
					src="${pageContext.request.contextPath}/static/images/mem/${memVO.mbrID}.png"
					width="150" height="150"><br> <label
					class="btn btn-info"> <input type="file" name="upfile1"
					style="display: none;"> 上傳圖片
				</label> <input type="hidden" name="mbrID" value="${memVO.mbrID}"> <input
					type="hidden" name="action" value="updatePic"> <input
					type="submit" value="更改圖片" class="submitPic" />
			</FORM>
		</div>
		<div class="mid">
			<div class="div1">
				<table class="list">

					<tr>
						<td class="right">會員編號</td>
						<td class="left">${memVO.mbrID}</td>
					</tr>
					<tr>
						<td class="right">會員帳號</td>
						<td class="left">${memVO.mbrAccount}</td>
					</tr>
					<tr>
						<td class="right">會員姓名</td>
						<td class="left">${memVO.mbrName}</td>
					</tr>
					<tr>
						<td class="right">會員手機</td>
						<td class="left">${memVO.mbrMobile}</td>
					</tr>
					<tr>
						<td class="right">會員住址</td>
						<td class="left">${memVO.mbrAddr}</td>
					</tr>
					<tr>
						<td class="right">會員Email</td>
						<td class="left">${memVO.mbrEmail}</td>
					</tr>
					<tr>
						<td class="right">會員生日</td>
						<td class="left">${memVO.mbrBirth}</td>
					</tr>
					<tr>
						<td class="right">加入時間</td>
						<td class="left">${memVO.mbrJointime}</td>
					</tr>
					<tr>
						<td class="right">Tcoin</td>
						<td class="left">${memVO.tcoinBal}</td>
					</tr>

				</table>
			</div>

			<div class="div2">


				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/back-end/mem/mem.do"
					style="margin-bottom: 0px;">
					<input type="hidden" name="action" value="getOne_For_Update">
					<input type="hidden" name="mbrID" value="${memVO.mbrID}"> <input
						type="submit" value="修改" class="submitbtn" />
				</FORM>
			</div>
		</div>

	</main>





	<%@include file="/static/template/front_layout_footer.jsp"%>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- bootstrap JS-->
	<script
		src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>
	<script
		src="${pageContext.request.contextPath}/front-end/book/js/front_book_view.js"></script>
</body>
</html>