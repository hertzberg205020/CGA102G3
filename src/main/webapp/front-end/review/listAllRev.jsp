<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cga102g3.web.review.model.*"%>

<%BookReviewVO bookreviewVO = (BookReviewVO) request.getAttribute("bookReviewVO");%>

<%
BookReviewService bkrvSvc = new BookReviewService(); //每次都拿最新資料
List<BookReviewVO> list = bkrvSvc.getAll(); //資料庫有異動就會呈現出來
request.setAttribute("list", list);
%>

<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/static/template/js/front_layout.js"></script>
<title>所有留言資料 - listAllRev.jsp</title>

<style>
div.comment {
	width: 500px;
	background-color: whitesmoke;
	border-radius: 10px;
	display: flex;
	justify-content: space-between;
    margin-left: 380px;
}

div.edit {
	display: flex;
	margin-button: 0;
}
</style>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <title>商城首頁</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/template/css/front_layout.css">
</head>

<body>
<%@include file="/static/template/front_layout_header.jsp" %>
<img class="god" src="${pageContext.request.contextPath}/static/images/Godbless.png" height="500px;" width="500px;"><br>

<div>
	<c:forEach var="bookreviewVO" items="${list}" varStatus="s" >
		<div class="comment">
			<div>
				<p>[${bookreviewVO.memVO.mbrName}]</p>
				<p>${bookreviewVO.reviewContent}</p>				
				<p><fmt:formatDate value="${bookreviewVO.reviewTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
			</div>
			<div class="edit">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/review/review.do">
					<input type="submit" value="修改" id="edit${s.index}">
					<input type="hidden" name="reviewID" value="${bookreviewVO.reviewID}"> 			
					<input type="hidden" name="mbrID" value="${bookreviewVO.mbrID}">				
					<input type="hidden" name="bookID" value="${bookreviewVO.bookID}">				
					<input type="hidden" name="reviewStatus" value="${bookreviewVO.reviewStatus}">  
					<input type="hidden" name="action" value="getOne_For_Update">
				</FORM>

				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/review/review.do">
					<!--上面的 ACTION 是要傳送到的網址 -->
					<input type="submit" value="刪除"> 
					<input type="hidden" name="reviewID" value="${bookreviewVO.reviewID}"> 
					<input type="hidden" name="action" value="delete">
				</FORM>
			</div>
		</div>
		<hr>
<!--以下為編輯留言之語法-->
	<script>
	$('#edit${s.index}').click(function () {
    let value = $(this).parent().parent().prev().children().eq(1).text();
	$(this).parent().parent().prev().children().eq(1).remove();
	
	  $('<br>'
	  + '<FORM METHOD="post" ACTION="review.do">'
	  + '<input type="text" name="reviewContent" value="' + value + '">'

	  	+ '<input type="hidden" name="reviewID" value="' + ${bookreviewVO.reviewID} + '">'
	  	+ '<input type="hidden" name="mbrID" value="' + ${bookreviewVO.mbrID} + '">'
	  	+ '<input type="hidden" name="bookID" value="' + ${bookreviewVO.bookID} + '">'
	  	+ '<input type="hidden" name="reviewStatus" value="' + ${bookreviewVO.reviewStatus} + '">'
	  
	  + '<input type="hidden" name="action" value="update">'
	  + '<input type="submit" value="確認修改" >'
	  + '</FORM>')
	.appendTo($(this).parent().parent().prev().children().eq(0));
	
	$(this).remove();
	})
	</script>		
	</c:forEach>
</div>

<%-- 新增留言區 --%>
<c:if test="${not empty errorMsgs}">
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color: red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<FORM METHOD="post" ACTION="review.do">
	<tr class="input">
		<div class="justify-content-center row">
			<td><input type="TEXT" name="reviewContent" size="40"/></td>
			<input type="hidden" name="action" value="insert"> 
			<input type="submit" value="送出留言">
		</div>
	</tr>
</FORM>

<img class="cs" src="${pageContext.request.contextPath}/static/images/cs.png" height="90px;" width="90px;" href="#">
<%@include file="/static/template/front_layout_footer.jsp" %>

</body>
</html>

<%-- 重新整理後頁面停留在 scroll 的當前位置 --%>
<script>	
$(document).ready(function () {
    $(window).on('beforeunload', function () {
        document.cookie = "keepscroll=" + $(window).scrollTop();
    });
    var cs = document.cookie ? document.cookie.split(';') : [];
    var i = 0, cslen = cs.length;
    for (; i < cs.length; i++) {
        var c = cs[i].split('=');
        if (c[0].trim() == "keepscroll") {
            $(window).scrollTop(parseInt(c[1]));
            break;
        }
    }
});
</script>	