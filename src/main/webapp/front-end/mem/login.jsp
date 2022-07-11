<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.mem.model.*"%>

<%
MemVO memVO = (MemVO) request.getAttribute("memVO");
%>

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

<title>會員登入</title>

<style>
div.main {
  border: 8px solid #f1f1f1;
  width:450px;

  margin: 3% auto;
}

form {
   
  margin:0 auto;
}


/* Full-width inputs */
div.container label{
    margin-left: 10px;
}
label.login{
 margin-left: 10px;
 margin-bottom: 2px;
}
input.account[type=text], input.password[type=password] {
  width: 95%;
  padding: 12px 20px;
  margin-left: 10px;
  margin-bottom: 10px;
  margin-top: 5px;
  /* display: inline-block; */
  border: 1px solid #ccc;
  box-sizing: border-box;
}
input#rememberMe{
margin-left: 10px;
}

/* Set a style for all buttons */
button.login {
  margin:0 ;
  background-color: #678F74;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}

/* Extra style for the cancel button (red) */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #fc9a93;
  border-radius:5px;
  border:0;
}

/* Center the avatar image inside this container */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

/* Avatar image */
img.avatar {
  width: 40%;

}

/* Add padding to containers */
div.login1 {
    margin:0 auto;
}


div.login2 {
  padding: 20px;

}

/* The "Forgot password" text */
span.psw {
  float: right;
  padding-top: 16px;
}
</style>
</head>
<body>
	<%@include file="/static/template/front_layout_header.jsp"%>
	<header class="header"> </header>

	<main class="main">
		<div class="main">
			
          <div class="imgcontainer">
            <img src="${pageContext.request.contextPath}/static/images/Login.png" alt="Avatar" class="avatar">
          </div>
      
          <div class="login1">
          <form class="login" id="login" action="${pageContext.request.contextPath}/front-end/mem/memlogin"
					 method="post">
            <label class="login" for="uname"><b>Username</b></label>
            <input class="account" id="username" type="text" placeholder="Enter Username" name="account" required>
      
            <label class="login" for="password"><b>Password</b></label>
            <input class="password" type="password" placeholder="Enter Password" name="password" required>
      
            <button class = "login" type="submit" onclick="lsRememberMe()">Log in</button>
        </form>
            <label>
              <input type="checkbox" id="rememberMe" name="remember"> Remember me
            </label>
          </div>
      
          <div class="login2" style="background-color:#f1f1f1">
            <button type="button"  class="cancelbtn"  onclick="location.href='${pageContext.request.contextPath}/front-end/mem/signup.jsp'" >Sign up</button>
            <span class="psw">Forgot <a href="${pageContext.request.contextPath}/front-end/mem/forgotPassword.jsp">password?</a></span>
          </div>
 		
		</div>


<!-- 記住我帳號		 -->
<script>
      const rmCheck = document.getElementById("rememberMe"),
    emailInput = document.getElementById("username");

if (localStorage.checkbox && localStorage.checkbox !== "") {
  rmCheck.setAttribute("checked", "checked");
  emailInput.value = localStorage.username;
} else {
  rmCheck.removeAttribute("checked");
  emailInput.value = "";
}

function lsRememberMe() {
  if (rmCheck.checked && emailInput.value !== "") {
    localStorage.username = emailInput.value;
    localStorage.checkbox = rmCheck.value;
  } else {
    localStorage.username = "";
    localStorage.checkbox = "";
  }
}
      </script>		
		
	</main>
	
	
	
	
	
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