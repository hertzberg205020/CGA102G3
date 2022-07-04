<%--
  Created by IntelliJ IDEA.
  User: Tibame_T14
  Date: 2022/6/22
  Time: 下午 06:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
    <title>Title</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/front-end/prod/js/order.js"></script>
    <style>
        table td{
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="/static/template/front_layout_header.jsp" %>
<div class="container p-5">
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
    <table class="table" >
        <thead>
        <!-- <td colspan="1" class="table-active"></td> -->
        <th colspan="5" class="table-success text-center" style="font-size: 20px;">訂單明細</th>
        </thead>
        <thead>
        <th>書名</th>
        <th>照片</th>
        <th class="text-center">單價</th>
        <th class="text-center">數量</th>
        <th>總價</th>
        </thead>
        <tbody>


        <tr style="border-bottom: 1px solid black;">
            <th colspan="3" class="table-active" style="border-bottom: 1px solid black;"></th>
            <th style="border-bottom: 1px solid black;" class="table-active text-center pl-3">總金額</th>
            <th style="border-bottom: 1px solid black;"class="table-active" id="total"></th>
        </tr>

        <tr >
            <th colspan="5" class="table-info text-center" style="font-size: 20px;">付款資訊</th>
        </tr>
        <tr>
            <td class="text-left">付款人 : ${param.payerName}</td>
            <td class="text-left">聯絡資訊 : ${param.payerPhone}</td>
            <td colspan="3"></td>
        </tr>
        <tr>
            <td class="text-left">付款方式 : ${param.method}</td>
            <td colspan="4"></td>
        </tr>
        <tr>
            <th colspan="5" class="table-primary text-center" style="font-size: 20px;">收貨人資訊</th>
        </tr>
        <tr>
            <td class="text-left">付款人 : ${param.receiverName} </td>
            <td class="text-left">聯絡資訊 : ${param.receiverPhone}</td>
            <td colspan="3"></td>
        </tr>
        <tr>
            <td class="text-left" style="border-bottom: 1px solid gray;">地址 : ${param.city}${param.cityarea}${param.street}</td>
            <td colspan="4" style="border-bottom: 1px solid gray;"></td>
        </tr>
        <tr>
            <td colspan="5"><button type="button" class="btn btn-info" style="margin-left: 45%;" >返回首頁</button></td>
        </tr>
        </tbody>
    </table>
</div>

<%@include file="/static/template/front_layout_footer.jsp" %>
<script>
    $('button').click(function () {
        location.replace('https://www.google.com.tw/?hl=zh_TW')
    })
</script>
</body>
</html>
