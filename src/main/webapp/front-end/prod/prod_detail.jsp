<%--
  Created by IntelliJ IDEA.
  User: Tibame_T14
  Date: 2022/6/18
  Time: 下午 09:03
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.cga102g3.web.prod.entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/prod/css/prod_detail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
    <title>一般商城</title>

    <script src="${pageContext.request.contextPath}/front-end/prod/js/prod_detail.js"></script>
    <script src="${pageContext.request.contextPath}/front-end/prod/js/detail.js"></script>
</head>
<body>
<%@include file="/static/template/front_layout_header.jsp" %>
<main class="container">
    <!-- BREADCRUMB -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index.jsp"
                                           class="text-success bg-transparent">首頁</a></li>
            <li class="breadcrumb-item "><a href="${pageContext.request.contextPath}/front-end/prod/browse.jsp"
                                            class="text-success bg-transparent">一般商城</a></li>
            <li class="breadcrumb-item"> ${prodID.book.categoryName}</li>
            <li class="breadcrumb-item active text-dark" aria-current="page">${prodID.book.title}</li>
        </ol>
    </nav>


    <!-- INFORMATION SECTION -->
    <div class="section-info row mb-5">
        <!-- Book Picture -->
        <div class="col-md mt-2">
            <!-- click to enlarge picture -->
            <img class="ml-5" src="${pageContext.request.contextPath}/static/images/books/${prodID.prodID}.jpg"
                 width="70%" id="pic" data-toggle="modal" data-target="#Modal-1">
            <!-- model -->
            <div class="modal fade" id="Modal-1" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close mb-2" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true" style="font-size: 35px;">&times;</span>
                            </button>
                            <div class="pic-enlarge">
                                <img src='${pageContext.request.contextPath}/static/images/books/${prodID.prodID}.jpg'
                                     width="100%">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Book Detail Information -->
        <div class="col-md mt-2">
            <h3 class="prodID ml-3">${prodID.book.title}</h3>
            <div class="author m-3">作者: <span>${prodID.book.author}</span></div>
            <div class="general ml-3 mb-4 mr-3">
                <div class="publisher mt-2 mb-2">出版社: <span>${prodID.book.publisher}</span></div>
                <div class="pubdate mb-2">出版日期: <span>${prodID.book.pubdate}</span></div>
                <div class="direct-price mb-2">定價: <span
                        style="color:goldenrod; font-weight:bold;">${prodID.price}</span>元
                </div>
                <div class="page mb-2">頁數: <span>${prodID.book.pages}</span></div>
                <div class="isbn mb-2">ISBN: <span>${prodID.book.ISBN}</span></div>
            </div>
        </div>
        <div class="btn-direct-buy mt-5 text-right" id="prod-id${prodID.prodID}">
            <button type="button" class="btn btn-outline-info btn-lg ml-2" onclick="add(this)"><i
                    class="bi bi-bag-heart-fill"></i>
                加入購物車
            </button>
        </div>
        <div class="btn-direct-buy mt-5 text-right ">
            <button type="button" class="btn btn-outline-info btn-lg ml-2" onclick="car(this)"><i
                    class="bi bi-bag-heart-fill"></i>
                直接購買
            </button>
        </div>
    </div>


    <!-- BOOK SUMMERY SECTION -->
    <hr data-content="內容簡介" class="hr-text">
    <div class="section-intro row p-3">
        <div class="content-summary col">
            ${prodID.book.summary}
        </div>
    </div>

    <!-- TABLE OF CONTENT SECTION -->
    <hr data-content="目錄" class="hr-text">
    <div class="section-intro row p-3">
        <div class="table-of-content col" id="content">
            ${prodID.book.tableContent}
        </div>
    </div>
    <input type="hidden" id="path" value="${pageContext.request.contextPath}">
    <input type="hidden" id="prodID" value="${prodID.prodID}">
</main>
<%@include file="/front-end/review/listAllRev.jsp" %>
<%@include file="/static/template/front_layout_footer.jsp" %>



<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
        integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

    //目錄換行
    let content = document.querySelector(".table-of-content").innerHTML;
    content = content.replace(/\n|\r\n/g, "<br>");
    document.querySelector(".table-of-content").innerHTML = content;

    //點擊加入購物車
    function add(e) {
        let path = $('#path').val();
        let prodID = $('#prodID').val();
        console.log(prodID)
        fetch('' + path + '/ProdServlet.do?prodID=' + prodID + '&action=add')
            .then(response => response.text())
            .then(myjson => {
                if (myjson === 'success') swal("Good job!", "加入成功", "success");
                else {
                    swal("加入失敗!", "請先登入", "error");
                    setTimeout(function () {
                        location.href = '' + path + '/front-end/mem/login.jsp'
                    }, 3000);
                }
            })
    }

    //點擊直接購買
    function car(e) {
        let path = $('#path').val();
        let prodID = $('#prodID').val();
        fetch('' + path + '/ProdServlet.do?prodID=' + prodID + '&action=add')
            .then(response => response.text())
            .then(myjson => {
                if (myjson === 'success') {
                    location.href = '' + path + '/front-end/prod/car.jsp'
                } else {
                    swal("購買失敗!", "請先登入", "error");
                    setTimeout(function () {
                        location.href = '' + path + '/front-end/prod/shop.jsp'
                    }, 3000);
                }
            })
    }

    //   Toggle Table of content
    toggleTOC();
</script>
</body>
</html>
