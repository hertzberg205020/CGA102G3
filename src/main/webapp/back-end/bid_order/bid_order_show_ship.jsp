<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Timestamp"%>

<%@ page import="com.cga102g3.web.bid_order.service.*"%>
<%@ page import="com.cga102g3.web.bid_order.entity.*"%>

<%
    BidOrderService bs = new BidOrderService();
	List<BidOrder> list = bs.showShipStat(0);
	pageContext.setAttribute("list",list);
	System.out.println(list);
%>


<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- Bootstrap4.6 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
<!-- Bootstrap Icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!--    側邊攔CSS  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
<!--    競標訂單管理樣式  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/back-end/bid_order/css/bid_order_page.css">


<title>管理後臺 | 競標訂單管理</title>
</head>

<body>
	<header class="header">
		<h1 class="text-center"
			style="font-size: 32px; font-weight: 600; color: rgb(82, 136, 138)">競標訂單管理</h1>
	</header>
	<%@include file="/static/template/back_layout_aside.jsp"%>
	<main class="main">
		<div class="container mt-3 p-4">
<!---------------------------- Back to main page ----------------------------------------------------->
<div class="d-flex justify-content-end">
<a href="${pageContext.request.contextPath}/back-end/bid_order/bid_order_page.jsp" class="btn btn-secondary">回最新訂單列表</a>
</div>
			
			<h5 class="font-weight-bold mb-3">待出貨商品: </h5>

<!------------------------- Bid Orders by Order State -------------------------------------------------------->

			<table class="table table-sm table-hover">
				<!-- <thead class="text-center text-light" style="background-color: rgb(143, 128, 201);"> -->
				<thead class="text-center text-light"
					style="background-color: rgb(88, 106, 156);">
					<tr>
						<th style="border-radius: 8px 0 0 0;">訂單編號</th>
						<th>競標商品編號</th>
						<th>得標會員</th>
						<th>得標價格</th>
						<th>得標時間</th>
						<th>物流狀態</th>
						<th style="border-radius: 0 8px 0 0;" class="text-left">操作</th>
					</tr>
				</thead>
				
				<tbody class="text-center">
					<c:forEach var="bidOrder" items="${list}">
					<tr>
						<th>${bidOrder.bidOrderID}</th>
						<td>${bidOrder.bidID}</td>
						<td>${bidOrder.mem.mbrName}</td>
						<td>${bidOrder.bidPrice}</td>
						<td><fmt:formatDate value="${bidOrder.bidOrderDate}" pattern="yyyy-MM-dd HH:00:00"/></td>
						<td class="shipState">
							${bidOrder.bidShipStat}
						</td>
						<td class="check">
						<form method="post" action="${pageContext.request.contextPath}/back-end/bid_order/bidOrder.do" class="form-inline">
						<input type="hidden" name="bidOrderID" value="${bidOrder.bidOrderID}">
						<input type="hidden" name="action" value="shipped">
						<button class="btn btn-dark btn-sm">出貨</button>
						
						</form>
						</td>
					</tr>
					</c:forEach>
					
					
				</tbody>
			</table>
			
		</div>
	</main>
	
	<script>
		let td = document.getElementsByClassName('shipState');
		console.log(td);
		for (d of td) {			
			if (d.innerHTML == 0){
				d.textContent='撿貨中';
			} else if (d.innerHTML == 1) {
				d.textContent='配送中';
			} else if (d.innerHTML == 2) {
				d.textContent='已送達';
			}
		}
	</script>

	<!-- JQuery -->
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- bootstrap JS-->
	<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
	<!-- Back Layout JS-->
	<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
</body>

</html>

