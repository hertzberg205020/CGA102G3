<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cga102g3.web.mem.model.*"%>

<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<%
MemService MemSvc = new MemService();
List<MemVO> list = MemSvc.getAll();
pageContext.setAttribute("list", list);
%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- datetimepicker樣式 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.css" />
<!-- Bootstrap4.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
<!--    基礎版面樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
<!--    後台書籍管理添加樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/back-end/book/css/back_book_add.css">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>所有員工資料</title>


<style>

div {
	width: 950px;
	text-align: center;
}

main.main{
	
}
</style>

<style>
.wrap {
width:60px;
  text-align: center;
/*   padding-top: 20%; */
}
#detail {
  background-color: lightgreen;
/*   text-decoration: none; */
  color: white;
  padding: 9px 12px;
  border-radius: 5px;
}

.popup-wrap {
  width: 100%;
  height: 100%;
  display: none;
  position: fixed;
  top: 0px;
  left: 0px;
  content: '';
  background: rgba(0, 0, 0, 0.85);
}

.popup-box {
  width: 50%;
  padding: 50px 75px;
  transform: translate(-50%, -50%) scale(0.5);
  position: absolute;
  top: 50%;
  left: 50%;
  box-shadow: 0px 2px 16px rgba(0, 0, 0, 0.5);
  border-radius: 10px;
  background: #fff;
  text-align: center;
}
h2 {
  font-size: 40px;
  color: #1a1a1a;
}

h3 {

  font-size: 28px;
  color: #888;
  text-align: left;
  margin-left: 40px;
}
h4 {
  font-size: 28px;
  color: #888;
/*   text-align: left; */
/*   margin-left: 40px; */
}
.close-btn {
  width: 50px;
  height: 50px;
  display: inline-block;
  position: absolute;
  top: 10px;
  right: 10px;
  border-radius: 100%;
  background: #d75f70;
  font-weight: bold;
  text-decoration: none;
  color: #fff;
  line-height: 40px;
  font-size: 32px;
}

.transform-in, .transform-out {
  display: block;
  -webkit-transition: all ease 0.5s;
  transition: all ease 0.5s;
}

.transform-in {
  -webkit-transform: translate(-50%, -50%) scale(1);
  transform: translate(-50%, -50%) scale(1);
}

.transform-out {
  -webkit-transform: translate(-50%, -50%) scale(0.5);
  transform: translate(-50%, -50%) scale(0.5);
}
h3.shipState{
float:left;
}

h3.shipState, h4.shipState{

}
h4.shipState{

}

</style>

</head>
<body>
	<header class="header">
		<h1>所有會員資料</h1>
	</header>

	<%@include file="/static/template/back_layout_aside.jsp"%>
	<main class="main">

	<br>
		<div class="input-group col-6 mb-3">

<!-- 			<h4> -->
<!-- 				<a href="select_page.jsp">回首頁</a> -->
<!-- 			</h4> -->
		
			<input type="search" id="keyword_input" class="form-control rounded"
				placeholder="Search" aria-label="Search"
				aria-describedby="search-addon" />
			<button type="button" class="btn btn-outline-info ml-2"
				id="search_btn">search</button>
			</div>
		
		<div class="page1">
			<%@ include file="page1.file"%>
		</div>
		<div class="container">	
		<table class="table table-bordered text-center table-hover">
			<thead class="table-success">
				<tr>
					<th scope="col" class="col-1">編號</th>
					<th scope="col" class="col-4">會員帳號</th>
<!-- 					<th>會員密碼</th> -->
<!-- 					<th>會員狀態</th> -->
					<th scope="col" class="col-3">會員姓名</th>
<!-- 					<th>會員性別</th> -->
					<th scope="col" class="col-4">會員電話</th>
<!-- 					<th scope="col" class="col-4">會員住址</th> -->
<!-- 					<th scope="col" class="col-4">會員生日</th> -->
					<th scope="col" class="col-4">會員mail</th>
<!-- 					<th>加入時間</th> -->
					<th scope="col" class="col-4">Tcoin</th>
					<th>查看</th>
					<th>刪除</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="MemVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">
					<tr>
						<td>${MemVO.mbrID}</td>
						<td>${MemVO.mbrAccount}</td>
<%-- 						<td>${MemVO.mbrPassword}</td> --%>
<%-- 						<td>${MemVO.mbrStatus}</td> --%>
						<td>${MemVO.mbrName}</td>
<%-- 						<td>${MemVO.mbrGender}</td> --%>
						<td>${MemVO.mbrMobile}</td>
<%-- 						<td>${MemVO.mbrAddr}</td> --%>
<%-- 						<td>${MemVO.mbrBirth}</td> --%>
						<td>${MemVO.mbrEmail}</td>
