<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.bid_prod.entity.*"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- font-awesome -->
<link rel="stylesheet"
	  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<!-- bootstrap-icon -->
<link rel="stylesheet"
	  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<title>管理後臺 | 競標商品管理</title>
<!-- 側邊攔CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
<!-- 競標商品管理CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/back-end/bid/css/bidprod_back_page.css">

</head>
<body>

	<header class="header">
		<h1 class="text-center"
			style="font-size: 32px; font-weight: 600; color: rgb(82, 136, 138)">
			競標商品管理
		</h1>
	</header>

	<%@include file="/static/template/back_layout_aside.jsp"%>

	<main class="main">
		<div class="container">
			<br>
			<div class="m-2 p-1" style="background-color:steelblue; width:80px; border-radius: 5px;">
				<a class="text-light" style="text-decoration: none;" href="${pageContext.request.contextPath}/back-end/bid/bidprod_back_page.jsp"> &lt; 上一頁</a>
			</div>
			
			<div style="font-size: 22px;">查詢結果</div>
			
			<table class="table table-sm table-hover" style="font-size: 14px;">
				<thead>
					<tr>
						<th style="border-radius: 8px 0 0 0; height: 20px;">競標商品編號</th>
						<th>書籍名稱</th>
						<th>競標底價</th>
						<th>直購價</th>
						<th>最高出價</th>
						<th>商品狀態</th>
						<th>起標時間</th>
						<th>結標時間</th>
						<th style="border-radius: 0 8px 0 0;">修改</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="header-row" scope="row">${bidProd.bidID} <!--競標商品編號-->
							<a href="${pageContext.request.contextPath}/template/bid_front_layout.html"
							   target="_blank" data-toggle="tooltip" data-placement="right"
							   title="查看商品詳情"><i class="bi bi-book"></i>
						    </a>
					    </th>
						<td>${bidProd.book.title}</td>      <!--書籍名稱-->
						<td>${bidProd.startPrice}</td>      <!--競標起始價-->
						<td>${bidProd.bidDirectPrice}</td>  <!--競標直購價-->
						<td>${bidProd.bidCurPrice}</td>     <!--目前最高價-->
						<td class="prodState">${bidProd.bidProdStat}</td>
						<td>${bidProd.bidStart}</td>   <!-- 起標時間 -->
						<td>${bidProd.bidEnd}</td>     <!-- 結標時間 -->
						<td class="last-col">
							<a class="text-light"
							   href="${pageContext.request.contextPath}/bid/bidprod_back_update_page.jsp"
							   target="_blank"> <i class="bi bi-pencil-fill"></i>
						   </a>
					   </td>
					</tr>
				</tbody>
			</table>
		</div>
	</main>
	
<script>
	let td = document.getElementsByClassName('prodState');
	console.log(td);
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

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<script src="${pageContext.request.contextPath}/back-end/bid/js/bidprod_back_page.js"></script>

</body>
</html>