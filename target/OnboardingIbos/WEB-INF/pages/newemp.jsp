<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>New Employee Form</title>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

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

#new-employee {
	width: 600px;
	padding: 20px;
	margin: 100px auto;
	margin-top: 50px;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #3399ff;
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
<body onload='document.newEmployeeForm.username.focus();'>

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

	<center>
		<h1>New Employee Details Form</h1>
	</center>
	<div id="new-employee">

		<center>
			<h3>Fill out new employee details</h3>
		</center>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='newEmployeeForm' action="/OnboardingIbos/addEmployee"
			method='POST'>

			<table style="width: 90%">
				<tr>
					<td><font color = "red">* </font>Employee Name:</td>
					<td><input type='text' name='name' required></td>
				</tr>
				<tr>
					<td><font color = "red">* </font>Employee ID:</td>
					<td><input type='number' name='empid' required></td>
				</tr>
				<tr>
					<td><font color = "red">* </font>Employee DOB:</td>
					<td><input type='date' name='dob' required></td>
				</tr>
				<tr>
					<td><font color = "white">* </font>Experience:</td>
					<td><input type='text' name='experience' maxlength="500" /></td>
				</tr>
				<tr>
					<td> <font color = "white">* </font>Logistics:</td>
					<td><input type='checkbox' name='logistics' /></td>
				</tr>
				<tr>
					<td><font color = "white">* </font>IT Arrangements:</td>
					<td><input type='checkbox' name='arrange' /></td>
				</tr>
				<tr>
					<td><font color = "red" size = "2">* indicates required field.</font></td>
				</tr>
				<tr>
					<td colspan='1' style="text-align: center; padding-top: 15px"><input
						name="submit" type="submit" value="Submit" /></td>
					<td colspan='1' style="text-align: center; padding-top: 15px"><input
						name="reset" type="reset" value="Reset" /></td>
				</tr>
			</table>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>

	</div>


</body>
</html>