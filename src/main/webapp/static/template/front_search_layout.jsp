<%--
  Created by IntelliJ IDEA.
  User: u8360
  Date: 2022/6/23
  Time: 下午 09:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <title>商城首頁</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_search_layout.css">
</head>

<body>
<%@include file="/static/template/front_layout_header.jsp" %>

<!-- main -->
<main class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent">
            <li class="breadcrumb-item"><a href="#" class="text-success bg-transparent">首頁</a></li>
            <li class="breadcrumb-item active text-dark" aria-current="page">一般商城</li>
        </ol>
    </nav>

    <div class="row mb-3">
        <div class="col">
            <div class="card">
                <img src="${pageContext.request.contextPath}/static/images/java-img4.png" height="280px" >
                <div class="card-img-overlay">
                    <h5 class="card-title text-light">Java 書籍特價中</h5>
                    <p class="card-text text-light">With supporting text below as a natural lead-in to additional content....</p>
                    <a href="#" class="btn btn-outline-light">See More</a>
                </div>
            </div>
        </div>
    </div>


    <div class="main-row row">
        <div class="side col-2 p-3">
            <div class="book-category mb-3"><i class="bi bi-card-list"></i> 書籍分類</div>



            <div class="category-item mb-2"><a href="#">組合語言</a></div>
            <div class="category-item mb-2"><a href="#">C</a></div>
            <div class="category-item mb-2"><a href="#">C++</a></div>
            <div class="category-item mb-2"><a href="#">Java</a></div>
            <div class="category-item mb-2"><a href="#">C#</a></div>
            <div class="category-item mb-2"><a href="#">Python</a></div>
            <div class="category-item mb-2"><a href="#">PHP</a></div>
            <div class="category-item mb-2"><a href="#">Kotlin</a></div>
            <div class="category-item mb-2"><a href="#">GO</a></div>
            <div class="category-item mb-2"><a href="#">SQL</a></div>
            <div class="category-item mb-2"><a href="#">Ruby</a></div>
            <div class="category-item mb-2"><a href="#">資安</a></div>
            <div class="sale-section mb-2 mt-3 animate__animated animate__pulse"><i class="bi bi-tags"></i><a href="#" > 特價專區</a></div>

            <hr>

            <form class="mt-3">
                <div class="form-group">
                    <label for="customRange3">依價格區間選擇</label>
                    <input type="range" class="custom-range" min="0" max="1200" step="200" id="customRange3">
                </div>
            </form>
        </div>
        <div class="main-content col-9 ml-5 p-3">

            <div class="search-result row mb-3">
                <div class="col-12 mb-3">
                    搜尋結果共  <span class="font-weight-bold" style="color:rosybrown"> 20 </span>筆，頁數 <span  class="font-weight-bold" style="color:rosybrown"> 1 </span> / 2
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/1.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">深入淺出Java</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/4.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">Book title goes here Book title goes here</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/2.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">Book title goes here Book title goes here</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/3.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">Book title goes here Book title goes here</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>

            </div>
            <div class="row mb-4">
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/1.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">深入淺出Java</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/4.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">Book title goes here Book title goes here</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/2.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">Book title goes here Book title goes here</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/3.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">Book title goes here Book title goes here</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>

            </div>
            <div class="row mb-4">
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/1.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">深入淺出Java</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/4.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">Book title goes here Book title goes here</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/2.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">Book title goes here Book title goes here</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>
                <div class="col-3">
                    <div class="picture mb-2"><img src="${pageContext.request.contextPath}/static/images/3.jpg"></div>
                    <div class="title text-dark p-2" style="font-weight:600;">
                        <a href="#">Book title goes here Book title goes here</a>
                    </div>
                    <div class="price text-dark mb-2 p-2 ">
                        價格: <span style="text-decoration:line-through;">1000</span>元 優惠價: <span style="color:indianred;">800</span>元
                    </div>
                    <button class="btn btn-sm btn-warning ml-3">放入購物車</button>
                    <button class="btn btn-sm btn-outline-secondary ml-2">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>
                </div>

            </div>

            <div class="row mb-4">
                <div class="ml-auto">
                    <ul class="pagination justify-content-end">
                        <li class="page-item"><a class="page-link text-secondary"
                                                 href="#">上一頁</a></li>
                        <li class="page-item"><a class="page-link text-secondary"
                                                 href="#">1</a></li>
                        <li class="page-item"><a class="page-link text-secondary"
                                                 href="#">2</a></li>
                        <li class="page-item"><a class="page-link text-secondary"
                                                 href="#">3</a></li>
                        <li class="page-item"><a class="page-link text-secondary"
                                                 href="#">下一頁</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>

    <!-- <img class="god" src="images/Godbless.png" height="500px;" width="500px;"></img><br> -->
    <img class="cs" src="${pageContext.request.contextPath}/static/images/cs.png" height="90px;" width="90px;" href="#">
</main>

<!-- footer -->
<%@include file="/static/template/front_layout_footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>
</body>
</html>
