<%--
  Created by IntelliJ IDEA.
  User: Tibame_T14
  Date: 2022/6/30
  Time: 下午 05:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- bootstrap-icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <title>管理後臺 | 競標商品管理</title>
    <!-- 側邊攔CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
    <!-- 競標商品管理CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back-end/bid/css/bidprod_back_page.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/back-end/sale/js/sale.js"></script>
    <style>
        .detail{
            display: block;
        }
    </style>
</head>

<body>
<header class="header">
    <h1 class="text-center" style="font-size: 32px; font-weight: 600; color: rgb(82, 136, 138)">促銷專案管理</h1>
</header>
<%@include file="/static/template/back_layout_aside.jsp"%>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<main class="main">
    <div class="container">
        <div class="upper-section">
            <div class="row mt-3">

                <div class="search-by-id col-4">
                    <strong>查詢</strong> - 促銷專案編號
                </div>
                <div class="search-by-state col-4">
                    <strong>新增</strong> - 促銷專案配置
                </div>
            </div>

            <div class="row mt-2 mb-3">
                <div class="col-3">
                    <input type="text" name="bid_id" class="form-control" placeholder="輸入促銷專案編號查詢">
                </div>
                <div class="col-1">
                    <button  class="btn btn-outline-secondary" id="search">
                        <i class="bi bi-search"></i>
                    </button>
                </div>
                <div class="d-flex mb-2">
                    <a class="btn btn-dark"
                       href="${pageContext.request.contextPath}/back-end/sale/sale_add.jsp"
                       target="_blank"> <strong><i class="bi bi-plus-circle"></i> 新增促銷專案配置 </strong>
                    </a>
                </div>
            </div>
        </div>

        <div class="d-flex mt-4">
            <span class="mb-2" style="font-size: 22px;">促銷專案列表</span>
        </div>
        <table class="table table-sm mt-2 mb-3" style="font-size: 14px;">
            <thead>
            <tr class="table-primary">
                <th>促銷專案編號</th>
                <th>開始時間</th>
                <th>結束時間</th>
                <th class="text-left">明細</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
        </div>
</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/back-end/sale/js/sale2.js"></script>
</body>
</html>
