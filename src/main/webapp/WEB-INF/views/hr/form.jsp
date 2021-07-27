<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
<c:url var="actionURL" value="/hr/insert" scope="page"></c:url>
<form:form action="${actionURL}" modelAttribute="emp">
	<table border="1">
		<tr>
			<th>사원번호</th>
			<td><form:input path="employeeId"/>
				<form:errors path="employeeId" class="error"/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<form:input path="firstName"/>
				<form:errors path="firstName" class="error"/>
			</td>
		</tr>
		<tr>
			<th>성</th>
			<td>
				<form:input path="lastName"/>
				<form:errors path="lastName" class="error"/>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<form:input path="email"/>
				<form:errors path="email" class="error"/>
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<form:input path="phoneNumber"/>
				<form:errors path="phoneNumber" class="error"/>
			</td>
		</tr>
		<tr>
			<th>입사일</th>
			<td>
				<form:input path="hireDate" type="date" required="required"/>
				<form:errors path="hireDate" class="error"/>
			</td>
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
			<td>
				<form:input path="salary" type="number" />
				<form:errors path="salary" class="error"/>
			</td>
		</tr>
		<tr>
			<th>보너스율</th>
			<td>
				<form:input path="commissionPct" type="number"/>
				<form:errors path="commissionPct" class="error"/>
			</td>
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
	
</form:form>
</div>
</body>
</html>