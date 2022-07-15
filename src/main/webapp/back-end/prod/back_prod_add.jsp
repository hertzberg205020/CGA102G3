<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cga102g3.web.prod.service.*" %>
<%@ page pageEncoding="UTF-8" %>

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
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.css"/>
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
    <!--    基礎版面樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
    <title>後台-新增一般商品</title>

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
    <h1>新增一般商品</h1>
</header>
<%@include file="/static/template/back_layout_aside.jsp" %>
<main class="main">
    <div id="table_container" class=""><br>
        <form class="align-items-start form-row justify-content-center" method="post"
              enctype="multipart/form-data" action="${pageContext.request.contextPath}/back-end/prod/prod.do">

            <div class="input-group mb-3 col-7">
                <div class="input-group-prepend">
                    <span class="input-group-text">書目編號</span>
                </div>
                <input type="number" id="book_ID" name="bookID" class="form-control"
                       value="${param.bookID}" style="border-radius:0px 5px 5px 0px">
                <p style="padding-left:1px; color: red;">${errorMsgs.bookID}</p>
            </div>
            <br>
            <div class="col-7" style="justify-content: left; color: red; margin-top:-17px; margin-left:35px">
                <p>＊請注意：書目編號確認後便無法更動</p>
            </div>

            <div class="input-group mb-3 col-7">
                <div class="input-group-prepend">
                    <span class="input-group-text">商品定價</span>
                </div>
                <input type="number" id="price" name="price" class="form-control"
                       value="${param.price}" style="border-radius:0px 5px 5px 0px">
                <p style="padding-left:1px; color: red;">${errorMsgs.price}</p>
            </div>

            <div class="input-group mb-3 col-7">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect01">商品狀態</label>
                </div>
                <%-- 	<jsp:useBean id="prodSvc" scope="request" class="com.cga102g3.web.prod.model.ProdService"/> --%>
                <select class="custom-select" id="status" name="status">
                    <option value="0" ${(param.status==prodVO.status)? 'selected':'' }>下架
                    <option value="1" ${(param.status==prodVO.status)? 'selected':'' }>上架
                </select>
            </div>

            <div class="col-7" style="justify-content: space-between; display: flex;">
                <button class="btn btn-danger  ml-right mr-1"
                        onclick="location.href='${pageContext.request.contextPath}/back-end/prod/back_prod_listAll.jsp'"
                        type="button">取消新增
                </button>

                <button class="btn btn-primary ml-right mr-1" type="submit"
                        id="submit2" name="action" value="insert">新增商品
                </button>
            </div>
        </form>
        <br>
    </div>
</main>

<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<script src="${pageContext.request.contextPath}/back-end/prod/js/back_prod_add.js"></script>

</body>
</html>
