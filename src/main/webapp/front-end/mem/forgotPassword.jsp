<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.mem.model.*"%>



<%-- <% --%>
<!-- //     Object memVO = session.getAttribute("memVO");                  // 從 session內取出 (key) account的值 -->
<!-- //     if (memVO == null) {                                             // 如為 null, 代表此user未登入過 , 才做以下工作 -->
<!-- //       session.setAttribute("location", request.getRequestURI());       //*工作1 : 同時記下目前位置 , 以便於login.html登入成功後 , 能夠直接導至此網頁(須配合LoginHandler.java) -->
<!-- //       response.sendRedirect(request.getContextPath()+"/front-end/mem/login.jsp");   //*工作2 : 請該user去登入網頁(login.html) , 進行登入 -->
<!-- //       return; -->
<!-- //     } -->
<%-- %> --%>


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

<!-- Jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- Bootstrap4.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
<!--    基礎版面樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/template/css/front_layout.css">

<style >
main.main{
height:300px;
}


div.mid{
text-align: center;
 margin: 5% auto;

box-shadow: 5px 5px 5px #cccccc;
width: 500px;
height: 250px;
	border: 5px solid #7bc5ae;
	border-collapse: separate;
	border-radius: 10px; 
}

div.div0{
margin-top:40px;
}

h1{
	color: coral;
}
div.div1{
margin-top:20px;

}

</style>


<title>忘記密碼</title>

</head>
<body>
	<%@include file="/static/template/front_layout_header.jsp"%>
	<header class="header"> </header>

	<main class="main">

	<div class="mid">
	<div class="div1">
	<h1>忘記密碼</h1>
	</div>
		<form action="${pageContext.request.contextPath}/front-end/mem/forgot" method="post">
			<div class="div1">
				<input
					class="email" id="usrEmail" type="text" placeholder="Enter Email"
					name="usrEmail" required>
			</div>
			
			<div class="error" style="color: red">${errorMsgs}　</div>
			<br>
			<div class="div2">
				<input class="btn btn-warning"  id= "forgetBtn" type="submit" value="送出">
			</div>
		</form>
	</div>	
	
	</main>


  <script>      
//   const forgetBtn = document.addEventListener('click', () => {
	  
	  function test(){
   //取得用戶輸入Email
   let usrEmail = document.getElementById("usrEmail").value;
   $.ajax({
              type: 'GET',
              url: '/CGA102G3/front-end/mem/forgot',
              data: {'usrEmail': usrEmail},
              dataType: 'json',
              async: false,
              success: function (response) {
                  
      
              },
              error: function (thrownError) {
                  console.log(thrownError);
              }
          });
  };
  </script>




	<%@include file="/static/template/front_layout_footer.jsp"%>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- bootstrap JS-->
	<script
		src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>
	<script
		src="${pageContext.request.contextPath}/front-end/book/js/front_book_view.js"></script>
</body>
</html>