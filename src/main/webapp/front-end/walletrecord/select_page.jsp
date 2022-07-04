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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_layout.css">

    
<title>會員專區>錢包管理</title>

</head>



<body>
<%@include file="/static/template/front_layout_header.jsp"%>
<header class="header">

</header>
    <h1>會員專區>錢包管理</h1>
    <main class="main">
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

  <a href='listAllWalletrecord.jsp'>查看所有錢包紀錄</a>
  
  
  <jsp:useBean id="walletrecordSvc" scope="page" class="com.cga102g3.web.walletrecord.model.WalletrecordService" />
  
     <FORM METHOD="post" ACTION="walletrecord.do" >
       <b>查詢錢包編號</b>
       <select size="1" name="wallet_rec_no">
         <c:forEach var="walletrecordVO" items="${walletrecordSvc.all}" > 
          <option value="${walletrecordVO.wallet_rec_no}">${walletrecordVO.wallet_rec_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>

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
<script src="${pageContext.request.contextPath}/static/template/js/front_layout_header"></script>
<script src="${pageContext.request.contextPath}/static/template/js/front_layout_footer"></script>

</body>
<%@include file="/static/template/front_layout_footer.jsp"%>
</html>