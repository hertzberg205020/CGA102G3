<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.cga102g3.web.bid_order.service.*"%>
<%@ page import="com.cga102g3.web.bid_order.entity.*"%>
<%@ page import="java.util.*"%>


<%
    BidOrderService bs = new BidOrderService();
	List<BidOrder> list = bs.showNewOrder();
	pageContext.setAttribute("list",list);
    
%>


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

<!----------------------- Search By Order ID, Shipment Management -------------------------------->
			<div class="row">
				<div class="col-3">
					<form method="post" action="${pageContext.request.contextPath}/back-end/bid_order/bidOrder.do" class="form-inline mb-2">
						<div class="label" style="font-size: 14px;">
							<label for="input1">訂單編號: </label>
						</div>
						<div class="input-group ml-2">
<!-- 							<input type="hidden" name="action" value="show_One"> -->
							<input type="text" id="input1" class="form-control" name="bidOrderID"
								placeholder="Find by Order NO.">
							<input type="hidden" name="action" value="showOne">
							<div class="input-group-append">
								<button class="btn btn-secondary" type="submit">
									<i class="bi bi-search"></i>
								</button> 
							</div>
						</div>
					</form>
				</div>
				<div class="col-3 font-weight-bold mt-4" style="color: coral;">${errMsgsOrd[0]}</div>
				
				<div class="col-3 offset-3 mt-3">
					<form method="post" action="bidOrder.do" class="form-inline mb-2">
<!-- 						<button class="btn btn-info" -->
<!-- 							style="font-size: 18px; border-radius: 10px"> -->
<!-- 							商品出貨管理 <i class="bi bi-truck"></i> -->
<!-- 						</button> -->
						<a href="${pageContext.request.contextPath}/back-end/bid_order/bid_order_show_ship.jsp" class="btn btn-info"
							style="font-size: 18px; border-radius: 10px">
							商品出貨管理 <i class="bi bi-truck"></i>
						</a>
					</form>

				</div>
			</div>
			
			
<!--------------------------- Search By Member Name -------------------------------------------------->
			<div class="row">
				<div class="col-3">
					<form method="post" action="bidOrder.do" class="form-inline mb-4">
						<div class="label" style="font-size: 14px;">
							<label for="input2">會員姓名: </label>
						</div>
						<div class="input-group ml-2">
							<input type="text" id="input2" class="form-control"
								placeholder="Find by Member">
							<div class="input-group-append">
								<button class="btn btn-secondary">
									<i class="bi bi-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-3 mt-4 text-secondary">${errMsgsMem[0]}</div>
			</div>
			
			
<!-------------------------  Search by Order Date Range-------------------------------------------------->
			<div class="row" style="height: 26px;">
				<div class="col-2 offset-5 mb-1 font-weight-bold" style="color: coral;">${errMsgsDate[0]}</div>
			
			</div>
			<div class="d-flex align-bottom">
				<div class="mr-auto mt-3">
					<h5 class="font-weight-bold"
						style="color: rgb(63, 116, 169); text-decoration: underline;">最新訂單列表</h5>
				</div>

				<div>
					<form method="post" action="bidOrder.do" class="form-inline mb-3">
						<div class="label" style="font-size: 14px;">
							<label for="date1">日期區間: </label>
						</div>
						<div class="input-group ml-2">
							<div class="input-group-prepend">
								<span class="input-group-text"><i
									class="bi bi-calendar-week"></i></span>
							</div>
							<input type="text" name="start" class="form-control" id="date1">
						</div>
						<span class="ml-2" style="font-size: 24px"> - </span>
						<div class="input-group ml-2">
							<div class="input-group-prepend">
								<span class="input-group-text"><i
									class="bi bi-calendar-week"></i></span>
							</div>

							<input type="text" name="end" class="form-control" id="date2">
						</div>
						<input type="hidden" name="action" value="showRange">
						<button class="btn btn-outline-secondary ml-2" type="submit">搜尋</button>
					</form>
				</div>
			</div>

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
<!-- 						<th></th> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
				<c:forEach var="bidOrder" items="${list}">
					<tr>
						<th>${bidOrder.bidOrderID}</th>
						<td>${bidOrder.bidID}</td>
						<td>${bidOrder.mbrID}</td>
						<td>${bidOrder.bidPrice}</td>
						<td><fmt:formatDate value="${bidOrder.bidOrderDate}" pattern="yyyy-MM-dd HH:00:00"/></td>
						<td class="shipState">${bidOrder.bidShipStat}</td>
					</tr>
	 			</c:forEach>	
				</tbody>
			</table>
			
			
<!---------------------------- List All Order -------------------------------------------------------->
			
			<div class="d-flex justify-content-end">
<!-- 				<form method="post" action="bidOrder.do"> -->
<!-- 					<input type="hidden" name="action" value="showAll"> -->
<!-- 					<button type="submit" class="btn btn-sm btn-outline-dark" -->
<!-- 						style="font-size: 12px;"> -->
<!-- 						<i class="bi bi-card-list"></i> 查看全部訂單 -->
<!-- 					</button> -->
					<a href="${pageContext.request.contextPath}/back-end/bid_order/bid_order_show_all.jsp" class="btn btn-sm btn-outline-dark"
						style="font-size: 12px;">
						<i class="bi bi-card-list"></i> 查看全部訂單
					</a>
					
<!-- 				</form> -->
			</div>

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
<% 
  java.sql.Timestamp start = null;
  try {
	    start = java.sql.Timestamp.valueOf(request.getParameter("start").trim());
	    System.out.println(start);
	    
   } catch (Exception e) {
	   start = new java.sql.Timestamp(System.currentTimeMillis());
   }
  java.sql.Timestamp end = null;
  try {
	    end = java.sql.Timestamp.valueOf(request.getParameter("end").trim());
	    System.out.println(end);
   } catch (Exception e) {
	    end = new java.sql.Timestamp(System.currentTimeMillis());
   }

%>

<!-- datetimepicker -->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.ContextPath}/static/datetimepicker/jquery.datetimepicker.css" /> --%>
<%-- <script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script> --%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/static/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/static/datetimepicker/jquery.datetimepicker.full.js"></script>


<script>
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){
	 $('#date1').datetimepicker({
	 closeOnWithoutClick :false,
	  format:'Y-m-d 00:00:00',
// 	  allowTimes: [
// 		  '12:00'
// 	  ],
// 	  defaultTime: '12:00',
	  onShow:function(){
	   this.setOptions({
	    maxDate:$('#date2').val()?$('#date2').val():false
	   })
	  },
	  timepicker: false,
      values:'<%=start%> ' 
	 });
	 
	 $('#date2').datetimepicker({
	 closeOnWithoutClick :false,
	  format:'Y-m-d 23:00:00',
// 	  allowTimes: [
// 		  '22:00'
// 	  ],
// 	  defaultTime: '22:00',
	  onShow:function(){
	   this.setOptions({
	    minDate:$('#date1').val()?$('#date1').val():false
	   })
	  },
	  timepicker:false,
	  values:'<%=end%> ' 
	 });
});



</script>
</html>

