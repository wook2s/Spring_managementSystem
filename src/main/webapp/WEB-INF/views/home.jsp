<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	시작페이지입니다
</h1>

<P>  아래 링크에서 페이지를 선택하세요 </P>
<div>
	<ul style="list-style: none;">
		<li>
			<a href="<c:url value='/hr/count'/>">count 페이지 가기</a>
		</li>
		<li>
			<a href="<c:url value='/hr/list'/>">전체 사원 정보 페이지 가기</a>
		</li>	
	</ul>
</div>
</body>
</html>
