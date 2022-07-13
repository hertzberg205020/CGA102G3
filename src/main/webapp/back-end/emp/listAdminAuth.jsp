<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cga102g3.web.emp.model.*"%>

<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<%
AdminService AdminSvc = new AdminService();
List<AdminVO> list = AdminSvc.getAll();
pageContext.setAttribute("list", list);
%>

<html>
<head>
<meta charset="UTF-8">

<!-- CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<!-- jq -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

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
<title>員工權限管理</title>


<style>
h4 {
	color: red;
	font-size: 15px;
	margin-bottom: 1px;
	margin-left: 10px;
	margin-top:10px;
	color: blue;
}

div.page1 {
	margin-left: 10px;
}

table#table-2 {
	width: 950px;
	margin-left: 10px;
}

/* table#table-2 { */
/* 	border: 1px solid #6699CC; */
/* 	border-radius: 5px; */
/* } */

th, td {
/* 	padding: 5px; */
	text-align: center;
	vertical-align: middle;
}

div.container {
margin-bottom: 10px;
}

table#table-2 tbody tr:nth-child(odd) {
	background-color: #eee
}

table thead {
	background-color: #6699CC;
	color: white;
}

div.search{
/* display:inline-flex; */
}
div.input-group col-6 mb-3{
margin-right: 10px;
float:right;
}


</style>
</head>
<body>
	<header class="header">
		<h1>員工權限管理</h1>
	</header>

	<%@include file="/static/template/back_layout_aside.jsp"%>
	


	<main class="main">
<br>
	<div class="search">
				
	<h4>
				<a href="select_page.jsp">回首頁</a>
			</h4>
		</div>
<!-- 		<div class="page1"> -->
<%-- 			<%@ include file="page1.file"%> --%>
<!-- 		</div> -->
		<div class="container">
		<table class ="table table-bordered text-center table-hover" id = 'table_id'>
			<thead class="table-success">
				<tr>
					<th>員工編號</th>
					<th>員工帳號</th>					
					<th>員工姓名</th>
					<th>員工照片</th>
					<th>權限修改</th>

				</tr>
			</thead>

			<tbody>
				<c:forEach var="AdminVO" items="${list}" >
<%-- 				begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" --%>
				
					<tr>
						<td  style="vertical-align:middle">${AdminVO.adminID}</td>
						<td  style="vertical-align:middle">${AdminVO.adminAccount}</td>
						<td  style="vertical-align:middle">${AdminVO.adminName}</td>
						<td  style="vertical-align:middle"><img
							src="${pageContext.request.contextPath}/static/images/emp/${AdminVO.adminID}.png"
							width="80" height="80"></td>
						<td  style="vertical-align:middle">
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do"
								style="margin-bottom: 0px;">
								<input class="btn btn-warning" type="submit" value="修改"> 
								<input type="hidden" name="adminID" value="${AdminVO.adminID}"> 
								<input type="hidden" name="action" value="getOne_For_UpdateAuth">
							</FORM>
						</td>
						
					</tr>

				</c:forEach>
			</tbody>
		</table>
		</div>
<!-- 		<div> -->
<%-- 			<%@ include file="page2.file"%> --%>
<!-- 		</div> -->
		
	</main>

<script type="text/javascript">
var imgs=document.images;
for (var i=0;i<imgs.length;i++){
imgs[i].onerror=function(){this.src="${pageContext.request.contextPath}/static/images/nopic.png"}
}
</script>

<script>
    $(document).ready( function () {
        $('#table_id').DataTable(); 
    } );
</script>




	<!-- Jquery -->
<!-- 	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script> -->
	<!-- datetimepicker-->
	<%--<script src="${pageContext.request.contextPath}/datetimepicker/jquery.js"></script>--%>
	<script
		src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- bootstrap JS-->
	<script
		src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<!-- 	<script -->
<%-- 		src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script> --%>
<!-- 	<script -->
<%-- 		src="${pageContext.request.contextPath}/back-end/book/js/back_book_add.js"></script> --%>
</body>




</html>