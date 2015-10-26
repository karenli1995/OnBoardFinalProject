<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP List Users Records</title>

<style>

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	font-style: bold;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#toolbar {
	padding: 10px;
	margin: 50px auto;
	margin-top: 0px;
	margin-bottom: 50px;
	color: white;
	background: #000000;
}

li {
	display: inline;
	padding: 20px;
}

a {
	color: white;
	text-decoration: none;
}

a:hover {
	color: #3399ff;
}

td {
	padding: 8px;
}

.logout {
	text-align: right;
}

body {
	font-family: sans-serif;
}
</style>

</head>
<body>

<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>

	<div id="toolbar">
		<ul>
			<li><a href='/OnboardingIbos/mytasks' class='topnav_mytasks'
				title='My Tasks'>My Tasks</a></li>
			<c:if test="${pageContext.request.userPrincipal.name == 'abhishek'}">
				<li><a href='/OnboardingIbos/newemp' class='topnav_newemp'
					title='New Employee'>New Employee</a></li>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name == 'abhishek'}">
				<li><a href='/OnboardingIbos/emptable' class='topnav_emptable'
					title='All Employee Details'>All Employee Details</a></li>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<li class="logout"><a href="javascript:formSubmit()">
						Logout</a></li>
			</c:if>
		</ul>
	</div>
	
	<c:if test="${not empty msg}">
		<div class="msg">${msg}</div>
	</c:if>
	
	<h1> </h1>

    <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost/karen"
        user="root" password="root"
    />
     
    <sql:query var="listEmployees"   dataSource="${myDS}">
        SELECT * FROM allEmployees;
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>Employee Details</h2></caption>
            <tr>
                <th>Name</th>
                <th>Employee ID</th>
                <th>Date of Birth</th>
                <th>Experience</th>
                <th>Logisitics</th>
                <th>Arrange</th>
            </tr>
            <c:forEach var="employee" items="${listEmployees.rows}">
                <tr>
                    <td><c:out value="${employee.name}" /></td>
                    <td><c:out value="${employee.empid}" /></td>
                    <td><c:out value="${employee.dob}" /></td>
                    <td><c:out value="${employee.experience}" /></td>
                    <td><c:out value="${employee.logistics}" /></td>
                    <td><c:out value="${employee.arrange}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>