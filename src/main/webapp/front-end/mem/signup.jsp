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


<title>會員註冊</title>

<style>
div.main {
border-radius: 10px;
box-shadow:5px 5px 5px  #cccccc;
	width: 650px;
	height: 520px;
	border: 8px solid #EEEEEE;
	background-color: white;
	/*让div水平居中*/
	margin: 0 auto;
	margin-top: 10px;
}

div.left {
width: 180px;
	float: left;
	margin: 15px;
	color: #000;
}
span{
text-align: left;
font-size: 12px;
}
div.error{
text-align: left;
font-size: 12px;

}

div.mid {
margin-top: 10px;
	float: left;
}

h1 {
	text-align: center;
	margin: 0;
	height: 50px;
	color: coral;
}

table {
	/* margin: 0px auto; */
	
}

tr {
	height: 40px;
}

.td_left {
	width: 100px;
	/* 每行的高度为45个像素点 */
	height: 45px;
	/* 字体向右对齐 */
	text-align: right;
}

.td_right {
	/* 左边字体部分与右边内容部分之间，填充（隔开）50个像素点的位置 */
	padding-left: 40px;
}

#username, #password11, #password22, #email, #name, #phone, #address,
	#date {
	width: 251px;
	height: 25px;
	border: 1px solid #A6A6A6;
	/* 设置边框圆角 */
	border-radius: 5px;
	padding-left: 10px;
}

.submitbtn {
	width: 150px;
	height: 40px;
	background-color: #FFD026;
	border: 1px solid #FFD026;
	border-radius:5px;
	margin-bottom: 10px;
	margin-top: 20px;
}

.submitbtn:hover {
  opacity: 0.8;
}

.cityControl .townControl{
hight: 20px

}
</style>

</head>
<body>
	<%@include file="/static/template/front_layout_header.jsp"%>
	<header class="header"> </header>




	<main class="main">

		<div class="main">
			<div class="left">
				<h1>會員註冊</h1>
				<span id="tishi"></span>
				<div class="error">
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
				</div>
			</div>
			<div class="mid">
				<form class="new_user" id="new_user" action="${pageContext.request.contextPath}/back-end/mem/mem.do"
					 method="post">
					<table>

						<tr>
							<td class="td_left"><label for="username">帳號</label></td>
							<td class="td_right"><input required="required" type="text"
								name="username" id="username" value="<%=(memVO == null) ? "" : memVO.getMbrAccount()%>" placeholder="請輸入帳號"></td>
						</tr>
						<tr>
							<td class="td_left"><label for="password">密碼</label></td>

							<td class="td_right"><input label="密碼" required="required"
								type="password" name="password" id="password11" placeholder="請輸入密碼"/></td>
						</tr>
						<tr>
							<td class="td_left"><label for="checkpassword">密碼確認</label>
							<td class="td_right"><input label="密碼確認" required="required"
								type="password" name="checkpassword" id="password22" onkeyup="validate()" placeholder="請確認密碼"/>
								</td>
						</tr>
						<tr>
							<td class="td_left"><label for="email">Email</label></td>

							<td class="td_right"><input label="E-mail"
								required="required" type="text"  name="email" id="email" value="<%=(memVO == null) ? "" : memVO.getMbrEmail()%>" placeholder="請輸入Email"/></td>
						</tr>


						<tr>
							<td class="td_left"><label for="name">姓名</label></td>

							<td class="td_right"><input label="姓名" required="required" type="text"
								name="name" id="name" value="<%=(memVO == null) ? "" : memVO.getMbrName()%>" placeholder="請輸入姓名"/></td>
						</tr>
						<tr>
							<td class="td_left"><label for="gender">性別</label></td>
							<td class="td_right"><input type="radio" name="gender"
								value=0> 男 <input type="radio" name="gender" value=1>
								女</td>
						</tr>
						<tr>
							<td class="td_left"><label for="phone">手機號碼</label></td>

							<td class="td_right"><input label="手機號碼" required="required" type="text"
								name="phone" id="phone" value="<%=(memVO == null) ? "" : memVO.getMbrMobile()%>" placeholder="請輸入手機號碼"/></td>
						</tr>

						<tr>
							<td class="td_left"><label for="address">地址</label></td>
							<td class="td_right">
								<div id="twzipcode" name="address"></div> <input label="聯絡地址"
								type="text" required="required" name="address" id="address" value="<%=(memVO == null) ? "" : memVO.getMbrAddr()%>" placeholder="請輸入住址"/>
							</td>
						</tr>
						<tr>
							<td class="td_left"><label for="date">生日</label></td>

							<td class="td_right"><input label="生日" required="required" type="date"
								name="date" id="date" value="<%=(memVO == null) ? "" : memVO.getMbrBirth()%>" placeholder="請選擇日期"></td>
						</tr>


						<tr>
							<input type="hidden" name="action" value="signup">
							<td colspan="2" align="center"><input type="submit" id="submit"
								value="註冊" class="submitbtn" data-disable-with="註冊帳號" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<script>

        function validate() {       
            var pwd1 = document.getElementById("password11").value;       
            var pwd2 = document.getElementById("password22").value;
       // <!-- 对比两次输入的密码 -->
        
            if(pwd1 == pwd2)       
             {        
                document.getElementById("tishi").innerHTML="<font color='green'>密碼相同</font>";       
                document.getElementById("button").disabled = false;      
             }else {       
                document.getElementById("tishi").innerHTML="<font color='red'>密碼不同</font>";        
                document.getElementById("button").disabled = true;        
             }       
        }        
        </script>


		<script>
			$("#twzipcode").twzipcode({
				zipcodeIntoDistrict : true, // 郵遞區號自動顯示在區別選單中
				countySel: "臺北市", // 城市預設值, 字串一定要用繁體的 "臺", 否則抓不到資料
				districtSel: "大安區", // 地區預設值
				css : [ "cityControl", "townControl" ], // 自訂 "城市"、"地別" class 名稱 
				countyName : "city", // 自訂城市 select 標籤的 name 值
				districtName : "town" // 自訂區別 select 標籤的 name 值
			});
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