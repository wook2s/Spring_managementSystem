<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		p{
		text-align: center;
		}
		table a { text-decoration: none; }
		table a:link { color:blue; text-decoration: none;}
		table a:visited { color:blue; text-decoration: none;}
		a { text-decoration: none; }
		a:link { color:black; text-decoration: none;}
		a:visited { color:black; text-decoration: none;}
		#container{ margin-top: 20px; margin-left: 150px}
		
	</style>
</head>
<body>

<c:if test="${message != null}">
	<script>
	window.onload =function () {
		   window.open("popup.jsp",  "error", "width=300, height=360");
		}
	</script>
</c:if>

<div id="container">
<h1>전체 사원 정보 확인</h1>
	<button type="button" onclick="location.href='/myapp/hr/insert'">사원 추가하기</button>
	<table border="1">
		<tr>
			<th>사원 번호
				<a href="<c:url value='/hr'/>">△</a>
				<a href="<c:url value='/hr2'/>">▽</a>
			</th>
			<th>성</th>
			<th>이름</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>입사일</th>
			<th>직무ID</th>
			<th>연봉</th>
			<th>보너스율</th>
			<th>매니저ID</th>
			<th>부서ID</th>
		</tr>
		<c:forEach var="emp" items="${empList}">
		<tr>
			<th>
				<a href="<c:url value='/hr/${emp.employeeId}'/>" >${emp.employeeId}</a>
			</th>
			<th>${emp.firstName}</th>
			<th>${emp.lastName}</th>
			<th>${emp.email}</th>
			<th>${emp.phoneNumber}</th>
			<th>${emp.hireDate}</th>
			<th>${emp.jobId}</th>
			<th>${emp.salary}</th>
			<th>${emp.commissionPct}</th>
			<th>${emp.managerId}</th>
			<th>${emp.departmentId}</th>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>