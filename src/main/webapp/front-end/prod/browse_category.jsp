<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="UTF-8">
<!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!-- bootstrap icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!-- 前台template CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
<!-- 瀏覽商城CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/prod/css/browse.css">
    
    <title>一般商城</title>
    
</head>

<body>
<!-- header -->
<%@include file="/static/template/front_layout_header.jsp" %>

<!-- main -->
<main class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index.jsp" class="text-success bg-transparent">首頁</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/front-end/prod/browse.jsp" class="text-success bg-transparent">一般商城</a></li>
            <li id="current_page" class="breadcrumb-item active text-dark" aria-current="page">書籍分類</li>
        </ol>
    </nav>
    
    <div class="row mb-3">
        <div class="col">
            <div class="card">
                <img src="${pageContext.request.contextPath}/static/images/java-img4.png" height="280px" >
                <div class="card-img-overlay">
                    <h5 class="card-title text-light">Java 書籍特價中 On Sale</h5>
                    <a href="${pageContext.request.contextPath}/front-end/prod/browse_sale.jsp" class="btn btn-outline-light">See More</a>
                </div>
            </div>
        </div>
    </div>


    <div class="main-row row">
        <div class="side col-2 p-3">
			<div class="row">
            	<div class="col-12 sale-section mb-2 mt-3"><i class="bi bi-tags"></i><a href="${pageContext.request.contextPath}/front-end/prod/browse_sale.jsp" > 特價專區</a></div>
			</div>
            <hr>
			<div class="row">
            <form method="post" action="${pageContext.request.contextPath}/ProdServlet.do" >
                <div class="col-12 mt-3">
                    <label for="priceRange">依價格區間搜尋</label>
                    <button class="btn btn-sm btn-outline-secondary" type="submit" style="font-size: 12px;">GO</button>
                    <input type="range" list="tickmarks" name="price" value="800" min="0" max="1600" step="200" id="priceRange">
                	<datalist id="tickmarks">
							<option value="0"></option>
							<option value="400"></option>
							<option value="800"></option>
							<option value="1200"></option>
							<option value="1600"></option>
							</datalist>
                <div class="mb-4">
                	<small class="text-muted">0</small>
                	<small class="text-muted ml-2">400</small>
                	<small class="text-muted ml-2">800</small>
                	<small class="text-muted ml-1">1200</small>
                	<small class="text-muted ml-1">1600</small>
               	</div>
                	<input type="hidden" name="action" value="get_Price">
                </div>
            </form>
           </div>
        	<div class="row">
            <div class="col-12 book-category mb-3"><i class="bi bi-card-list"></i> 書籍分類</div>

			</div>
        </div>
        <div class="main-content col-9 ml-5 p-3">

            <div class="search-result row mb-3">
                <div class="col-12 mb-3">
                    搜尋結果共  <span class="font-weight-bold" style="color:rosybrown" id="result">  </span> 筆
                </div>
            </div>

<!-- display books  -->
            <div class="d-flex flex-row flex-wrap mb-4"></div>
        </div>

    </div>

    <!-- <img class="god" src="images/Godbless.png" height="500px;" width="500px;"></img><br> -->
    <img class="cs" src="${pageContext.request.contextPath}/static/images/cs.png" height="90px;" width="90px;" href="#">
</main>

<!-- footer -->
<%@include file="/static/template/front_layout_footer.jsp" %>

<!-- JQuery JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 瀏覽商城(分類)JS -->
<script src="${pageContext.request.contextPath}/front-end/prod/js/browse_category.js"></script>

<%-- <script src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script> --%>
 <script>
   $("#cart_btn").click(function () {
       location.href = '/CGA102G3/front-end/prod/car.jsp';
   });
 </script>
</body>
</html>
