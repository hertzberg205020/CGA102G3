<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.cga102g3.web.bid_prod.entity.*"%>
<%@ page import="com.cga102g3.web.bid_prod.dao.*"%>
<%@ page import="java.util.*"%>


<%
BidService bs = new BidService();
List<BidProd> prod_list = bs.showAll();
pageContext.setAttribute("prodList", prod_list);
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
<!-- aside template -->
	<%@include file="/static/template/back_layout_aside.jsp"%>

	<main class="main">
		<div class="container ml-1">
<!-- search section -->
			<div class="upper-section">
				<div class="row mt-3">
					<div class="search-by-name col-4">
						<strong>查詢</strong> - 商品名稱
					</div>
					<div class="search-by-id col-4">
						<strong>查詢</strong> - 商品編號
					</div>
					<div class="search-by-state col-4">
						<strong>查詢</strong> - 商品狀態
					</div>
				</div>

		        <div class="row mb-3">
		            <div class="col-4">
		                <form method="post" action="bid.do">
		                    <div class="input-group mt-2">
		                        <input type="text" name="book_title" class="form-control" placeholder="輸入書籍名稱查詢"> 
		                        <div class="input-group-append">
		                            <button type="submit" class="btn btn-dark">
		                                <i class="bi bi-search"></i>
		                            </button>
		                            <input type="hidden" name="action" value="show_title">
		                        </div>
		                    </div>
		                </form>
		            </div>
		
		            <div class="col-4">
		                <form method="post" action="bid.do">
		                    <div class="input-group mt-2">
		                        <input type="text" name="bid_id" class="form-control" placeholder="輸入商品編號查詢"> 
		                        <div class="input-group-append">
		                            <button type="submit" class="btn btn-dark">
		                                <i class="bi bi-search"></i>
		                            </button>
		                            <input type="hidden" name="action" value="show_One">
		                        </div>
		                    </div>
		                </form>
		            </div>
		
		            <div class="col-4">
		                <form method="post" action="bid.do">
		                    <div class="input-group mt-2">
		                        <select class="form-control" name="bidProdStat">
		                            <option selected>選擇商品狀態</option>
		                            <option value="0">0-安排競標</option>
		                            <option value="1">1-待上架</option>
		                            <option value="2">2-標案進行中</option>
		                            <option value="3">3-結標售出</option>
		                            <option value="4">4-流標</option>
		                            <option value="5">5-撤銷</option>
		                        </select> <input type="hidden" name="action" value="show_State">
		                        <div class="input-group-append">
		                            <button type="submit" class="btn btn-dark">
		                                <i class="bi bi-search"></i>
		                            </button>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
        
				<c:if test="${not empty errorMsgs}">
					<font style="color: orangered; font-size: 14px;">請修正錯誤: </font>
<!-- 					<ul> -->
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: orangered; list-style: none; margin-left: 0;">${message}</li>
						</c:forEach>
<!-- 					</ul> -->
				</c:if>
				
		</div>
<!-- Table title / Bid Record / Insert -->
		<div class="d-flex mt-5">
			
			<div class="mb-2 mr-auto font-weight-bold" style="font-size: 24px;">競標商品列表</div>
			<div>
				<a class="btn btn-outline-primary mr-3" href="${pageContext.request.contextPath}/back-end/bid/bidprod_back_show_bid.jsp"> 
				<strong><i class="bi bi-graph-up"></i> 目前競標中商品 </strong>
				</a>
				<a class="btn btn-success" href="${pageContext.request.contextPath}/back-end/bid/bidprod_back_insert_page.jsp"> 
					<strong><i class="bi bi-plus-circle"></i> 新增競標商品 </strong>
				</a>
			</div>	
			
		</div>
		
			<table class="table table-sm mt-2 mb-3">
				<thead>
					<tr>
						<th style="border-radius: 8px 0 0 0">競標商品編號</th>
						<th>書籍名稱</th>
						<th>圖片</th>
						<th>底價</th>
						<th>直購價</th>
<!-- 						<th>最高出價</th> -->
						<th>商品狀態</th>
						<th>起標時間</th>
						<th>結標時間</th>
						<th style="border-radius: 0 8px 0 0;">修改</th>
					</tr>
				</thead>

				<%@ include file="page1_bidprod_back_page.file"%>
				
				<tbody>
					<c:forEach var="bidProd" items="${prodList}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
						<tr>
							<th class="header-row" scope="row">${bidProd.bidID}</th>
							<td>${bidProd.book.title}</td>
							<td><img src="${pageContext.request.contextPath}/static/images/books/${bidProd.bookID}.jpg" height="90px"></td>
							<td>${bidProd.startPrice}</td>
							<td>${bidProd.bidDirectPrice}</td>
<%-- 							<td>${bidProd.bidCurPrice}</td> --%>
							<td class="prodState">${bidProd.bidProdStat}</td>
							<td><fmt:formatDate value="${bidProd.bidStart}" pattern="yyyy-MM-dd HH:00:00" /></td>
							<td><fmt:formatDate value="${bidProd.bidEnd}" pattern="yyyy-MM-dd HH:00:00" /></td>
							<td class="last-col">
								<form method="post" action="bid.do">
								<button class="btn btn-sm btn-outline-secondary" type="submit">
									<i class="bi bi-pencil-fill"></i>
								</button>
								<input type="hidden" name="bidID" value="${bidProd.bidID}">
								<input type="hidden" name="action" value="get_update">
								</form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="text-right mb-2" style="font-size: 14px;">
			
				<%@ include file="page2.file"%>
				
			</div>
		</div>
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
		        d.parentNode.style.color="gainsboro";
		        d.parentNode.lastElementChild.firstElementChild
		        .firstElementChild.setAttribute("disabled", "");
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

</body>

</html>