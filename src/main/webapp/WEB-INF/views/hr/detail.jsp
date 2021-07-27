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
	<h1>사원정보 상세확인</h1>
	<table border="1">
		<tr>
			<th>사원번호</th>
			<td>${emp.employeeId}</td>
		</tr>
		<tr>
			<th>성</th>
			<td>${emp.firstName}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${emp.lastName}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${emp.email}</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${emp.phoneNumber}</td>
		</tr>
		<tr>
			<th>입사일</th>
			<td>${emp.hireDate}</td>
		</tr>
		<tr>
			<th>직무ID</th>
			<td>${emp.jobId}</td>
		</tr>
		<tr>
			<th>연봉</th>
			<td>${emp.salary}</td>
		</tr>
		<tr>
			<th>보너스율</th>
			<td>${emp.commissionPct}</td>
		</tr>
		<tr>
			<th>매니저ID</th>
			<td>${emp.managerId}</td>
		</tr>
		<tr>
			<th>부서ID</th>
			<td>${emp.departmentId}</td>
		</tr>
	</table>
	<button type="button" onclick="location.href='/myapp/hr/list'">뒤로가기</button>
	<%-- <a href="update?employeeId=${emp.employeeId}">수정하기</a> --%>
	<button  type="button" onclick="location.href='update?employeeId=${emp.employeeId}'">수정하기</button>
	<button type="button" onclick="location.href='delete?employeeId=${emp.employeeId}'">삭제하기</button>
</div>
</body>
</html>