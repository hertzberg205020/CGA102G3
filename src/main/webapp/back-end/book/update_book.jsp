<%--
  Created by IntelliJ IDEA.
  User: u8360
  Date: 2022/6/17
  Time: 下午 05:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <!-- datetimepicker樣式 -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.css"/>
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
    <!--    基礎版面樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
    <!--    後台書籍管理添加樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back-end/book/css/back_book_update.css">

    <title>管理後臺</title>
</head>
<body>
<header class="header">
    <h1>這邊再麻煩大家寫自己的項目名稱</h1>
</header>
<%@include file="/static/template/back_layout_aside.jsp" %>
<main class="main">
    <div id="table_container" class="">
        <%--        回書籍查詢頁面--%>

        <form class="align-items-start form-row">
            <fieldset class="form-row">
                <input type="hidden" name="action" value="update">
                <input type="hidden" id="preCategory" value="${book.categoryName}">
                <input type="hidden" id="prefix" value="${pageContext.request.contextPath}">
                <input id="prePubdate" name="pubdate" type="hidden" value="${book.pubdate}"/>
                <%--            <input type="hidden" name="action" value="${book.bookID}">--%>

                <div class="form-group col-12 row" style="width: 100%">
                    <label for="bookID" class="col-2 col-form-label">書目編號</label>
                    <input type="text" id="bookID" name="bookID" value="${book.bookID}"
                           class="col-8 form-control-plaintext" readonly>
                    <button type="button" class="btn btn-outline-secondary ml-auto"
                            onclick="javascript:location.href='${pageContext.request.contextPath}/back-end/book/back_book_view.jsp'">
                        返回查詢
                    </button>

                </div>


                <div class="form-group col-6">
                    <label for="title">書名</label>
                    <input type="text" id="title" name="title" class="form-control is-valid" placeholder="請輸入書名"
                           required
                           value="${book.title}">
                    <div class="invalid-feedback">必提項目</div>
                    <div class="valid-feedback"></div>
                </div>
                <div class="form-group col-6">
                    <label for="ISBN">ISBN-13</label>
                    <input type="text" id="ISBN" name="ISBN" class="form-control is-valid" placeholder="ISBN-13"
                           required
                           value="${book.ISBN}">
                    <div class="invalid-feedback">必提項目</div>
                    <div class="valid-feedback"></div>
                </div>
                <div class="form-group col-4">
                    <label for="book_category">書籍種類</label>
                    <select id="book_category" name="categoryName" class="form-control">
                    </select>
                </div>
                <div class="form-group col-4">
                    <label for="edition">版次</label>
                    <input type="number" id="edition" name="edition" class="form-control is-valid" placeholder="請輸入版次"
                           value="${book.edition}" min="1" max="50" step="1" required>
                    <div class="invalid-feedback"></div>
                    <div class="valid-feedback">有效版次</div>
                </div>
                <div class="form-group col-4">
                    <label for="pages">頁數</label>
                    <input type="number" id="pages" name="pages" class="form-control" placeholder="請輸入頁數"
                           value="${book.pages}">
                </div>
                <%--            <div class="form-group w-100"></div>--%>

                <div class="form-group col-6">
                    <label for="author">書籍作者</label>
                    <input type="text" class="form-control is-valid" id="author" name="author" placeholder="請輸入作者"
                           required
                           value="${book.author}">
                    <div class="invalid-feedback">必填項目</div>
                    <div class="valid-feedback"></div>
                </div>
                <div class="form-group col-6">
                    <label for="translator">譯者</label>
                    <input type="text" class="form-control" id="translator" name="translator" placeholder="請輸入譯者"
                           value="${book.translator}">
                </div>
                <div class="form-group col-6">
                    <label for="publisher">出版商</label>
                    <input type="text" class="form-control" id="publisher" name="publisher" placeholder="請輸出版商"
                           value="${book.publisher}">
                </div>
                <div class="form-group col-6">
                    <label class="control-label" for="pubdate">出版日期</label>
                    <%--                <input class="form-control" id="pubDate" name="pubdate" placeholder="YYYY/MM/DD" type="date" max="9999-12-31"/>--%>
                    <input class="form-control" id="pubdate" name="pubdate" type="text"/>
                </div>

                <div class="form-group col-12">
                    <label for="summary">簡介</label>
                    <textarea class="form-control" id="summary" name="summary" rows="8"
                              value="">${book.summary}</textarea>
                </div>

                <div class="form-group col-12">
                    <label for="table_content">章節目錄</label>
                    <textarea class="form-control" id="table_content" name="tableContent"
                              rows="8">${book.tableContent}</textarea>
                </div>

                <div class="form-group col-12">
                    <label>照片上傳</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">URL</span>
                        </div>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="uploadImg" name="uploadImg">
                            <label for="uploadImg" class="custom-file-label">選擇圖片</label>
                        </div>
                    </div>
                </div>

                <div class="form-group col-12 justify-content-center row" id="img_container">
                    <img src="${pageContext.request.contextPath}/static/images/books/${book.bookID}.jpg" id="fileImg"
                         class="">
                    <input type="hidden" value="${pageContext.request.getRealPath("/static/images/books/42.jpg")}">
                </div>

                <button class="btn btn-primary ml-auto mr-1" type="button" id="submit_btn">Submit form</button>
            </fieldset>
        </form>
    </div>

</main>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- datetimepicker-->
<%--<script src="${pageContext.request.contextPath}/datetimepicker/jquery.js"></script>--%>
<script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<!-- 模板的JS -->
<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<!-- 自身的JS -->
<script src="${pageContext.request.contextPath}/back-end/book/js/back_book_update.js"></script>
</body>
</html>
