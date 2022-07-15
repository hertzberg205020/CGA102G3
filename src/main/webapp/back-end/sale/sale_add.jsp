<%--
  Created by IntelliJ IDEA.
  User: Tibame_T14
  Date: 2022/6/28
  Time: 下午 07:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back-end/sale/css/sale_back_add.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/datetimepicker/jquery.datetimepicker.css" />

    <title>管理後臺 | 促銷專案管理</title>
</head>

<body>
<header class="header">
    <h1 class="text-center" style="font-size: 32px; font-weight:600; color:rgb(82, 136, 138)">促銷專案管理</h1>
</header>
<%@include file="/static/template/back_layout_aside.jsp"%>

<main class="main">

    <div class="container p-5">
        <div class="mb-2  p-1" style="background-color: steelblue; width: 60px; border-radius: 5px;">
            <a class="text-light" style="text-decoration: none;" href="${pageContext.request.contextPath}/back-end/sale/sale.jsp">上一頁</a>
        </div>

        <div class="row mb-3">
            <div class="col-2">起始時間:</div>
            <div class="col-4">
                <input class="bid-input form-control" type="text" name="saleStart" value=""
                       id="date1">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-2">結束時間:</div>
            <div class="col-4">
                <input class="bid-input form-control" type="text" name="saleEnd" value=""
                       id="date2">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-2">書籍種類:</div>
            <div class="col-4">
                <select name="category">
                </select>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-2">折扣數:</div>
            <div class="col-4">
                <select name="discount">
                    <option value="2">2折</option>
                    <option value="3">3折</option>
                    <option value="4">4折</option>
                    <option value="5">5折</option>
                    <option value="6">6折</option>
                    <option value="7">7折</option>
                    <option value="8">8折</option>
                    <option value="9">9折</option>
                </select>
            </div>
        </div>
        <br>
        <input type="hidden" name="action" value="insert">
        <button class="btn btn-success" disabled><i class="bi bi-plus-circle"></i> 送出新增</button>

    </div>
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
</main>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.js"></script>
<script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script>
<script>
    window.onload = function (){
        console.log('111')
        fetch('${pageContext.request.contextPath}/SaleServlet.do?action=getCategory')
            .then(response => response.json())
            .then(function (myjosn){
                for (let i = 0; i < myjosn.length; i++){
                    let json = myjosn[i];
                    $('select[name=category]').append('<option value="'+json.categoryName+'">'+json.categoryName+'</option>')
                }
            })
    }
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/back-end/sale/js/add.js"></script>
</body>




</html>
