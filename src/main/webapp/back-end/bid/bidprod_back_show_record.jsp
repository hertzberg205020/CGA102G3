<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.bid_prod.entity.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.cga102g3.web.bid_prod.entity.*"%>
<%@ page import="com.cga102g3.web.bid_prod.dao.*"%>
<%@ page import="java.util.*"%>

<%
    BidProd bidProd = (BidProd) request.getSession().getAttribute("bidProd");
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
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>管理後臺 | 競標商品管理</title>

</head>
<body>
	<header class="header">
		<h1 class="text-center"
			style="font-size: 32px; font-weight: 600; color: rgb(82, 136, 138)">競標商品管理</h1>
	</header>

	<%@include file="/static/template/back_layout_aside.jsp"%>

	<main class="main">
		<div class="container">
			<div class="m-2 p-1 mt-3" style="background-color:steelblue; width:80px; border-radius: 5px;">
				<a class="text-light" style="text-decoration: none;" href="${pageContext.request.contextPath}/back-end/bid/bidprod_back_show_bid.jsp"> <i class="bi bi-caret-left-fill"></i> 上一頁</a>
			</div>
		
		    <h5 class="text-center font-weight-bold mt-5" style ="color: slateblue">競標出價紀錄</h5>
		    <br><br>
	        <div class="row d-flex chart justify-align-center">
	            <div class="canvas col-7 offset-1">
	                <canvas id="myChart"></canvas>
	            </div>
			    <div class="col-4 text-left text-secondary">
			    <div class="mt-4">競標商品編號: <span id="BidID">${bidProd.bidID}</span></div>
			    <div>底價: <span class="font-weight-bold">${bidProd.startPrice}</span>元</div>
			    <div>直購價: <span class="font-weight-bold">${bidProd.bidDirectPrice}</span>元</div>
		    	</div>
			</div>
		</div>
	</main>
	

	
<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- popper -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!-- bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<!-- Back Layout JS	 -->
	<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<!-- 競標商品紀錄 JS -->
	<script src="${pageContext.request.contextPath}/back-end/bid/js/bidprod_back_show_record.js"></script>
</body>
</html>