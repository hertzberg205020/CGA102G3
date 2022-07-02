<%--
  Created by IntelliJ IDEA.
  User: u8360
  Date: 2022/7/1
  Time: 下午 08:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <!-- 不要讀快取 -->
    <meta charset="UTF-8">
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="0">
    <!-- 眼睛圖示 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <!-- dataTable -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
    <title>bid_prod_view</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/bid/css/bid_order.css">
</head>
<body>
<!-- header -->
<%@include file="/static/template/front_layout_header.jsp" %>

<!-- main -->
<main class="container">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent">
            <li class="breadcrumb-item"><a href="#" class="text-success bg-transparent">首頁</a></li>
            <li class="breadcrumb-item active text-dark" aria-current="page">競拍訂單管理</li>
        </ol>
    </nav>

    <hr >

<%--    <div class="row p-3 mb-3" style="border: 1.5px solid lightgray; background-color: lightgray">--%>
<%--        <div class="col-2 offset-1 text-center font-weight-bold" style="vertical-align:middle;">查詢條件:</div>--%>
<%--        <div class="col-6">--%>
<%--            <input type="radio" id="contactChoice1"--%>
<%--                   name="contact" value="email">--%>
<%--            <label class="mr-2" for="contactChoice1">一個月內訂單</label>--%>

<%--            <input type="radio" id="contactChoice2"--%>
<%--                   name="contact" value="phone">--%>
<%--            <label class="mr-2" for="contactChoice2">六個月內訂單</label>--%>

<%--            <input type="radio" id="contactChoice3"--%>
<%--                   name="contact" value="phone">--%>
<%--            <label class="mr-2" for="contactChoice3">已取消訂單</label>--%>
<%--        </div>--%>
<%--        <div class="col-2">--%>
<%--            <button class="btn btn-sm btn-dark">查詢</button>--%>
<%--        </div>--%>
<%--    </div>--%>
    <input type="hidden" id="prefix" value="${pageContext.request.contextPath}">
    <%--  測試用  --%>
    <input type="hidden" id="mbrID" value="5">
    <%--  測試用  --%>
    <table id="myTable" class="mt-5 table table-bordered text-center mx-auto">
        <thead class="table-dark">
        <tr>
            <th>競標編號</th>
            <th>得標時間</th>
            <th>競標金額</th>
            <th>商品名稱</th>
            <th>運輸狀態</th>
            <th>貨到確認</th>
        </tr>
        </thead>
        <tbody>
<%--        <tr>--%>
<%--            <th scope="row">1</th>--%>
<%--            <td>2022-04-02 9:00:00</td>--%>
<%--            <td>300</td>--%>
<%--            <td class="bookTitle">test</td>--%>
<%--            <td>配送中</td>--%>
<%--            <td><button class="btn btn-sm chk_btn">貨到確認</button></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th colspan="6" style="color: #e4606d">未有任何競標訂單</th>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th scope="row">1</th>--%>
<%--            <td>2022-04-02 9:00:00</td>--%>
<%--            <td>300</td>--%>
<%--            <td >Java</td>--%>
<%--            <td>配送中</td>--%>
<%--            <td><button class="btn btn-sm chk_btn">貨到確認</button></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th scope="row">1</th>--%>
<%--            <td>2022-04-02 9:00:00</td>--%>
<%--            <td>300</td>--%>
<%--            <td>Java</td>--%>
<%--            <td>配送中</td>--%>
<%--            <td><button class="btn btn-sm chk_btn">貨到確認</button></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th scope="row">1</th>--%>
<%--            <td>2022-04-02 9:00:00</td>--%>
<%--            <td>300</td>--%>
<%--            <td>Java</td>--%>
<%--            <td>配送中</td>--%>
<%--            <td><button class="btn btn-sm chk_btn">貨到確認</button></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th scope="row">1</th>--%>
<%--            <td>2022-04-02 9:00:00</td>--%>
<%--            <td>300</td>--%>
<%--            <td>Java</td>--%>
<%--            <td>配送中</td>--%>
<%--            <td><button class="btn btn-sm chk_btn">貨到確認</button></td>--%>
<%--        </tr>--%>

        </tbody>
    </table>

    <!-- <img class="god" src="images/Godbless.png" height="500px;" width="500px;"></img><br> -->
    <img class="cs" src="${pageContext.request.contextPath}/static/images/cs.png" height="90px;" width="90px;" href="#">
</main>

<!-- footer -->
<%@include file="/static/template/front_layout_footer.jsp" %>

<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- dataTable JS-->
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<!-- template JS-->
<script src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>
<!-- 自身的JS -->
<script src="${pageContext.request.contextPath}/front-end/bid/js/bid_order.js"></script>
</body>
</html>

