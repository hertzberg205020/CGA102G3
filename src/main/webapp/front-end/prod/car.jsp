<%--
  Created by IntelliJ IDEA.
  User: Tibame_T14
  Date: 2022/6/20
  Time: 上午 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
    <title>商城首頁</title>
    <style>
        .table {
            width: 960px;
            margin: auto;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/front-end/prod/js/car.js"></script>
</head>

<body>
<%@include file="/static/template/front_layout_header.jsp" %>
<main>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="all">
                    <label class="form-check-label" for="all">
                        All Select
                    </label>
                </div>
            </th>
            <th scope="col">Product</th>
            <th scope="col">Price</th>
            <th scope="col">Number</th>
            <th scope="col">total</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
</main>
<img class="god" src="${pageContext.request.contextPath}/static/images/Godbless.png" height="500px;" width="500px;"><br>
<img class="cs" src="${pageContext.request.contextPath}/static/images/cs.png" height="90px;" width="90px;" href="#">
<%@include file="/static/template/front_layout_footer.jsp" %>
<script src="${pageContext.request.contextPath}/front-end/prod/js/car2.js"></script>

</body>
</html>
