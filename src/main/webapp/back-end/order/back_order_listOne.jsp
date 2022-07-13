<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.order_Item.service.*"%>
<%@ page import="java.util.*"%>
<%@ page pageEncoding="UTF-8"%>

<%
String orderID = request.getParameter("orderID");
OrderItemService orderitemSvc = new OrderItemService(); //每次都拿最新資料
List <Map<String, Object>> list = orderitemSvc.getALL(Integer.parseInt(orderID)); //資料庫有異動就會呈現出來
request.setAttribute("list", list);
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- datetimepicker樣式 -->
    <link   rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.css" />
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
    <!--    基礎版面樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
    <title>後台-訂單檢視</title>
    
    <style>
    #fileImg {
    display: block;
    width: 600px;
    aspect-ratio: 16 / 9;
    object-fit: contain;
	}
    </style>
    
</head>

<body>
<header class="header">
    <h1>訂單明細</h1>
</header>
<%@include file="/static/template/back_layout_aside.jsp"%>
<main class="main">

	<div id="table_container"><br>  
        <form class="align-items-start form-row justify-content-center" method="post" 
        enctype="multipart/form-data" action="${pageContext.request.contextPath}/back-end/order/order.do">
        
        <div class="col-10">
			<button class="btn btn-info  ml-right mr-1"
			onclick="location.href='${pageContext.request.contextPath}/back-end/order/back_order_listAll.jsp'" 
			type="button">返回列表</button>
        </div>
        
   	<div class="input-group mb-3 col-2" style="margin-right: 50px;">
 		<div class="input-group-prepend">
    		<span class="input-group-text">訂單編號</span>
    		<input readonly type="text"  id="order_ID" name="prodID" class="form-control" value="${param.orderID}">
  		</div>
	</div>  
	
	<jsp:useBean id="memSvc" scope="page" class="com.cga102g3.web.mem.model.MemService" />
	<div class="input-group mb-3 col-3">
 		<div class="input-group-prepend">
    		<span class="input-group-text">下單會員</span>
    		<input readonly type="text" class="form-control"
    		value="${memSvc.getOneMem(param.mbrID).mbrName}">
  		</div>
	</div>
			
        <div class="input-group mb-3 col-10">
        <table class="table table-bordered text-center table-hover">
		<thead class="table-success">								
			<tr>				
				<th scope="col" class="col-1">訂單日期</th>
				<th scope="col" class="col-1">訂單狀態</th>
				<th scope="col" class="col-1">物流狀態</th>
				<th scope="col" class="col-1">付款狀態</th>
				<th scope="col" class="col-1">付款方式</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="vertical-align:middle" id="date">
					${param.order_date}
				</td>
				<td style="vertical-align:middle">
				${param.order_status == 0 ? '<h5><span class="badge badge-primary">訂單成立</span><h5>':''}
				${param.order_status == 1 ? '<h5><span class="badge badge-info">配送中</span><h5>':''}
				${param.order_status == 2 ? '<h5><span class="badge badge-success">訂單完成</span><h5>':''}
				${param.order_status == 3 ? '<h5><span class="badge badge-secondary">訂單取消</span><h5>':''}
				</td>
				<td style="vertical-align:middle">
				${param.ship_status == 0 ? '<h5><span class="badge badge-primary">檢貨中</span><h5>':''}
				${param.ship_status == 1 ? '<h5><span class="badge badge-info">配送中</span><h5>':''}
				${param.ship_status == 2 ? '<h5><span class="badge badge-success">已送達</span><h5>':''}
				${param.order_status == 3 ? '<h5><span class="badge badge-secondary">訂單取消</span><h5>':''}
				</td>
				<td style="vertical-align:middle">
				${param.pay_status == 0 ? 
				'<h5><span class="badge badge-success">已付款</span><h5>' : 
				'<h5><span class="badge badge-secondary">未付款</span><h5>'}
				</td>
				<td style="vertical-align:middle">
				${param.pay_method == 0 ? '<h5><span class="badge badge-primary">信用卡</span><h5>':''}
				${param.pay_method == 1 ? '<h5><span class="badge badge-warning">錢包</span><h5>':''}
				${param.pay_method == 2 ? '<h5><span class="badge badge-light">貨到付款</span><h5>':''}
				</td>
			</tr>
		</tbody>
		</table>
		</div>

<div class="input-group mb-3 col-10">
	<table class="table table-bordered text-center table-hover" style="margin-bottom:-2px">
	<thead class="table-info"><tr><th scope="col">訂單明細</th></tr></thead></table>
		
	<table class="table table-bordered text-center table-hover">
		<thead class="table-success">								
			<tr>
				<th scope="col" class="col-1">封面</th>
				<th scope="col" class="col-1">商品編號</th>
				<th scope="col" class="col-1">商品價格</th>
				<th scope="col" class="col-1">商品數量</th>
				<th scope="col" class="col-1">小計</th>
			</tr>
		</thead>
	<c:forEach var="oiVO" items="${list}">
		<tbody>
			<tr>
				<td style="vertical-align:middle">
				<img src="${pageContext.request.contextPath}/static/images/books/${oiVO.prodID}.jpg" width="40px">
				</td>
				<td style="vertical-align:middle">${oiVO.prodID}</td>
				<td style="vertical-align:middle">$${oiVO.sale}</td>
				<td style="vertical-align:middle">${oiVO.amount}</td>
				<td style="vertical-align:middle">$${oiVO.amount*oiVO.sale}</td>
		</tbody>
	</c:forEach>
	</table>
</div>

	<div class="input-group mb-3 col-10">
 		<div class="input-group-prepend">
    		<span class="input-group-text">總價格</span>
  			<input readonly type="text" id="mbr_ID" name="mbrID" class="form-control" value="${param.total_price}">
  		</div>
	</div>

        </form>
        <br>
	</div>
</main>

<script>
let dom = document.getElementById('date');
dom.innerText = dom.innerText.split('.')[0];
</script>

<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<script src="${pageContext.request.contextPath}/back-end/prod/js/back_prod_add.js"></script>

</body>
</html>
