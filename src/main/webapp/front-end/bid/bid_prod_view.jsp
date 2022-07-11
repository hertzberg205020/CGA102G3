<%--
  Created by IntelliJ IDEA.
  User: u8360
  Date: 2022/6/29
  Time: 上午 10:27
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
    <!-- 眼睛圖示 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <title>bid_prod_view</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/bid/css/bid_prod_view.css">
</head>
<body>
<!-- header -->
<%@include file="/static/template/front_layout_header.jsp" %>

<%--MAIN CONTENT--%>
<main class="main" style="width: 1200px">
    <div class="table_container">
        <input type="hidden" value="${pageContext.request.contextPath}" id="prefix">
        <div class="container">
            <div class="row justify-content-between">
                <div class="input-group col-6 mb-3">
                </div>
                <div class="input-group col-6 mb-3">
                    <input type="search" id="keyword_input" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
                    <button type="button" class="btn btn-outline-info ml-2" id="keyword_input_btn">search</button>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <table class="table table-bordered text-center table-hover">
                        <thead class="table-success">
                        <tr>
                            <th scope="col" class="col-1">競標編號</th>
                            <th scope="col" class="col-2">ISBN-13</th>
                            <th scope="col" class="col-1">版次</th>
                            <th scope="col" class="col-4">書名</th>
                            <th scope="col" class="col-2">結束時間</th>
                            <th scope="col" class="col-1">查看詳情</th>
                        </tr>
                        </thead>

                        <tbody>
<%--                            <tr>--%>
<%--                                <th scope="row">1</th>--%>
<%--                                <td>9787121408564</td>--%>
<%--                                <td>1</td>--%>
<%--                                <td>深入淺出java</td>--%>
<%--                                <td>C</td>--%>
<%--                                <td>--%>
<%--                                    <button type="button" class="btn btn-primary"--%>
<%--                                            onclick="javascript:location.href=''">--%>
<%--                                        <i class="far fa-eye"></i>--%>
<%--                                    </button>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row justify-content-around mt-2">
                <button type="button" class="btn btn-outline-dark" id="prePageBtn" disabled>上一頁</button>
                <button type="button" class="btn btn-outline-dark" id="nextPageBtn">下一頁</button>
            </div>
        </div>
    </div>
</main>

<!-- footer -->
<%@include file="/static/template/front_layout_footer.jsp" %>

<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<!-- template JS-->
<script src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>
<!-- 自身的JS -->
<script src="${pageContext.request.contextPath}/front-end/bid/js/bid_prod_view.js"></script>
</body>
</html>
