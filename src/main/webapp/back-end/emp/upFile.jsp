<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>


	<FORM action="emp.do" method=post enctype="multipart/form-data">
        
        <input type="hidden" name="action"	value="upfile">
        <input type="file" name="upfile1">
        <input type="submit" value="上傳">
  </FORM>


</body>
</html>