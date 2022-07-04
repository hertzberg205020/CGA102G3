<%--
  Created by IntelliJ IDEA.
  User: u8360
  Date: 2022/6/23
  Time: 下午 09:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/prod/css/browse.css">
    <title>一般商城</title>
    
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/front-end/prod/js/browse.js"></script>

</head>

<body>
<%@include file="/static/template/front_layout_header.jsp" %>

<!-- main -->
<main class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index.html" class="text-success bg-transparent">首頁</a></li>
            <li class="breadcrumb-item active text-dark" aria-current="page">一般商城</li>
        </ol>
    </nav>
	<input id="path" type="hidden" value="${pageContext.request.contextPath}">
    
    <div class="row mb-3">
        <div class="col">
            <div class="card">
                <img src="${pageContext.request.contextPath}/static/images/java-img4.png" height="280px" >
                <div class="card-img-overlay">
                    <h5 class="card-title text-light">Java 書籍特價中</h5>
                    <p class="card-text text-light">With supporting text below as a natural lead-in to additional content....</p>
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
            <form class="col-12 mt-3">
                <div class="form-group">
                    <label for="customRange3">依價格區間選擇</label>
                    <input type="range" class="custom-range" min="0" max="1200" step="200" id="customRange3">
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
<!--                     搜尋結果共  <span class="font-weight-bold" style="color:rosybrown"> 20 </span>筆，頁數 <span  class="font-weight-bold" style="color:rosybrown"> 1 </span> / 2 -->
                </div>
            </div>

               <div class="d-flex flex-row flex-wrap mb-4">
           </div>
            <div class="row mb-4">
                <div class="ml-auto">
                    <ul class="pagination justify-content-end">
                        <li class="page-item"><a class="page-link text-secondary"
                                                 href="#">上一頁</a></li>
                        <li class="page-item"><a class="page-link text-secondary"
                                                 href="#">1</a></li>
                        <li class="page-item"><a class="page-link text-secondary"
                                                 href="#">2</a></li>
                        <li class="page-item"><a class="page-link text-secondary"
                                                 href="#">3</a></li>
                        <li class="page-item"><a class="page-link text-secondary"
                                                 href="#">下一頁</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>

    <!-- <img class="god" src="images/Godbless.png" height="500px;" width="500px;"></img><br> -->
    <img class="cs" src="${pageContext.request.contextPath}/static/images/cs.png" height="90px;" width="90px;" href="#">
</main>

<!-- footer -->
<%@include file="/static/template/front_layout_footer.jsp" %>


<script src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>
 <script>
   $("#cart_btn").click(function () {
       location.href = '/CGA102G3/front-end/prod/car.jsp';
   });
 </script>
</body>
</html>
