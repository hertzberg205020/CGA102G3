<%--
  Created by IntelliJ IDEA.
  User: u8360
  Date: 2022/6/25
  Time: 上午 09:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <title>bid_prod_detail</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/bid/css/bid_prod_detail.css">
</head>
<body>
<!-- header -->
<%@include file="/static/template/front_layout_header.jsp" %>
<%--MAIN CONTENT--%>
<main class="container" style="margin-top: 15px !important;">

    <!-- BREADCRUMB -->
    <%--    <nav aria-label="breadcrumb">--%>
    <%--        <ol class="breadcrumb bg-transparent">--%>
    <%--            <li class="breadcrumb-item"><a href="#" class="text-success bg-transparent">首頁</a></li>--%>
    <%--            <li class="breadcrumb-item "><a href="#" class="text-success bg-transparent">二手競標</a></li>--%>
    <%--            <li class="breadcrumb-item"><a href="#" class="text-success bg-transparent">Java</a></li>--%>
    <%--            <li class="breadcrumb-item active text-dark" aria-current="page">Java程式設計入門</li>--%>
    <%--        </ol>--%>
    <%--    </nav>--%>

    <div class="row justify-content-end">
        <div class="input-group mb-3">
            <button type="button" class="btn btn-outline-secondary ml-auto"
                    onclick="javascript:location.href='${pageContext.request.contextPath}/front-end/bid/bid_prod_view.jsp'">
                返回查詢
            </button>
        </div>
    </div>


    <!-- INFORMATION SECTION -->
    <div class="section-info row mb-5">
        <!-- Book Picture -->
        <div class="col-md mt-2">
            <!-- click to enlarge picture -->
            <img src="${pageContext.request.contextPath}/static/images/books/${book.bookID}.jpg" width="90%" id="pic"
                 data-toggle="modal" data-target="#Modal-1" border="1px solid black">
            <!-- model -->
            <div class="modal fade" id="Modal-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close mb-2" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true" style="font-size: 35px;">&times;</span>
                            </button>
                            <div class="pic-enlarge">
                                <img src='${pageContext.request.contextPath}/static/images/books/${book.bookID}.jpg'
                                     width="100%">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Book Detail Information -->
        <div class="col-md mt-2">
            <input id="bidID" type="hidden" name="bidID" value="${bidActivity.bidID}">
            <%--            結束時間戳記--%>
            <input id="bidEnd" type="hidden" value="${bidActivity.bidEnd}">
            <h3 class="title ml-3">
                ${book.title}
                <%--                <span style="font-size: 20px; color:slategrey;">(二手書)</span>--%>
            </h3>
            <div class="author m-3">作者: ${book.author}</div>
            <div class="general ml-3 mb-4 mr-3 ">
                <div class="publisher mt-2 mb-2 mt-3">出版社: ${book.publisher}</div>
                <div class="pubdate mb-2 mt-3">出版日期: <fmt:formatDate value="${book.pubdate}"
                                                                     pattern="yyyy-MM-dd"/></div>
                <div class="direct-price mb-2 mt-3">直購價: <span style="color:goldenrod; font-weight:bold;"
                                                               id="bidDirectPrice">${bidActivity.bidDirectPrice}</span>元
                </div>
                <div class="direct-price mb-2 mt-3">底價: <span style="color:goldenrod; font-weight:bold;"
                                                              id="bidStartPrice">${bidActivity.startPrice}</span>元
                </div>
                <%--                <div class="cur-price mb-2 mt-3">目前出價: <span style="font-size: 24px; color: royalblue; font-weight: 500;">300</span>元</div>--%>
            </div>
            <div class="general ml-3 mb-4 mr-3 ">
                <div style="font-size: 1.2rem; color:slategrey"><i class="bi bi-pencil-square"></i> 商品當前價格</div>
                <div class="cur-price mb-2 mt-3"><span style="font-size: 24px; color: royalblue; font-weight: 500;"
                                                       id="curBidPrice"></span>元
                </div>
                <div class="cur-price mb-2 mt-3"> 出價會員編號: <span
                        style="font-size: 24px; color: royalblue; font-weight: 500;" id="curWinnerID"></span></div>
            </div>
            <%--            <div class="seller-info ml-3 mb-5 mr-3">--%>
            <%--                <div class="seller mt-2 mb-2">賣家: David</div>--%>
            <%--                <div class="condition mb-2">書況: 良好，無畫線註記</div>--%>
            <%--            </div>--%>

            <%--            <div class="other-options ml-3 mr-3">--%>
            <%--                其他版本: <span class="p-2 rounded-lg"><a href="#" class="new-book">購買新書</a></span>--%>
            <%--            </div>--%>

        </div>
        <!-- Buying Options -->
        <div class="col-md ml-2">
            <div class="bid">
                <div style="font-size: 1.2rem; color:slategrey"><i class="bi bi-pencil-square"></i> 參與競標</div>

                <form class="form-inline">
                    <div>
                        <input class="form-control mr-1" type="number" id="bidPrice" min="1" step="10"
                               placeholder="請輸入金額">
                        <div class="invalid-feedback" id="warn"></div>
                        <div class="valid-feedback"></div>
                    </div>
                    <div class="w-100"></div>
                    <button class="form-control btn btn-warning mt-2" id="offerPriceBtn">我要出價 <i class="bi bi-coin"></i>
                    </button>
                </form>

                <%--                測試時才使用，獲取session，並在session置入所輸入的會員mbrID--%>
                <form class="form-inline">
                    <input class="form-control" type="number" id="testMbrID" placeholder="請輸入測試用mbrID">
                    <button class="btn btn-warning mt-2" id="testMbrIDBtn">輸入測試用mbrID</button>
                </form>
                <%--                以上為測試用--%>

                <div class="bid-time mt-2">
                    <i class="bi-alarm" style="font-size: 1.2rem; color: grey;"></i>
                    <%--                    <span>2022/07/15 0:00:00 結束</span>--%>
                    <span id="timerCounter"></span>
                </div>
            </div>
            <hr>
            <div class="btn-direct-buy mt-5 text-right">
                <span class="align-middle text-danger" id="directGetWarn"></span>
                <%--                <span class="align-middle">數量 = 1</span>--%>
                <button type="button" class="btn btn-outline-info btn-lg ml-2" id="directGetBtn"><i
                        class="bi bi-bag-heart-fill"></i> 直接購買
                </button>
            </div>
        </div>
    </div>


    <!-- BOOK SUMMERY SECTION -->
    <hr data-content="內容簡介" class="hr-text">
    <div class="section-intro row p-3">
        <div class="content-summary col">
            <%--            <p>大量範例＋實作練習＋遊戲專案, 密集式範例學習最有效！<br>--%>
            <%--                主題最完整！保證紮穩物件導向程式設計基礎！<br>--%>
            <%--            </p>--%>
            <%--            <p>--%>
            <%--                Java 是目前業界使用最廣泛的程式語言，學習 Java 可說是投資報酬率最高的選擇！作者任教程式設計 30 年，深知學習程式設計的困境，本書不會像坊間程式語言學習書籍一樣，花費大量的篇幅在瑣碎的語法細節，而是介紹關鍵必要的語法，透過大量的範例演練、實作練習，讓初學者從零開始製作繪圖程式、經典電腦遊戲…等範例程式，快速窺見程式設計的奧秘與精髓！--%>
            <%--            </p>--%>
            <%--            <ul>--%>
            <%--                <li>● 關鍵語法與物件導向觀念解說</li>--%>
            <%--                <li>● 主題最完整：視窗程式設計、影像處理、動畫製作、物件導向、檔案輸出入、公用類別庫</li>--%>
            <%--                <li>● 專案實作：經典撲克牌遊戲、繪圖程式、樂透開獎程式自己作, 學習不枯燥</li>--%>
            <%--                <li>● 以簡短範例代替多餘的文字敘述, 並在各主題適時安插自我練習, 以密集式範例學習加深您的學習效果</li>--%>
            <%--            </ul>--%>
            <p id="summary_container"></p>
            <div id="summary">
                ${book.summary}
            </div>
        </div>
    </div>

    <!-- TABLE OF CONTENT SECTION -->
    <hr data-content="目錄" class="hr-text">
    <div class="section-intro row p-3">
        <div class="table-of-content col" id="tableContent_container">
            <%--            <ul id="tableContent">--%>
            <%--                <li>第1章 概論</li>--%>
            <%--                <li>第2章 程式的編譯與執行</li>--%>
            <%--                <li>第3章 基本觀念</li>--%>
            <%--                <li>第4章 基本輸出入</li>--%>
            <%--                <li>第5章 決策敘述</li>--%>
            <%--                <li>第6章 迴圈結構</li>--%>
            <%--                <li>第7章 陣列</li>--%>
            <%--                <li>第8章 方法</li>--%>
            <%--                <li>第9章 類別</li>--%>
            <%--                <li>第10章 公用類別庫</li>--%>
            <%--                <li>第11章 例外處理</li>--%>
            <%--                <li>第12章 檔案</li>--%>
            <%--                <li>第13章 視窗程式設計</li>--%>
            <%--                <li>第14章 版面配置</li>--%>
            <%--                <li>第15章 Swing 元件</li>--%>
            <%--                <li>第16章 繪圖</li>--%>
            <%--                <li>第17章 專題製作</li>--%>
            <%--            </ul>--%>
            <div id="tableContent">
                ${book.tableContent}
            </div>
        </div>
    </div>

    <!-- BOOK REVIEW SECTION -->
    <%--    <hr data-content="書籍評論" class="hr-text">--%>
    <%--    <div class="section-review p-4">--%>
    <%--        <div class="review row">--%>
    <%--            <div class="col-md-3">--%>
    <%--                <p class="customer-name font-weight-bold">Ann</p>--%>
    <%--                <p class="review-date">2022-6-12</p>--%>
    <%--            </div>--%>
    <%--            <div class="col-md-9">--%>
    <%--                laborum natus eos hic ad veritatis quia, nulla exercitationem. Accusantium corrupti minus quasi, soluta id cumque!--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--        <hr>--%>

    <%--        <div class="review row">--%>
    <%--            <div class="col-md-3">--%>
    <%--                <p class="customer-name font-weight-bold">Brian</p>--%>
    <%--                <p class="review-date">2022-5-12</p>--%>
    <%--            </div>--%>
    <%--            <div class="col-md-9">--%>
    <%--                laborum natus eos hic ad veritatis quia, nulla exercitationem. Accusantium corrupti minus quasi, soluta id cumque!--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--        <hr>--%>

    <%--        <div class="review row">--%>
    <%--            <div class="col-md-3">--%>
    <%--                <p class="customer-name font-weight-bold">Cara</p>--%>
    <%--                <p class="review-date">2022-4-18</p>--%>
    <%--            </div>--%>
    <%--            <div class="col-md-9">--%>
    <%--                laborum natus eos hic ad veritatis quia, nulla exercitationem. Accusantium corrupti minus quasi, soluta id cumque!--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--        <hr>--%>

    <%--        <div class="review row">--%>
    <%--            <div class="col-md-3">--%>
    <%--                <p class="customer-name font-weight-bold">Daniel</p>--%>
    <%--                <p class="review-date">2022-3-15</p>--%>
    <%--            </div>--%>
    <%--            <div class="col-md-9">--%>
    <%--                laborum natus eos hic ad veritatis quia, nulla exercitationem. Accusantium corrupti minus quasi, soluta id cumque!--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--        <hr>--%>

    <%--        <div class="review row">--%>
    <%--            <div class="col-md-3">--%>
    <%--                <p class="customer-name font-weight-bold">Eason</p>--%>
    <%--                <p class="review-date">2022-2-18</p>--%>
    <%--            </div>--%>
    <%--            <div class="col-md-9">--%>
    <%--                laborum natus eos hic ad veritatis quia, nulla exercitationem. Accusantium corrupti minus quasi, soluta id cumque!--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <!-- BOOK RECOMMEND BY CATEGORY SECTION -->
    <%--    <hr data-content="相同類別推薦" class="hr-text">--%>
    <%--    <div class="section-others p-5">--%>
    <%--        <div class="card-deck pt-3">--%>
    <%--            <div class="card">--%>
    <%--                <img class="card-img-top" src="${pageContext.request.contextPath}/static/images/4.jpg" alt="Card image cap">--%>
    <%--                <div class="card-body"><a href="#"> Java 最強入門邁向頂尖高手之路: 王者歸來 </a></div>--%>
    <%--            </div>--%>
    <%--            <div class="card">--%>
    <%--                <img class="card-img-top" src="${pageContext.request.contextPath}/static/images/5.jpg" alt="Card image cap">--%>
    <%--                <div class="card-body"> <a href="#"> Java 7 教學手冊 第五版</a> </div>--%>
    <%--            </div>--%>
    <%--            <div class="card">--%>
    <%--                <img class="card-img-top" src="${pageContext.request.contextPath}/static/images/6.jpg" alt="Card image cap">--%>
    <%--                <div class="card-body"> <a href="#"> 最新 Java 程式語言 修訂第七版 </a> </div>--%>
    <%--            </div>--%>
    <%--            <div class="card">--%>
    <%--                <img class="card-img-top" src="${pageContext.request.contextPath}/static/images/1.jpg" alt="Card image cap">--%>
    <%--                <div class="card-body"> <a href="#">深入淺出 Java 程式設計 </a> </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--        <div class="read-more text-right"><a href="#">查看更多...</a></div>--%>
    <%--        <img class="god" src="${pageContext.request.contextPath}/static/images/Godbless.png" height="500px;" width="500px;"><br>--%>
    <%--    </div>--%>

    <img class="cs" src="${pageContext.request.contextPath}/static/images/cs.png" height="90px;" width="90px;" href="#">
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
<script src="${pageContext.request.contextPath}/front-end/bid/js/bid_prod_detail.js"></script>
</body>
</html>
