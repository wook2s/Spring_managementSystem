<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>error!</h1>
	<p>
		사용자 요청 URL : ${url}<br>
		예외 : ${e.message}<br>
		<c:forEach var="message" items="${e.stackTrace}">${message}<br></c:forEach>
		
		
	</p>
</body>
</html>