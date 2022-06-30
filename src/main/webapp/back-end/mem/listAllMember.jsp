<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cga102g3.web.mem.model.*"%>

<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<%
MemService MemSvc = new MemService();
List<MemVO> list = MemSvc.getAll();
pageContext.setAttribute("list", list);
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
<title>所有員工資料</title>


<style>
/* h4 { */
/* 	color: red; */
/* 	font-size: 15px; */
/* 	margin-bottom: 1px; */
/* 	margin-left: 10px; */
/* 	margin-top:10px; */
/* 	color: blue; */
/* } */

/* div.page1 { */
/* 	margin-left: 10px; */
/* } */

/* table#table-2 { */
/* 	width: 950px; */
/* 	margin-left: 10px; */
/* } */

/* table#table-2 { */
/* 	border: 1px solid #6699CC; */
/* 	border-radius: 5px; */
/* } */

/* th, td { */
/* 	padding: 5px; */
/* 	text-align: center; */
/* } */

/* div { */
/* 	width: 950px; */
/* 	text-align: center; */
/* } */

/* table#table-2 tbody tr:nth-child(odd) { */
/* 	background-color: #eee */
/* } */

/* table thead { */
/* 	background-color: #6699CC; */
/* 	color: white; */
/* } */

/* div.search{ */
/* text-align: right; */
/* } */
main.main{
	
}
</style>
</head>
<body>
	<header class="header">
		<h1>所有會員資料</h1>
	</header>

	<%@include file="/static/template/back_layout_aside.jsp"%>
	<main class="main">

	<br>
		<div class="input-group col-6 mb-3">

<!-- 			<h4> -->
<!-- 				<a href="select_page.jsp">回首頁</a> -->
<!-- 			</h4> -->
		
			<input type="search" id="keyword_input" class="form-control rounded"
				placeholder="Search" aria-label="Search"
				aria-describedby="search-addon" />
			<button type="button" class="btn btn-outline-info ml-2"
				id="search_btn">search</button>
			</div>

		
		<table class="table table-bordered text-center table-hover">
			<thead class="table-success">
				<tr>
					<th>會員編號</th>
					<th scope="col" class="col-4">會員帳號</th>
					<th>會員密碼</th>
					<th>會員狀態</th>
					<th>會員姓名</th>
					<th>會員性別</th>
					<th scope="col" class="col-4">會員電話</th>
					<th scope="col" class="col-4">會員住址</th>
					<th>會員生日</th>
					<th scope="col" class="col-4">會員mail</th>
					<th>加入時間</th>
					<th>Tcoin幣</th>
					<th>修改</th>
					<th>刪除</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="MemVO" items="${list}">
					<tr>
						<td>${MemVO.mbrID}</td>
						<td>${MemVO.mbrAccount}</td>
						<td>${MemVO.mbrPassword}</td>
						<td>${MemVO.mbrStatus}</td>
						<td>${MemVO.mbrName}</td>
						<td>${MemVO.mbrGender}</td>
						<td>${MemVO.mbrMobile}</td>
						<td>${MemVO.mbrAddr}</td>
						<td>${MemVO.mbrBirth}</td>
						<td>${MemVO.mbrEmail}</td>
						<td>${MemVO.mbrJointime}</td>
						<td>${MemVO.tcoinBal}</td>
						<td>
<!-- 							<FORM METHOD="post" -->
<%-- 								ACTION="<%=request.getContextPath()%>/back-end/mem/mem.do" --%>
<!-- 								style="margin-bottom: 0px;"> -->
<!-- 								<input type="submit" value="修改">  -->
<%-- 								<input type="hidden" name="mbrID" value="${MemVO.memID}">  --%>
<!-- 									<input type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 							</FORM> -->
						</td>
						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/back-end/mem/mem.do"
								style="margin-bottom: 0px;">

								<input class='delete_ID' type="hidden" name="mbrID"
									value="${MemVO.mbrID}"> 
									<input type="hidden" name="action" value="delete"> 
									<input class='delete' onclick="showalert()" type="submit" value="刪除">
							</FORM>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		<div class="row justify-content-around mt-2">
	     <button type="button" class="btn btn-outline-secondary" id="prePageBtn" hidden>上一頁</button>
     <button type="button" class="btn btn-outline-secondary" id="nextPageBtn">下一頁</button>
		</div>
		<br>
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
<script>
	var ID = document.querySelector('.delete_ID');
	function showalert() {
		var r = confirm("確定刪除嗎?");
		if (r == true) {
			alert("已成功刪除!");
		} else {
			return;
		}
	}
</script>


</html>