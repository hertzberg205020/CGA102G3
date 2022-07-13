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
      
      <div class="mall" style="margin-left:50px">
                <ul>
                    <li><button onclick="location.href='${pageContext.request.contextPath}/front-end/prod/browse.jsp'">一般商城</button></li>
                    <li><button onclick="location.href='${pageContext.request.contextPath}/front-end/bid/bid_prod_view.jsp'">競標商城</button></li>
                    <li><button onclick="location.href='${pageContext.request.contextPath}/front-end/note/listAllNote.jsp'">討論留言板</button></li>
                </ul>
      </div>
    </div>
    <div class="right_side">
      <div class="cart">
        <button id="cart_btn" onclick="location.href='${pageContext.request.contextPath}/front-end/prod/car.jsp'">
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
              <a href="${pageContext.request.contextPath}/front-end/mem/login.jsp">登入</a>
              <a href="${pageContext.request.contextPath}/front-end/mem/signup.jsp">註冊</a>
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
              ${memVO.mbrName}
            </li>
            <div class="dropdown-content">
              <a href="${pageContext.request.contextPath}/front-end/mem/memlist.jsp">會員資料</a>
              <a href="${pageContext.request.contextPath}/front-end/order/order.jsp">訂單管理</a>
              <a href="${pageContext.request.contextPath}/front-end/bid/bid_order.jsp">競標訂單</a>
              <a href="${pageContext.request.contextPath}/front-end/walletrecord/listAllWalletrecord.jsp">錢包管理</a>
              <FORM METHOD="get" ACTION="${pageContext.request.contextPath}/front-end/mem/memlogout">
           <input type="submit" value="登出"
            style="background-color: #e9e9e9; color:  #678F74; border: none; width:100%;">
          </FORM>
            </div>
          </div>
        </ul>
    </c:if>
        
      </div>
    </div>
  </nav>
</header>
