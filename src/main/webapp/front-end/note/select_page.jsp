<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"> -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Bookmall Note HomePage</title>


</head>
<body bgcolor='white'>





<table id="table-1">
   
</table>




	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <a href='listAllNote.jsp'>查看全部通知</a>   <br><br>
  
  
  
    <FORM METHOD="post" ACTION="note.do" >
        <b>查詢通知編號</b>
        <input type="text" name="note_ID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  


  <jsp:useBean id="noteSvc" scope="page" class="com.cga102g3.web.note.model.NoteService" />
   
  
     <FORM METHOD="post" ACTION="note.do" >
       <b>選擇通知編號:</b>
       <select size="1" name="note_ID">
         <c:forEach var="noteVO" items="${noteSvc.all}" > 
          <option value="${noteVO.note_ID}">${noteVO.note_ID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>  
 
</ul>



<ul>
  <a href='addNote.jsp'>新增通知</a>
</ul>



</body>
</html>