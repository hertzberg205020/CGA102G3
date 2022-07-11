<%--
  Created by IntelliJ IDEA.
  User: Tibame_T14
  Date: 2022/7/4
  Time: 上午 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
    crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/front-end/order/js/order2.js"></script>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
    <style>
        .mytable tr td {
            /* for IE */
            text-overflow: ellipsis;
            /* for Firefox,mozilla */
            -moz-text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            text-align: left
        }
    </style>
</head>
<body>
<%@include file="/static/template/front_layout_header.jsp" %>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<!-- main -->
<main class="container">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent">
            <li class="breadcrumb-item"><a href="#" class="text-success bg-transparent">首頁</a></li>
            <li class="breadcrumb-item active text-dark" aria-current="page">訂單管理</li>
        </ol>
    </nav>

    <hr>

    <div class="row p-3 mb-3" style="border: 1.5px solid lightgray; background-color: lightgray">
        <div class="col-2 offset-1 text-center font-weight-bold" style="vertical-align:middle;">查詢條件:</div>
        <div class="col-6">
            <input type="radio" id="contactChoice1" name="contact" value="email">
            <label class="mr-2" for="contactChoice1">一個月內訂單</label>

            <input type="radio" id="contactChoice2" name="contact" value="phone">
            <label class="mr-2" for="contactChoice2">六個月內訂單</label>

            <input type="radio" id="contactChoice3" name="contact" value="phone">
            <label class="mr-2" for="contactChoice3">已取消訂單</label>
        </div>
        <div class="col-2">
            <button class="btn btn-sm btn-dark">查詢</button>
        </div>
    </div>
    <table id="myTable" class="mt-5 table table-bordered text-center mx-auto">
        <thead class="table-dark">
        <tr>
            <th>訂單編號</th>
            <th>訂購時間</th>
            <th>付款方式</th>
            <th>訂單金額</th>
            <th>訂單狀態</th>
            <th>物流狀態</th>
            <th>明細</th>
            <th>取消</th>
            <th>完成</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    <div class="modal fade" id="edit" data-backdrop="static" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">產品明細</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table width='100%' cellspacing='0' cellpadding='0' class='mytable table' style='table-layout: fixed'>
                        <thead>
                        <tr class="table-warning font-weight-bold">
                            <td>書名</td>
                            <td>照片</td>
                            <td>數量</td>
                            <td>單價</td>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="/static/template/front_layout_footer.jsp" %>
<a href=""></a>
</body>
</html>
