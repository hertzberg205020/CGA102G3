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
        <a href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/static/images/LOGObig.png">
        </a>
    </div>
    
		 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProdServlet.do" >
            <div class="search" style="margin-top:18px; margin-right:-220px">
                <input type="text" placeholder="請輸入書名查詢一般商城" name="keyword_input" id="search_content" />
                <button id="search_btn"  type="submit">
                    <div id="icon_wrapper">
                        <img src="${pageContext.request.contextPath}/static/images/magnifier2.png"><img>
                    </div>
                </button>
                <input type="hidden" name="action"	value="search">
            </div>
         </FORM>
      
      <div class="mall">
                <ul>
                    <li><button href="#">一般商城</button></li>
                    <li><button href="#">競標商城</button></li>
                </ul>
      </div>
    </div>
    <div class="right_side">
      <div class="cart">
        <button id="cart_btn">
          <img class="cart" src="${pageContext.request.contextPath}/static/images/mall.png" height="25" width="25">
        </button>
      </div>
      <div>
      
      <!--       <button class="logout">會員登出</button> -->

 	<c:if test="${empty sessionScope.memVO.mbrID}">
        <ul class="nav-item dropdown">
          <div class="dropdown">
            <li class="dropbtn">
              <div class="member">
                <img src="${pageContext.request.contextPath}/static/images/member.png" height="25" width="25">
              </div>
              會員專區
            </li>
            <div class="dropdown-content">
              <a href="#">登入</a>
              <a href="#">註冊</a>
            </div>
          </div>
        </ul>
    </c:if>
        
    <c:if test="${not empty sessionScope.memVO.mbrID}">
        <ul class="nav-item dropdown">
          <div class="dropdown">
            <li class="dropbtn">
              <div class="member">
                <img src="${pageContext.request.contextPath}/static/images/member.png" height="25" width="25">
              </div>
              會員專區
            </li>
            <div class="dropdown-content">
              <a href="${pageContext.request.contextPath}/front-end/mem/memlist.jsp">會員資料</a>
              <a href="#">訂單管理</a>
              <a href="#">錢包管理</a>
              <a href="#">競標中商品</a>
              <FORM METHOD="get" ACTION="${pageContext.request.contextPath}/front-end/mem/memlogout">
           <input type="submit" value="登出"
            style="background-color: rgb(0, 100, 125); color: white; border: none">
          </FORM>
            </div>
          </div>
        </ul>
    </c:if>
        
      </div>
    </div>
  </nav>
</header>
