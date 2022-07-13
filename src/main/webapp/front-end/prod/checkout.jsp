<%--
  Created by IntelliJ IDEA.
  User: Tibame_T14
  Date: 2022/6/24
  Time: 下午 03:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <title>結帳首頁</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/prod/css/checkout.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/front-end/prod/js/jquery.twzipcode.js"></script>
    <script src="${pageContext.request.contextPath}/front-end/prod/js/checkout.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <style>
        input.cardxxx {
            width: 42px;
        }
    </style>
</head>

<body>
<%@include file="/static/template/front_layout_header.jsp" %>
<main>
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
    <form action="${pageContext.request.contextPath}/ProdServlet.do">
        <div class="container p-5">
            <table class="table table-striped table-hover">
                <thead>
                <th colspan="2" class="table-success text-center" style="font-size: 20px;">消費金額</th>
                </thead>
                <tbody>
                <tr>
                    <td colspan="2">本次總計 $ <span id="total" style="color: red; font-size: 25px;"></span></td>
                </tr>
                <tr>
                    <th colspan="2" class="text-center table-info" style="font-size: 20px;">付款資訊</th>
                </tr>
                <tr>
                    <td>請輸入姓名 : <input type="text" placeholder="輸入姓名" name="payerName" value="${param.payerName}"><font color="red">${errorMsgs.payerName}</font></td>
                    <td class="text-left">請輸入手機 : <input type="text" placeholder="輸入手機號碼" name="payerPhone" value="${param.payerPhone}"><font color="red">${errorMsgs.payerPhone}</font></td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="method" id="creditcard" value="0" ><label
                            for="creditcard">信用卡</label>
                        <input type="radio" name="method" id="moneybag" value="1"><label
                            for="moneybag">TibaNi錢包</label>
                        <input type="radio" name="method" id="delivery" value="2" checked><label
                            for="delivery" >貨到付款</label>
                        <font color="red">${errorMsgs.method}</font>
                    </td>
                    <td colspan="1" class="text-left" id="xxx"></td>
                </tr>
                <tr>
                    <th colspan="2" class="text-center table-primary" style="font-size: 20px;">收貨人資訊</th>
                </tr>
                <tr>
                    <td>請輸入姓名 : <input type="text" placeholder="輸入姓名" name="receiverName" value="${param.receiverName}"><font color="red">${errorMsgs.receiverName}</font></td>
                    <td class="text-left">請輸入手機 : <input type="text" placeholder="輸入手機號碼" name="receiverPhone" value="${param.receiverPhone}"><font color="red">${errorMsgs.receiverPhone}</font></td>
                </tr>
                    <td>
                        <div class="city1" style="width:120%;">
                            <label for="twzipcode">通訊地址
                                <div id="twzipcode"></div>
                            </label>
                            <input type="text" id="street" name="street" maxlength="30" placeholder="詳細地址" value="${param.street}"><font color="red">${errorMsgs.street}</font>
                        </div>
                    </td>
                    <td colspan="1"></td>
                </tr>
                </tbody>
            </table>
            <input type="hidden" name="action" value="order">
            <input type="submit" value="確認送出" class="btn btn-warning" style="margin-left: 45%;" id="push">
        </div>
    </form>
</main>
<%--<img class="cs" src="${pageContext.request.contextPath}/static/images/cs.png" height="90px;" width="90px;" href="#">--%>
<%@include file="/static/template/front_layout_footer.jsp" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/front-end/prod/js/checkout2.js"></script>
</body>
</html>

