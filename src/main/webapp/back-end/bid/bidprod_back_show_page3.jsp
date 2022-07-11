<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.bid_prod.entity.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.cga102g3.web.bid_prod.entity.*"%>
<%@ page import="com.cga102g3.web.bid_prod.dao.*"%>
<%@ page import="java.util.*"%>

<%
    BidService bs = new BidService();
	String bidProdTitle = (String) request.getSession().getAttribute("bidProdTitle");
	
	List<BidProd> list = bs.showTitle(bidProdTitle);
    pageContext.setAttribute("list",list);
%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!-- bootstrap-icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!-- 側邊攔CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
<!-- 競標商品管理CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/back-end/bid/css/bidprod_back_page.css">

<title>管理後臺 | 競標商品管理</title>

</head>
<body>
	<header class="header">
		<h1 class="text-center"
			style="font-size: 32px; font-weight: 600; color: rgb(82, 136, 138)">競標商品管理</h1>
	</header>

	<%@include file="/static/template/back_layout_aside.jsp"%>

	<main class="main">
		<div class="container ml-1">
		<br>
			<div class="m-2 p-1" style="background-color:steelblue; width:80px; border-radius: 5px;">
				<a class="text-light" style="text-decoration: none;" href="${pageContext.request.contextPath}/back-end/bid/bidprod_back_page.jsp"> <i class="bi bi-caret-left-fill"></i> 上一頁</a>
			</div>
			
			<div style="font-size: 22px;" class="mb-2 mt-3">查詢結果</div>
			<table class="table table-sm">
				<thead>
					<tr>
						<th style="border-radius: 8px 0 0 0">競標商品編號</th>
						<th>書目編號</th>
						<th>圖片</th>
						<th>競標底價</th>
						<th>直購價</th>
						<th>最高出價</th>
						<th>商品狀態</th>
						<th>起標時間</th>
						<th>結標時間</th>
						<th style="border-radius: 0 8px 0 0;">修改</th>
					</tr>
				</thead>
				<%@ include file="page1.file" %> 		
				<tbody>
					<c:forEach var="bidProd" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
					<tr>
						<th class="header-row" scope="row">${bidProd.bidID}</th>
						<td>${bidProd.book.title}</td>
						<td>
						<img src="${pageContext.request.contextPath}/static/images/books/${bidProd.bookID}.jpg" height="80px">							
						</td>
						<td>${bidProd.startPrice}</td>
						<td>${bidProd.bidDirectPrice}</td>
						<td>${bidProd.bidCurPrice}</td>
						<td class="prodState">${bidProd.bidProdStat}</td>
						<td><fmt:formatDate value="${bidProd.bidStart}" pattern="yyyy-MM-dd HH:00:00"/></td>
						<td><fmt:formatDate value="${bidProd.bidEnd}" pattern="yyyy-MM-dd HH:00:00"/></td>
						<td class="last-col">
							<form method="post" action="bid.do">
								<button class="btn btn-sm btn-outline-secondary" type="submit"><i class="bi bi-pencil-fill"></i></button>
								<input type="hidden" name="bidID" value="${bidProd.bidID}">
								<input type="hidden" name="action" value="get_update"></form>
						</td>
					</tr>
					</c:forEach>	
					
				</tbody>
			</table>
			<div class="text-right mb-2 mt-2" style="font-size: 14px;">
			<%@ include file="page2.file" %>
			</div>
			
		</div>
<br>
<br>
	</main>
	
<script>
	let td = document.getElementsByClassName('prodState');
	for (d of td) {			
		if (d.innerHTML == 0){
			d.textContent='安排競標';
		} else if (d.innerHTML == 1) {
			d.textContent='待上架';
		} else if (d.innerHTML == 2) {
			d.textContent='標案進行中';
		} else if (d.innerHTML == 3) {
			d.textContent='結標售出'; 
		} else if (d.innerHTML == 4) {
			d.textContent='流標';
		} else if (d.innerHTML == 5) {
			d.textContent='撤消';
		}
	}

</script>	

<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- popper -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!-- bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<!-- Back Layout JS	 -->
	<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<!-- 競標商品管理 JS -->
	<script src="${pageContext.request.contextPath}/back-end/bid/js/bidprod_back_page.js"></script>
</body>
</html>