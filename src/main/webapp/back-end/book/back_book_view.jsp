<%--
  Created by IntelliJ IDEA.
  User: u8360
  Date: 2022/6/13
  Time: 下午 08:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8">
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
    <!--    基礎版面樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
    <!--    後台書籍管理添加樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back-end/book/css/back_book_view.css">

    <title>管理後臺</title>
</head>
<body>
<header class="header">
    <h1>這邊再麻煩大家寫自己的項目名稱</h1>
</header>
<%@include file="/static/template/back_layout_aside.jsp"%>
<main class="main">
    <div class="table_container">
        <input type="hidden" value="${pageContext.request.contextPath}" id="prefix">
        <div class="container">
<%--            <div class="row col-6 ml-auto mb-3">--%>
<%--                <input class="form-control" id="myInput" type="text" placeholder="Search..">--%>
<%--            </div>--%>

            <div class="row justify-content-between">
                <div class="input-group col-6 mb-3">
                    <button type="button" class="btn btn-outline-secondary ml-2" id="add_book_btn"
                            onclick="javascript:location.href='${pageContext.request.contextPath}/back-end/book/back_book_add.jsp'">
                        添加書籍
                    </button>
                </div>
                <div class="input-group col-6 mb-3">
                    <input type="search" id="keyword_input" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
                    <button type="button" class="btn btn-outline-info ml-2" id="search_btn">search</button>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <table class="table table-bordered text-center table-hover">
                        <thead class="table-success">
                        <tr>
                            <th scope="col" class="col-2">書籍編號</th>
                            <th scope="col" class="col-2">ISBN-13</th>
                            <th scope="col" class="col-1">版次</th>
                            <th scope="col" class="col-4">書名</th>
                            <th scope="col" class="col-1">分類</th>
                            <th scope="col" class="col-2">編輯/查看詳情</th>
                        </tr>
                        </thead>

                        <tbody>
<%--                        <tr>--%>
<%--                            <th scope="row">1</th>--%>
<%--                            <td>9787121408564</td>--%>
<%--                            <td>1</td>--%>
<%--                            <td>王利濤</td>--%>
<%--                            <td>C</td>--%>
<%--                            <td>--%>
<%--                                <button type="button" class="btn btn-primary"><i class="far fa-eye"></i></button>--%>
<%--                                <button type="button" class="btn btn-success"><i class="fas fa-edit"></i></button>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
                        </tbody>
                    </table>
                    <div id="modal_container"></div>
                </div>
            </div>

            <div class="row justify-content-around mt-2">
                <button type="button" class="btn btn-outline-dark" id="prePageBtn" disabled>上一頁</button>
                <button type="button" class="btn btn-outline-dark" id="nextPageBtn">下一頁</button>
            </div>
        </div>
    </div>
</main>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<!-- 模板的JS -->
<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<!-- 自身的JS -->
<script src="${pageContext.request.contextPath}/back-end/book/js/back_book_view.js"></script>
</body>
</html>