<%-- 						<td>${MemVO.mbrJointime}</td> --%>
						<td>${MemVO.tcoinBal}</td>
						<td>
						
<!-- 							<FORM METHOD="post" -->
<%-- 								ACTION="<%=request.getContextPath()%>/back-end/mem/mem.do" --%>
<!-- 								style="margin-bottom: 0px;"> -->
<!-- 								<input type="submit" value="修改">  -->
<%-- 								<input type="hidden" name="mbrID" value="${MemVO.memID}">  --%>
<!-- 									<input type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 							</FORM> -->
<div class="wrap">
  <a id = "detail" class="btn popup-btn " href="#letmeopen${MemVO.mbrID}"><i class="fas fa-eye"></i></a>
</div>
<div class="popup-wrap " id="letmeopen${MemVO.mbrID}">
  <div class="popup-box transform-out">
    <h2>會員資料詳情</h2>
    <img class="pic"
					src="${pageContext.request.contextPath}/static/images/mem/${MemVO.mbrID}.png"
					width="200" height="200">
    <h3>
    會員編號：${MemVO.mbrID}<br>
    </h3>
    <h3>
    會員帳號：${MemVO.mbrAccount}<br></h3>
    <h3 class="shipState">會員狀態：</h3><h4 class="shipState">${MemVO.mbrStatus}</h4>
    <h3 >
    會員姓名：${MemVO.mbrName}<br></h3>
    <h3 >
    會員性別：${MemVO.mbrGender eq 0?"男":"女"}<br></h3>
    <h3>
    會員生日：${MemVO.mbrBirth}<br></h3>
    <h3>E_mail：${MemVO.mbrEmail}<br></h3>
    <h3>加入時間：${MemVO.mbrJointime}<br></h3>
    <h3>Tcoin幣：${MemVO.tcoinBal}</h3>
   
    <a class="close-btn popup-close" href="#">x</a>
  </div>
</div>


						</td>
						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/back-end/mem/mem.do"
								style="margin-bottom: 0px;">

								<input class='delete_ID' type="hidden" name="mbrID"
									value="${MemVO.mbrID}"> 
									<input type="hidden" name="action" value="delete"> 
									<input class='btn btn-danger' onclick="showalert()" type="submit" value="刪除">
							</FORM>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		</div>		
		<div>
			<%@ include file="page2.file"%>
		</div>
<!-- 		<div class="row justify-content-around mt-2"> -->
<!-- 	     <button type="button" class="btn btn-outline-secondary" id="prePageBtn" hidden>上一頁</button> -->
<!--      <button type="button" class="btn btn-outline-secondary" id="nextPageBtn">下一頁</button> -->
<!-- 		</div> -->
		<br>
		
		
	</main>
	
	<script type="text/javascript">
var imgs=document.images;
for (var i=0;i<imgs.length;i++){
imgs[i].onerror=function(){this.src="${pageContext.request.contextPath}/static/images/nopic.png"}
}
</script>
	

	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- datetimepicker-->
	<%--<script src="${pageContext.request.contextPath}/datetimepicker/jquery.js"></script>--%>
	<script
		src="${pageContext.request.contextPath}/static/datetimepicker/jquery.datetimepicker.full.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- bootstrap JS-->
	<script
		src="${pageContext.request.contextPath}/static/bootstrap4/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/template/js/back_layout.js"></script>
	<script
		src="${pageContext.request.contextPath}/back-end/book/js/back_book_add.js"></script>


</body>


<script>
let td = document.getElementsByClassName('shipState');
for (d of td) {   
 if (d.innerHTML == 0){
  d.textContent='未開通';
 } else if (d.innerHTML == 1) {
  d.textContent='已開通';
 } else if (d.innerHTML == 2) {
  d.textContent='停權';
 }
}

</script>

<!-- 彈出視窗 -->
<script>

$(".popup-btn").click(function() {
	  var href = $(this).attr("href")
	  $(href).fadeIn(250);
	  $(href).children$("popup-box").removeClass("transform-out").addClass("transform-in");
	  e.preventDefault();
	});

	$(".popup-close").click(function() {
	  closeWindow();
	});
	// $(".popup-wrap").click(function(){
	//   closeWindow();
	// })
	function closeWindow(){
	  $(".popup-wrap").fadeOut(200);
	  $(".popup-box").removeClass("transform-in").addClass("transform-out");
	  event.preventDefault();
	}
</script>


<script>
	var ID = document.querySelector('.delete_ID');
	function showalert() {
		var r = confirm("確定刪除嗎?");
		if (r == true) {
			alert("已成功刪除!");
		} else {
			return;
		}
	}
</script>


</html>