<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		a { text-decoration: none; }
		a:link { color:black; text-decoration: none;}
		a:visited { color:black; text-decoration: none;}
		#container{ margin-top: 20px; margin-left: 150px}
	</style>
</head>
<body>
<div id="container">
<h1>사원 삭제</h1>
<form action="/myapp/hr/delete" method="post">
	<h2><span style="color: red;">삭제</span>한 정보는 복구할 수 없습니다.</h2>
	
	<table>
		<tr>
			<th>사원번호</th>
			<td>${emp.employeeId}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${emp.lastName} ${emp.firstName}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${emp.email}</td>
		</tr>
	</table>
	
	<p>정보를 삭제하시려면 사원번호와 이메일을 입력하세요.</p>
	
	<label>사원번호<input type="text" name="employeeId"></label>
	<label>이메일<input type="text" name="email"></label></p>
	
	<button type="button" onclick="location.href='/myapp/hr/${emp.employeeId}'">뒤로가기</button>
	<input type="submit" value="제출">
	<input type="reset" value="초기화">
	
</form>
</div>
</body>
</html>