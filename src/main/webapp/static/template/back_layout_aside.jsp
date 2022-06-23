<%--
  Created by IntelliJ IDEA.
  User: u8360
  Date: 2022/6/11
  Time: 下午 07:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="aside">
  <img class="img" src="${pageContext.request.contextPath}/static/images/Book2.png" height="130" width="130">
  <nav class="nav">
    <ul class="menu">
      <li>
        <img class="img2" src="${pageContext.request.contextPath}/static/images/member.png" height="20px" width="20px">
        <label for="btn-1" class="label">員工管理<span class="fas fa-caret-down"></span>
        </label>
        <input type="checkbox" id="btn-1">
        <ul>
          <li><a id="a" ref ="#">員工帳號管理</a></li>
          <li><a id="a" ref ="#">員工權限管理</a></li>
        </ul>
      </li>
      <li>
        <img class="img2" src="${pageContext.request.contextPath}/static/images/member.png" height="20px" width="20px">
        <label for="btn-2" class="label">會員管理<span class="fas fa-caret-down"></span>
        </label>
        <input type="checkbox" id="btn-2">
        <ul>
          <li><a id="a" ref ="#">會員資料</a></li>
          <!-- <li><a id="a" ref ="#">書目詳情</a></li> -->
        </ul>
      </li>
      <li>
        <img class="img2" src="${pageContext.request.contextPath}/static/images/coin.png" height="20px" width="20px">
        <label for="btn-3" class="label">金流管理<span class="fas fa-caret-down"></span>
        </label>
        <input type="checkbox" id="btn-3">
        <ul>
          <!-- <li><a id="a" ref ="#">二手商品匯款管理</a></li> -->
          <li><a id="a" ref ="#">查詢錢包使用紀錄</a></li>
        </ul>
      </li>
      <li>
        <img class="img2" src="${pageContext.request.contextPath}/static/images/mall.png" height="20px" width="20px">
        <label for="btn-5" class="label">一般商城<span class="fas fa-caret-down"></span>
        </label>
        <input type="checkbox" id="btn-5">
        <ul>
          <li><a id="a" ref ="#">一般商品管理</a></li>
          <li><a id="a" ref ="#">特賣專案管理</a></li>
          <li><a id="a" ref ="#">商品訂單管理</a></li>
        </ul>
      </li>
      <li>
        <img class="img2" src="${pageContext.request.contextPath}/static/images/bid.png" height="20px" width="20px">
        <label for="btn-7" class="label">商城競標<span class="fas fa-caret-down"></span>
        </label>
        <input type="checkbox" id="btn-7">
        <ul>
          <li><a id="a" ref ="#">競標商品管理</a></li>
          <li><a id="a" ref ="#">競標訂單管理</a></li>
        </ul>
      </li>

      <li>
        <img class="img2" src="${pageContext.request.contextPath}/static/images/cs2.png" height="20px" width="20px">
        <label for="btn-8" class="label">客服管理<span class="fas fa-caret-down"></span>
        </label>
        <input type="checkbox" id="btn-8">
        <ul>
          <li><a id="a" ref ="#">即時客服系統</a></li>
          <li><a id="a" ref ="#">FAQ管理</a></li>
        </ul>
      </li>

      <li id="bookmng">
        <img class="img2" src="${pageContext.request.contextPath}/static/images/book.png" height="20px" width="20px">
        書目管理
      </li>

      <li id="logout">
        <img class="img2" src="${pageContext.request.contextPath}/static/images/logout.png" height="20px" width="20px">
        登出
      </li>
    </ul>
  </nav>
</aside>

