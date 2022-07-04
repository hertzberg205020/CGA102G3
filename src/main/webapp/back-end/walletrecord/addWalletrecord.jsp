<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.walletrecord.model.*"%>
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%
WalletrecordVO walletrecordVO = (WalletrecordVO) request.getAttribute("walletrecordVO");
%>

<%-- <%= walletrecordVO==null %>--${walletrecordVO.getDeptno()}--${walletrecordVO.deptno}-- --%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
    <!--    基礎版面樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
    
<title>會員專區>錢包管理>錢包儲值</title>

</head>
<body>
<header class="header">

</header>

<main class="main">
<table id="table-1">
	<tr>
	    <h1>會員專區>錢包管理>錢包儲值</h1>

	</tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="walletrecord.do" name="form1">
<table>
	<tr>
<!-- 		<td><b>會員編號</b></td> -->
		<td><input class="walletrecord" type="hidden" name="mbr_ID" size="60" 
			 value="7" /></td> 
	</tr>
	<tr>
<!-- 		<td><b>錢包使用備註</b></td> -->
		<td><input class="walletrecord" type="hidden" name="note" size="60"
			 value="0" /></td>
	</tr>
	<tr>
		<td><b>儲值金額</b></td>
		<td><input class="walletrecord" type="TEXT" name="amount" size="60"
			 value="<%= (walletrecordVO==null)? "" : walletrecordVO.getAmount()%>" /></td>
	</tr>
	
</table>
<br>
	<td>
<input type="hidden" name="action" value="insert">
<input type="submit" value="確定儲值">


		 <button type="button" class="btn btn-danger"
                 onclick="javascript:location.href='${pageContext.request.contextPath}/front-end/walletrecord/listAllWalletrecord.jsp'">
                 取消儲值
         </button>
	</td>
</FORM>
</body>


<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<% 
  java.sql.Date hiredate = null;
  try {
	    
   } catch (Exception e) {
	    hiredate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>
</main>
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- datetimepicker-->
<%--<script src="${pageContext.request.contextPath}/datetimepicker/jquery.js"></script>--%>
<script src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<script src="${pageContext.request.contextPath}/back-end/book/js/back_book_add.js"></script>

</html>