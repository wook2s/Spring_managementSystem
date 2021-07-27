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
<h1>신규 사원 추가</h1>
<form action="./insert" method="post">
	<table border="1">
		<tr>
			<th>사원번호</th>
			<td><input type="text" name="employeeId" required="required" autofocus="autofocus"></td>
		</tr>
		<tr>
			<th>성</th>
			<td><input type="text" name="firstName" required="required"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="lastName" required="required"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" required="required"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="phoneNumber" required="required"></td>
		</tr>
		<tr>
			<th>입사일</th>
			<td><input type="date" name="hireDate" required="required"></td>
		</tr>
		<tr>
			<th>직무ID</th>
			<td>
				<select name="jobId">
				<c:forEach var="job" items="${jobList}">
					<option value="${job.jobId}">${job.jobTitle}</option>
				</c:forEach>	
				</select>
			</td>
		</tr>
		<tr>
			<th>연봉</th>
			<td><input type="text" name="salary" required="required"></td>
		</tr>
		<tr>
			<th>보너스율</th>
			<td><input type="number" name="commissionPct" step="0.1" min="0.0" max="1.0" required="required"></td>
		</tr>
		<tr>
			<th>매니저ID</th>
			<td>
				<select name="managerId">
				<c:forEach var="manager" items="${managerList}">
					<option value="${manager.managerId}">${manager.firstName}</option>
				</c:forEach>	
				</select>
			</td>
		</tr>
		<tr>
			<th>부서ID</th>
			<td>
				<select name="departmentId">
				<c:forEach var="department" items="${departmentList}">
					<option value="${department.departmentId}">${department.departmentName}</option>
				</c:forEach>	
				</select>
			</td>
		</tr>
	</table>
	<button type="button" onclick="location.href='/myapp/hr/list'">뒤로가기</button>
	<input type="submit" value="제출">
	<input type="reset" value="초기화">
	
</form>
</div>
</body>
</html>