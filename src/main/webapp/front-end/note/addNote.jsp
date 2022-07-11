<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cga102g3.web.note.model.*"%>

<%
NoteVO noteVO = (NoteVO) request.getAttribute("noteVO");
%>
<%-- <%= noteVO==null %>--${noteVO.getDeptno()}--${noteVO.deptno}-- --%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- Bootstrap4.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/bootstrap4/css/bootstrap.css">
<!--    基礎版面樣式  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/template/css/front_layout.css">

<title>首頁 / 討論留言新增</title>

</head>
<%@include file="/static/template/front_layout_header.jsp"%>
<body>

<main class="main">
<div class="container">
<h4><b><br>首頁 / 討論留言板 / 我要留言</b></h4>		


<br>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="note.do" name="form1">
<table>
	<tr>
		<td>會員編號　</td>
		<td><input type="TEXT" name="mbr_ID" size="11" 
			 value="<%= (noteVO==null)? "1" : noteVO.getMbr_ID()%>" /></td>
	</tr>
	<tr>
		<td>選擇主題　</td>
<!-- 		<td><input type="TEXT" name="note_content_type" size="45"  -->
<%-- 			 value="<%= (noteVO==null)? "1" : noteVO.getNote_content_type()%>" /></td> --%>

	<td>
	<select name="note_content_type">
	<option value="<%= (noteVO==null)? "0" : noteVO.getNote_content_type()%>" >--</option>
	<option value="<%= (noteVO==null)? "1" : noteVO.getNote_content_type()%>" >Java</option>
	<option value="<%= (noteVO==null)? "2" : noteVO.getNote_content_type()%>" >MySQL</option>
	<option value="<%= (noteVO==null)? "3" : noteVO.getNote_content_type()%>" >C#</option>
	<option value="<%= (noteVO==null)? "4" : noteVO.getNote_content_type()%>" >HTML</option>
	<option value="<%= (noteVO==null)? "5" : noteVO.getNote_content_type()%>" >JavaScript</option>
	<option value="<%= (noteVO==null)? "6" : noteVO.getNote_content_type()%>" >Android</option>
	<option value="<%= (noteVO==null)? "7" : noteVO.getNote_content_type()%>" >資安</option>

	
	</select>
	</td>
	</tr>
	<tr>
		<td>留言內容　</td>
		<td><input type="TEXT" name="note_content" size="100" autofocus
			 value="<%= (noteVO==null)? "" : noteVO.getNote_content()%>" /></td>
	</tr>
	

</table>
<br>
				<tr>
					<td>
						<button type="button" class="btn btn-danger"
							onclick="javascript:location.href='${pageContext.request.contextPath}/front-end/note/listAllNote.jsp'">
							取消留言</button>
					</td>
				<tr>
					<td><input type="hidden" name="action" value="insert">
						<input type="submit" class="btn btn-warning" value="送出留言"></td>
				</tr>
</FORM>
</div>
<br><br><br><br><br><br>
</main>
</body>
<%@include file="/static/template/front_layout_footer.jsp"%>

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

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=hiredate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });

        
</script>
</html>