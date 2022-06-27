<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- Bootstrap4.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
<!-- Bootstrap Icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!--    基礎版面樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
<!--    競標訂單管理樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/back-end/bid_order/css/bid_order_page.css">


<title>管理後臺 | 競標訂單管理</title>
</head>

<body>
	<header class="header">
		<h1 class="text-center"
			style="font-size: 32px; font-weight: 600; color: rgb(82, 136, 138)">競標商品管理</h1>
	</header>
	<%@include file="/static/template/back_layout_aside.jsp"%>
	<main class="main">
		<div class="container mt-3 p-4">
			<h5 class="font-weight-bold mb-3">查詢結果如下: </h5>
<!-- <!----------------------- Search By Order ID, Shipment Management -------------------------------->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-3"> -->
<!-- 					<form method="post" action="bidOrder.do" class="form-inline mb-2"> -->
<!-- 						<div class="label" style="font-size: 14px;"> -->
<!-- 							<label for="input1">訂單編號: </label> -->
<!-- 						</div> -->
<!-- 						<div class="input-group ml-2"> -->
<!-- 							<input type="text" id="input1" class="form-control" -->
<!-- 								placeholder="Find by Order NO."> -->
<!-- 							<div class="input-group-append"> -->
<!-- 								<button class="btn btn-secondary"> -->
<!-- 									<i class="bi bi-search"></i> -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 				<div class="col-3 offset-6 mt-3"> -->
<!-- 					<form method="post" action="bidOrder.do" class="form-inline mb-2"> -->
<!-- 						<button class="btn btn-info" -->
<!-- 							style="font-size: 18px; border-radius: 10px"> -->
<!-- 							商品出貨管理 <i class="bi bi-truck"></i> -->
<!-- 						</button> -->
<!-- 					</form> -->

<!-- 				</div> -->
<!-- 			</div> -->
			
			
<!-- <!--------------------------- Search By Member Name --------------------------------------------------> 
<!-- 			<div class="row"> -->
<!-- 				<div class="col-3"> -->
<!-- 					<form method="post" action="bidOrder.do" class="form-inline mb-5"> -->
<!-- 						<div class="label" style="font-size: 14px;"> -->
<!-- 							<label for="input2">會員姓名: </label> -->
<!-- 						</div> -->
<!-- 						<div class="input-group ml-2"> -->
<!-- 							<input type="text" id="input2" class="form-control" -->
<!-- 								placeholder="Find by Member"> -->
<!-- 							<div class="input-group-append"> -->
<!-- 								<button class="btn btn-secondary"> -->
<!-- 									<i class="bi bi-search"></i> -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
			
<!-- <!-------------------------  Search by Order Date Range--------------------------------------------------> 
<!-- 			<div class="d-flex align-bottom"> -->
<!-- 				<div class="mr-auto mt-3"> -->
<!-- 					<h5 class="font-weight-bold" -->
<!-- 						style="color: rgb(63, 116, 169); text-decoration: underline;">最新訂單列表</h5> -->
<!-- 				</div> -->

<!-- 				<div> -->
<!-- 					<form method="post" action="bidOrder.do" class="form-inline mb-3"> -->
<!-- 						<div class="label" style="font-size: 14px;"> -->
<!-- 							<label for="input3">日期區間: </label> -->
<!-- 						</div> -->
<!-- 						<div class="input-group ml-2"> -->
<!-- 							<div class="input-group-prepend"> -->
<!-- 								<span class="input-group-text"><i -->
<!-- 									class="bi bi-calendar-week"></i></span> -->
<!-- 							</div> -->
<!-- 							<input type="text" id="input3" class="form-control"> -->
<!-- 						</div> -->
<!-- 						<span class="ml-2" style="font-size: 24px"> - </span> -->
<!-- 						<div class="input-group ml-2"> -->
<!-- 							<div class="input-group-prepend"> -->
<!-- 								<span class="input-group-text"><i -->
<!-- 									class="bi bi-calendar-week"></i></span> -->
<!-- 							</div> -->

<!-- 							<input type="text" id="input3" class="form-control"> -->
<!-- 						</div> -->
<!-- 						<button class="btn btn-outline-secondary ml-2">搜尋</button> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!------------------------- Most Recent Order Table-------------------------------------------------------->

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
						<th style="border-radius: 0 8px 0 0;">物流狀態</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr>
						<th>${bidOrder.bidOrderID}</th>
						<td>${bidOrder.bidID}</td>
						<td>${bidOrder.mbrID}</td>
						<td>${bidOrder.bidPrice}</td>
						<td><fmt:formatDate value="${bidOrder.bidOrderDate}" pattern="yyyy-MM-dd HH:00:00"/></td>
						<td class="shipState">${bidOrder.bidShipStat}</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th></th> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th></th> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th></th> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th></th> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th></th> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th></th> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th></th> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th></th> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th></th> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th></th> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th></th>  -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
				</tbody>
			</table>
			
<!---------------------------- Back to main page ----------------------------------------------------->
<div class="d-flex justify-content-end">
<a href="${pageContext.request.contextPath}/back-end/bid_order/bid_order_page.jsp" class="btn btn-secondary mt-2">回最新訂單列表</a>
</div>

			
<!---------------------------- List All Order -------------------------------------------------------->
			
<!-- 			<div class="d-flex justify-content-end"> -->
<!-- 				<form method="post" action="bidOrder.do"> -->
<!-- 					<input type="hidden" name="action" value="showAll"> -->
<!-- 					<button type="submit" class="btn btn-sm btn-outline-dark" -->
<!-- 						style="font-size: 12px;"> -->
<!-- 						<i class="bi bi-card-list"></i> 查看全部訂單 -->
<!-- 					</button> -->
<!-- 				</form> -->
<!-- 			</div> -->

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

	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- bootstrap JS-->
	<script
		src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
	<script
		src="${pageContext.request.contextPath}/back-end/book/js/back_book_view.js"></script>
</body>

</html>

