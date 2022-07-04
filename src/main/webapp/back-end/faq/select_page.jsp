<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

    
<title>客服管理>FAQ管理</title>

</head>

<body>

<header class="header">
    <h1>客服管理>FAQ管理</h1>
</header>

<%@include file="/static/template/back_layout_aside.jsp"%>

    <main class="main">
		<div class="container">
        <!--FAQ start-->
    
      
      
      <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

  <a href='listAllFaq.jsp'>查看所有FAQ</a>　　<a href='addFaq.jsp'>新增FAQ</a> 
  

      
    <FORM METHOD="post" ACTION="faq.do" >
        <b>搜尋FAQ編號</b>
        <input type="text" name="FAQ_ID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  
  <jsp:useBean id="faqSvc" scope="page" class="com.cga102g3.web.faq.model.FaqService" />
  
     <FORM METHOD="post" ACTION="faq.do" >
       <b>查詢FAQ編號</b>
       <select size="1" name="FAQ_ID">
         <c:forEach var="faqVO" items="${faqSvc.all}" > 
          <option value="${faqVO.FAQ_ID}">${faqVO.FAQ_ID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>

    </main>
    </div>
    </body>
    
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

</html>