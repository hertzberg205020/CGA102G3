<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.bid_prod.entity.*"%>
<%@ page import="com.cga102g3.web.book.dao.*"%>
<%@ page import="com.cga102g3.web.book.entity.*"%>
<%@ page import="java.util.*"%>

<% BookService bs = new BookService();
	List<Book> list = bs.getAll();
	request.setAttribute("list", list);

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!-- Bootstrap Icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<title>管理後臺 | 競標商品管理</title>
<!-- 側邊攔CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/back_layout.css">
<!-- 新增頁面CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/back-end/bid/css/bidprod_back_insert_page.css">

<title>管理後臺 | 競標商品管理</title>

</head>
<body>
<!-- 	側邊攔頁面 -->
	<%@include file="/static/template/back_layout_aside.jsp"%>
		
	<header class="header">
		<h1 class="text-center"
			style="font-size: 32px; font-weight: 600; color: rgb(82, 136, 138)">競標商品管理</h1>
	</header>

	<main class="main">
		<div class="container p-5">
			<div class="row align-items-center">
			<div class="m-2 p-1" style="background-color:steelblue; width:80px; border-radius: 5px;">
				<a class="text-light" style="text-decoration: none;" href="${pageContext.request.contextPath}/back-end/bid/bidprod_back_page.jsp"> <i class="bi bi-caret-left-fill"></i> 上一頁</a>
			</div>
				<div class="col-6 text-success font-weight-bold" style="font-size: 1.3rem">${passMsgs.success} ${passMsgs.state}</div>
			</div>
			<hr>
			
			
				<form method="post" action="bid.do" name="form1">
					<div class="mb-2" style="font-size: 22px; font-weight:600;">新增競標商品</div>
					<small class="text-secondary">(<span class="font-weight-bold" style="color: red">*</span> 為必填)</small>
					
					<div class="row mb-3 align-items-center">
						<div class="col-2">書籍名稱:  <span class="font-weight-bold" style="color: red">*</span></div>
						<div class="col-4">
							<select size=1 name="bookID" class="form-control">
								<c:forEach var="book" items="${list}">
									<option value="${book.bookID}" ${(param.bookID==book.bookID)? 'selected':'' }>${book.title}								
								</c:forEach>
							</select>
						</div>
						<div class="col-4 err">${errorMsgs.bookID}</div>
					</div>

					<div class="row mb-3 align-items-center">
						<div class="col-2">競標底價:  <span class="font-weight-bold" style="color: red">*</span></div>
						<div class="col-4">
							<input class="bid-input form-control" type="text" name="startPrice" value="${param.startPrice}">
						</div>
						<div class="col-4 err">${errorMsgs.startPrice}</div>
					</div>

					<div class="row mb-3 align-items-center">
						<div class="col-2">直購價:  <span class="font-weight-bold" style="color: red">*</span></div>
						<div class="col-4">
							<input class="bid-input form-control" type="text" name="bidDirectPrice" value="${param.bidDirectPrice}">
						</div>
						<div class="col-4 err">${errorMsgs.bidDirectPrice}</div>	
					</div>


					<div class="row mb-3 align-items-center">
						<div class="col-2">起標時間:</div>
						<div class="col-4">
							<input class="bid-input form-control" type="text" name="bidStart"
							 id="date1">
						</div>
						<div class="col-4 err">${errorMsgs.bidStart}</div>
					</div>
					<div class="row mb-3 align-items-center">
						<div class="col-2">結標時間:</div>
						<div class="col-4">
							<input class="bid-input form-control" type="text" name="bidEnd" 
								id="date2">
						</div>
						<div class="col-4 err">${errorMsgs.bidEnd}</div>
					</div>
					<br>
					<button class="p-2" type="button"
					style="border: transparent; margin-left: 360px; background-color: wheat; border-radius: 6px;"
					data-toggle="modal" data-target="#Modal2">送出新增</button>
				<!-- modal -->
				<div class="modal fade" id="Modal2" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel"></h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body text-center font-weight-bold mt-3 mb-3">
								確定新增商品?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">返回新增</button>
								<input type="hidden" name="action" value="insert">
								<button type="submit" class="btn btn-success">確定</button>
							</div>
						</div>
					</div>
				</div>
					<br>
				</form>
		</div>
		
		<br>
		<br>
		<br>
		<br>
		<br>
		
	</main>
	
<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- popper -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!-- bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	
</body>

<% 
  java.sql.Timestamp bidStart = null;
  try {
	    bidStart = java.sql.Timestamp.valueOf(request.getParameter("bidStart").trim());
	    System.out.println(bidStart);
	    
   } catch (Exception e) {
	   bidStart = new java.sql.Timestamp(System.currentTimeMillis());
   }
  java.sql.Timestamp bidEnd = null;
  try {
	    bidEnd = java.sql.Timestamp.valueOf(request.getParameter("bidEnd").trim());
	    System.out.println(bidEnd);
   } catch (Exception e) {
	   bidEnd = new java.sql.Timestamp(System.currentTimeMillis());
   }

%>


<!-- date time picker -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/static/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/static/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>



<script>
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){
	 $('#date1').datetimepicker({
	 closeOnWithoutClick :false,
// 	  format:'Y-m-d H:00:00',
	  format:'Y-m-d H:i:00',
	  step: 5,
// 	  allowTimes: [
// 		  '12:00'
// 	  ],
// 	  defaultTime: '12:00',
	  onShow:function(){
	   this.setOptions({
	    maxDate:$('#date2').val()?$('#date2').val():false
	   })
	  },
	  timepicker: true,
      values:'<%=bidStart%> ' 
	 });
	 
	 $('#date2').datetimepicker({
	 closeOnWithoutClick :false,
// 	  format:'Y-m-d H:00:00',
	  format: 'Y-m-d H:i:00',
	  step: 5,
// 	  allowTimes: [
// 		  '22:00'
// 	  ],
// 	  defaultTime: '22:00',
	  onShow:function(){
	   this.setOptions({
	    minDate:$('#date1').val()?$('#date1').val():false
	   })
	  },
	  timepicker:true,
	  values:'<%=bidEnd%> ' 
	 });
});

		let somedate1 = new Date();
		$('#date1').datetimepicker({
		    beforeShowDay: function(date) {
		  	  if (  date.getYear() <  somedate1.getYear() || 
			           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
			           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate() )
		        ) {
		             return [false, ""]
		        }
		        return [true, ""];
		}});


</script>
</html>