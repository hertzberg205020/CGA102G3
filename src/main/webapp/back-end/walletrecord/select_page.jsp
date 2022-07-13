<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.mem.model.*"%>


<html>
<head>
<meta charset="UTF-8">
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- Bootstrap4.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
    <!--    基礎版面樣式  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">

    
<title>金流管理 / 查詢錢包使用紀錄</title>

</head>

<body>

<header class="header">
    <h1>金流管理 / 查詢錢包使用紀錄</h1>
</header>

<%@include file="/static/template/back_layout_aside.jsp"%>

    <main class="main">
<div class="container">
      <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

  <h4><a href='listAllWalletrecord.jsp'>查看所有會員錢包紀錄</a></h4>
  

      
    <FORM METHOD="post" ACTION="walletrecord.do" >
        <label><b>查詢會員編號</b></label>
        <input required autofocus type="text" pattern="[0-9]" name="mbrID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" class="btn btn-info" value="送出">
    </FORM>
  
  <jsp:useBean id="memSvc" scope="page" class="com.cga102g3.web.mem.model.MemService" />
  
     <FORM METHOD="post" ACTION="walletrecord.do" >
       <label><b>選擇會員編號</b></label>
       <select size="1" name="mbrID">
       		<option value="">請選擇</option>
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.mbrID}">${memVO.mbrID}</option>
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" class="btn btn-info" value="送出">
    </FORM>
</div>
    </main>
<script>
           $(".label").find("span").click(function(){
             $(this).toggleClass("rotate");
           });
</script>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap JS-->
<script src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
<script src="${pageContext.request.contextPath}/back-end/book/js/back_book_view.js"></script>
</body>
</html>