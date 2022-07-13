<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cga102g3.web.prod.service.*"%>

<%
ProdService pdSvc = new ProdService(); //每次都拿最新資料
List <Map<String, Object>> list = pdSvc.getALL(1); //資料庫有異動就會呈現出來
request.setAttribute("list", list);
%>

<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">
<meta charset="UTF-8">
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- date time picker樣式 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.css" />
<!-- Bootstrap4.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
<!--    基礎版面樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
<!--    後台書籍管理添加樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/back-end/book/css/back_book_update.css">



<title>管理後臺-一般商品管理</title>
</head>
<body>

	<header class="header">
		<h1>一般商品管理</h1>
	</header>
	<%@include file="/static/template/back_layout_aside.jsp"%>
	
	<main class="main">
		<div class="table_container">
			<input type="hidden" value="${pageContext.request.contextPath}" id="prefix">
			<div class="container">
				<br>
				<div class="row">
				
					<div class="input-group col-6 mb-3">
						<button type="button" class="btn btn-outline-success ml-2" id="add_prod_btn" onclick=
						"javascript:location.href='${pageContext.request.contextPath}/back-end/prod/back_prod_add.jsp'">
						商品新增</button>
					</div>
					
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/prod/prod.do" >
					<div class="input-group col-6 mb-3">
						<input type="text" id="keyword_input" name="keyword_input" class="form-control"
						aria-label="Search" style="margin-right:-350px"/>
						<button type="submit" class="btn btn-outline-info ml-2" id="search_btn"
						style="position:absolute; width:100px; left:360px;">商品搜尋</button>
						<input type="hidden" name="action"	value="search">
					</div>
					</FORM>
					
				</div>

		<%@ include file="page1.file" %> 
			<div class="row">
				<div class="col-12">
					<table class="table table-bordered text-center table-hover">
						<thead class="table-success">								
						<tr>
							<th scope="col" class="col-1">商品編號</th>
							<th scope="col" class="col-1">封面</th>
							<th scope="col" class="col-4">書名</th>
							<th scope="col" class="col-1">定價</th>
							<th scope="col" class="col-1">狀態</th>
							<th scope="col" class="col-1">編輯</th>
						</tr>
					</thead>
							
				<c:forEach var="prodVO" items="${list}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
					<tbody>
						<tr>
						<th scope="row" style="vertical-align:middle">${prodVO.prodID}</th>
							<td>
							<img src="${pageContext.request.contextPath}/static/images/books/${prodVO.bookID}.jpg" width="50px">
							</td>
							<td style="vertical-align:middle">${prodVO.title}</td>
							<td style="vertical-align:middle">${prodVO.price}</td>
							<td style="vertical-align:middle">${prodVO.status == 1 ? '上架' : '下架'}</td>
							<td style="vertical-align:middle">
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/prod/prod.do"> 
								<button type="submit" class="btn btn-success" id="submit_btn">
									<i class="fas fa-edit"></i>
								</button>
							  	<input type="hidden" name="prodID" value="${prodVO.prodID}">
							  	<input type="hidden" name="action"	value="getOne_For_Update">
						</FORM>
							</td>
						</tr>
				</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	<%@ include file="page2.file" %>


				<br>
			</div>
		</div>
	</main>
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- date time picker-->
	<script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script>
	<!-- bootstrap JS-->
	<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>

</body>
</html>