<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cga102g3.web.note.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  NoteVO noteVO = (NoteVO) request.getAttribute("noteVO"); //NoteServlet.java(Concroller), 存入req的noteVO物件
%>

<html>
<head>
<title>通知單查 listOneNote</title>



</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>通知編號</th>
		<th>會員編號</th>
		<th>通知時間</th>
		<th>通知類型</th>
		<th>通知內容</th>
	</tr>
	<tr>
		<td><%=noteVO.getNote_ID()%></td>
		<td><%=noteVO.getMbr_ID()%></td>
		<td><%=noteVO.getNote_time()%></td>
		<td><%=noteVO.getNote_content_type()%></td>
		<td><%=noteVO.getNote_content()%></td>
		
	</tr>
</table>

</body>
</html>