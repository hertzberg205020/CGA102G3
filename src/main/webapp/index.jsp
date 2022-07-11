<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cga102g3.web.prod.model.*"%>

<%
ProdService pdSvc = new ProdService(); //每次都拿最新資料
List <Map<String, Object>> list = pdSvc.getALLSALE(); //資料庫有異動就會呈現出來
request.setAttribute("list", list);
%>

<%
ProdService pdSvc2 = new ProdService(); //每次都拿最新資料
List <Map<String, Object>> list2 = pdSvc2.getTOPSALE(); //資料庫有異動就會呈現出來
request.setAttribute("list", list2);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_search_layout.css">
    <!--    基礎版面樣式  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/index.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="${pageContext.request.contextPath}/static/template/js/index.js"></script>
    <title>商城首頁</title>
</head>
<body>

<%@include file="/static/template/front_layout_header.jsp"%>

<!-- 輪播區塊 -->
<div id="carouselExampleCaptions" class="carousel slide size_ctrl" data-ride="carousel" style="width:100%">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="${pageContext.request.contextPath}/static/images/img1.jpg" class="d-block w-100">
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/static/images/img2.jpg" class="d-block w-100">
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/static/images/img3.jpg" class="d-block w-100">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </button>
</div>

<!-- 商品列表 -->
<main class="main">
    <div style="background-color:#678F74; border-radius: 3px 3px 0 0;">
        <BIG style="color: white; padding-left: 20px; font-size:28px">銷售排行</BIG>
    </div> 
            <div style="background: linear-gradient(to left, white 0%, gold 100%); 
            margin-bottom:-30px; width:240px; height:30px">
       			<P style="padding-left: 10px; font-weight:700;">1st</P>
    		</div> 
    		<div style="background: linear-gradient(to left, white 0%, silver 100%); 
    		margin-bottom:-30px; width:240px; height:30px; margin-left:240px">
       			<P style="padding-left: 10px; font-weight:700;">2nd</P>
    		</div> 
    		<div style="background: linear-gradient(to left, white 0%, #BB5E00 100%); 
    		width:300px; height:30px; margin-left:480px">
       			<P style="padding-left: 10px; font-weight:700;">3rd</P>
    		</div> 
    <ul class="item_list" id="topsale_list">
<!-- Will append HTML from static/template/js/index.js -->
    </ul>
    
    <div style="background-color:#678F74; border-radius: 3px 3px 0 0;">
        <BIG style="color: white; padding-left: 20px; font-size:28px">一般商城</BIG>
    </div> 
    <ul class="item_list" id="prod_list">
<!-- Will append HTML from static/template/js/index.js -->
    </ul>
    
    <div style="background-color:#678F74; border-radius: 3px 3px 0 0">
        <BIG style="color: white; padding-left: 20px; font-size:28px">競標商城</BIG>
    </div> 
    <ul class="item_list">
          <li>       
            <div class="col-3" style="margin-top:20px">
               <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/9.jpg"></div>
                  <div style="width:200px; font-weight:700;">
                     <a href="#" style="width:100px">Book title goes here</a>
                  </div>
               <div class="price text-dark mb-2 p-2" style="width:200px;">
                  此刻競標價格: <span>1000</span>元<br>
                  剩餘競標時間: <br><span style="color:indianred;">dd HH:mm:ss</span>
               </div>
            </div>   
          </li>

    </ul>
</main>
    
    <button class="cs" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" data-title="test" aria-controls="offcanvasExample"
    style="height:60px; width:60px;border-radius:50px; background-color:black">
    <img src="${pageContext.request.contextPath}/static/images/mall.png" ></img>
    </button>
    
<%@include file="/static/template/front_layout_footer.jsp"%>

<script>
function add(e) {    
	console.log(e);
    fetch('/CGA102G3/ProdServlet.do?prodID=' + e + '&action=add')
        .then(response => response.text())
        .then(myjson => {
            if (myjson === 'success') swal("Good job!", "加入成功", "success");
            else {
                swal("加入失敗!請先登入", "5秒後為你跳轉畫面", "error");
                setTimeout(function () {
                    location.href = `/CGA102G3/front-end/prod/shop.jsp`
                }, 3000);
            }
        })
}
</script>
</body>
</html>