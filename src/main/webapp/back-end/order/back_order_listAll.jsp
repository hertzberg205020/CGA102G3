<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.cga102g3.web.order.service.*"%>

<%
OrderService orderSvc = new OrderService(); //每次都拿最新資料
List <Map<String, Object>> list = orderSvc.getALL(); //資料庫有異動就會呈現出來
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
	
	<!-- CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
	<!-- jq -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

<title>管理後臺-一般商品訂單管理</title>
<style>
th{
white-space:nowrap;}
</style>
</head>
<body>

	<header class="header">
		<h1>訂單管理</h1>
	</header>
	<%@include file="/static/template/back_layout_aside.jsp"%>
	<main class="main">
		<div class="table_container">
			<input type="hidden" value="${pageContext.request.contextPath}" id="prefix">
			<div class="container">
				<br>

			<div class="row">
				<div class="col-12">
					<table class="display" id="table_id">
						<thead>								
						<tr>
							<th scope="col" class="col-1">訂單編號</th>
							<th scope="col" class="col-2">訂單日期</th>
							<th scope="col" class="col-1">訂單狀態</th>
							<th scope="col" class="col-1">物流狀態</th>
							<th scope="col" class="col-1">付款狀態</th>
							<th scope="col" class="col-1">會員</th>
							<th scope="col" class="col-1">總價</th>
							<th scope="col" class="col-1">查看詳情</th>
							<th scope="col" class="col-1">取消訂單</th>
						</tr>
					</thead>
                <jsp:useBean id="memSvc" scope="page" class="com.cga102g3.web.mem.model.MemService"/>						
					<tbody>
				<c:forEach var="orderVO" items="${list}" >
						<tr>
						<th scope="row" style="vertical-align:middle">${orderVO.orderID}</th>
							<td style="vertical-align:middle">
							  <fmt:formatDate value="${orderVO.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							
							<td style="vertical-align:middle">
							${orderVO.orderStatus == 0 ? '<h5><span class="badge badge-primary">訂單成立</span><h5>':''}
							${orderVO.orderStatus == 1 ? '<h5><span class="badge badge-info">配送中</span><h5>':''}
							${orderVO.orderStatus == 2 ? '<h5><span class="badge badge-success">訂單完成</span><h5>':''}
							${orderVO.orderStatus == 3 ? '<h5><span class="badge badge-secondary">訂單取消</span><h5>':''}
							</td>
							
							<td style="vertical-align:middle">
							${orderVO.shipStatus == 0 ? '<h5><span class="badge badge-primary">檢貨中</span><h5>':''}
							${orderVO.shipStatus == 1 ? '<h5><span class="badge badge-info">配送中</span><h5>':''}
							${orderVO.shipStatus == 2 ? '<h5><span class="badge badge-success">已送達</span><h5>':''}
							${orderVO.shipStatus == 3 ? '<h5><span class="badge badge-secondary">訂單取消</span><h5>':''}
							</td>
							
							<td style="vertical-align:middle">
							${orderVO.payStatus == 0 ? 
							'<h5><span class="badge badge-success">已付款</span><h5>' : 
							'<h5><span class="badge badge-secondary">未付款</span><h5>'}
							</td>
							
							<td style="vertical-align:middle">${memSvc.getOneMem(orderVO.mbrID).mbrName}</td>
							<td style="vertical-align:middle">${orderVO.totalPrice}</td>
							
							<td style="vertical-align:middle">
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/order/order.do" > 
								<button type="submit" class="btn btn-success" id="submit_btn">
									<i class="fas fa-eye"></i>
								</button>
							  	<input type="hidden" name="orderID" value="${orderVO.orderID}">
							  	<input type="hidden" name="action"	value="getOne_For_Display">
							</FORM>
							</td>
							
							<td style="vertical-align:middle">
								<button  class="btn btn-danger" onClick="cancel(${orderVO.orderID}, ${orderVO.orderStatus})">
									<i class="fas fa-ban"></i>					
							  	</button>
							</td>
						</tr>
				</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
				<br>
			</div>
		</div>
	</main>
	<!-- date time picker-->
	<script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script>
	<!-- bootstrap JS-->
	<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
	<script src="${pageContext.request.contextPath}/back-end/book/js/back_book_update.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	<script>
		 function cancel(data, orderStatus) {
			 if(orderStatus === 3) {
				 Swal.fire(
				 '該筆訂單已取消了喔!',
  				 '',
		         'warning'
				)
			 } else if(orderStatus === 2) {
				 Swal.fire(
						 '該筆訂單已成立了喔!',
		  				 '已成立訂單無法取消',
				         'warning'
						)
			 } else {
				Swal.fire({
 				   		 title: '你確定要取消該筆訂單?',
 						 text: "訂單取消後便無法復原",
 		 				 icon: 'warning',
 					 	 showCancelButton: true,
 						 confirmButtonColor: '#3085d6',
 						 cancelButtonColor: '#d33',
 		 				 confirmButtonText: '確定',
 		 				 cancelButtonText: '取消'
						 }).then((result) => {
 						if (result.isConfirmed) {
					 
			      	$.ajax({
					         url: "/CGA102G3/order/api/getOrderInfo",             
					         dataType: "Json",
					         async: false,
					         data: {
					        	'orderID':data
					         },
					        success: function(res){	
					        	Swal.fire(
 		   						 '取消訂單!',
 		   		  				 '該筆訂單已取消',
 		   				         'success'
 		   						).then((result) => {
	  		   					 location.reload();
	  		   					})
					        },
					      
					     })
  						}
  					  })
					 }
					}
	</script>
	
	<script>
    $(document).ready( function () {
        $('#table_id').DataTable(); 
    } );
	</script>
 						
</body>
</html>