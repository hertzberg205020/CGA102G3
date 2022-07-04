<%--
  Created by IntelliJ IDEA.
  User: u8360
  Date: 2022/6/11
  Time: 下午 08:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>

    <nav>
        <div class="logo">
            <img
                    src="${pageContext.request.contextPath}/static/images/LOGObig.png">
        </div>
        <div class="nav_mid">
            <div class="search">
                <input type="text" placeholder="輸入書名或 isbn 查詢一般商城" name=""
                       id="search_content" />
                <button id="search_btn">
                    <div id="icon_wrapper">
                        <img
                                src="${pageContext.request.contextPath}/static/images/magnifier2.png"><img>
                    </div>
                </button>
            </div>
            <div class="mall">
                <ul>
                    <li><a href="#">一般商城</a></li>
                    <li><a href="#">二手商城</a></li>
                    <li><a href="#">二手競標</a></li>
                </ul>
            </div>
        </div>

        <div class="right_side">
            <div class="cart">
                <button id="cart_btn">
                    <img class="cart"
                         src="${pageContext.request.contextPath}/static/images/mall.png"
                         height="25" width="25">
                </button>
            </div>
            <div>
                <c:if test="${empty sessionScope.mbrID}">
                    <ul class="nav-item dropdown">
                        <div class="dropdown">
                            <li class="dropbtn">
                                <div class="member">
                                    <img
                                            src="${pageContext.request.contextPath}/static/images/member.png"
                                            height="25" width="25">
                                </div> 登入/註冊
                            </li>
                            <div class="dropdown-content">
                                <a
                                        href="${pageContext.request.contextPath}/front-end/mem/login.jsp">登入</a>
                                <a
                                        href="${pageContext.request.contextPath}/front-end/mem/signup.jsp">註冊</a>
                            </div>
                        </div>
                    </ul>
                </c:if>

                <c:if test="${not empty sessionScope.mbrID}">
                    <ul class="nav-item dropdown">
                        <div class="dropdown">
                            <li class="dropbtn">
                                <div class="member">
                                    <img
                                            src="${pageContext.request.contextPath}/static/images/member.png"
                                            height="25" width="25">
                                </div> ${memVO.mbrName}
                            </li>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/front-end/mem/memlist.jsp">會員資料</a>
                                <a href="#">訂單管理</a>
                                <a href="#">收藏商品</a>
                                <a href="#">錢包管理</a>
                                <a href="#">通知查詢</a>
                                <a href="#">競標中商品</a>
                                <a href="#">
                                    <FORM METHOD="get" ACTION="${pageContext.request.contextPath}/front-end/mem/memlogout">
                                        <input type="submit" value="登出"
                                               style="background-color: rgb(0, 100, 125); color: white; border: none">
                                    </FORM>
                                </a>
                            </div>
                        </div>
                    </ul>
                </c:if>

            </div>
        </div>
        <!--       <div> -->
        <!--         <ul class="nav-item dropdown"> -->
        <!--           <div class="dropdown"> -->
        <!--             <li class="dropbtn"> -->
        <!--               <div class="member"> -->
        <%--                 <img src="${pageContext.request.contextPath}/static/images/member.png" height="25" width="25"> --%>
        <!--               </div> -->
        <!--               會員專區 -->
        <!--             </li> -->
        <!--             <div class="dropdown-content"> -->
        <%--               <a href="${pageContext.request.contextPath}/front-end/mem/memlist.jsp">會員資料</a> --%>
        <!--               <a href="#">訂單管理</a> -->
        <!--               <a href="#">收藏商品</a> -->
        <!--               <a href="#">錢包管理</a> -->
        <!--               <a href="#">通知查詢</a> -->
        <!--               <a href="#">競標中商品</a> -->
        <!--               <a href="#"> -->
        <%--               <FORM METHOD="get" ACTION="${pageContext.request.contextPath}/front-end/mem/memlogout"> --%>
        <!--               <input  type="submit" value="登出" style="background-color:rgb(0, 100, 125); color:white; border: none"> -->
        <!--               </FORM> -->
        <!--               </a> -->
        <!--             </div> -->
        <!--           </div> -->
        <!--         </ul> -->
        <!--       </div> -->
    </nav>



</header>
