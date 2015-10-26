<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reports</title>
<link rel="stylesheet"
	src="https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.3/normalize.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300'
	rel='stylesheet' type='text/css'>

<style>

#toolbar {
	padding: 0px;
	margin: -50px auto;
	margin-top: -20px;
	margin-bottom: 20px;
	margin-right: -25px;
	margin-left: -20px;
	background: #D0DDF0;
}

li {
	display: inline-block;
	padding-left: 15px;
	padding-right: 15px;
}

a {
	color: #3C3D3D;
	text-decoration: none;
	font-weight: 300;
}

.logout {
	float: right;
	margin-right: 50px;
	margin-top: 40px;
}

.logo {
	margin: 0px;
	padding: -10px;
	margin-top: 10px;
	padding-top: 10px;
}

a:hover {
	color: #DF2B4C;
}

h1 {
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	color: #3C3D3D;
	margin-top: 40px;
}

td {
	padding: 8px;
}

th {
	text-align: left;
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	background-color: /*#C5C6C7*/ #ECEEEF;
	padding-top: 10px;
	padding-bottom: 7px;
}

body {
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	color: #3C3D3D;
}

.links a {
	text-decoration: none;
	color: #3C3D3D;
	font-weight: 300;
}

.links a:hover {
	color: #0101DF;
}

li {
	display: inline-block;
}

.links {
	float: right;
	margin-right: 10px;
}

#social_media {
	margin-left: 60px;
	margin-bottom: -10px;
}

html, body, #wrapper {
	height: 100%;
}

body>#wrapper {
	height: auto;
	min-height: 100%;
}

#footer {
	clear: both;
	position: relative;
	z-index: 10;
	height: 4.5em;
	margin-top: -4.5em;
}

#content {
	padding-bottom: 4.5em;
}

#report {
	margin-bottom: 30px;
	width: 700px;
	padding: 20px;
	margin: 100px auto;
	margin-top: 20px;
	margin-bottom: 50px;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

h4 {
	color: red;
	font-weight: 300;
}

.redirect a {
	color: red;
	text-decoration: underline;
}

.redirect a:hover {
	color: #000;
}

table {
  border-collapse: collapse;
}
tr { 
  border: solid;
  border-width: 1px 0;
/*   border-color: #ECEEEF; */
  border-color: #C5C6C7;
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

	<div id="wrapper">
		<div id="toolbar">
			<ul>
				<li class="logo"><img
					src="https://classic.regonline.com/custImages/350000/352476/Incessant-Logo.png"
					alt="incessant" style="width: 150px" align="middle"></li>
				<li><a href='/OnboardingIbos/mytasks' class='topnav_mytasks'
					title='My Tasks'>My Tasks</a></li>
				<c:if test="${pageContext.request.userPrincipal.name == 'abhishek'}">
					<li><a href='/OnboardingIbos/newemp' class='topnav_newemp'
						title='New Employee'>New Employee</a></li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name == 'abhishek'}">
					<li><a href='/OnboardingIbos/emptable' class='topnav_reports'
						title='Reports'>Reports</a></li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<li class="logout"><a href="javascript:formSubmit()">
							Logout</a></li>
				</c:if>
			</ul>
		</div>

		<c:if test="${pageContext.request.userPrincipal.name == null}">
			<h4 align="center" class="redirect">
				You do not have access to this page. Please <a
					href='/OnboardingIbos/login' class='redirect_login' title='Login'>login</a> to proceed.
			</h4>
		</c:if>
		
		<c:if test="${pageContext.request.userPrincipal.name == 'emilyb'}">
			<h4 align="center" class="redirect">
				You do not have access to this page. Please visit the <a href='/OnboardingIbos/mytasks' class='redirect_login'
					title='Tasks'>task page</a> to proceed.
			</h4>
		</c:if>
		<c:if test="${pageContext.request.userPrincipal.name == 'karen'}">
			<h4 align="center" class="redirect">
				You do not have access to this page. Please visit the <a href='/OnboardingIbos/mytasks' class='redirect_login'
					title='Tasks'>task page</a> to proceed.
			</h4>
		</c:if>

		<c:if test="${pageContext.request.userPrincipal.name == 'abhishek'}">
			<div id=content>

				<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://localhost/karen" user="root" password="root" />

				<sql:query var="listEmployees" dataSource="${myDS}">
       			 SELECT * FROM allEmployees;
    			</sql:query>
				<center>
					<h1>Employee Details</h1>
				</center>
				<div align="center" id="report">
					<table cellpadding="5" cellspacing="10" width="100%">

						<tr>
							<th>Name</th>
							<th>Employee ID</th>
							<th>Date of Birth</th>
							<th>Experience</th>
							<th>Logistics</th>
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
			</div>
		</c:if>
	</div>
	
	
	
	<div id="footer_wrp">
		<div id="social_media" align="left">
			<a href="https://www.facebook.com/IncessantTechnologies"> <img
				border="0" alt="Facebook"
				src="https://cdn3.iconfinder.com/data/icons/free-social-icons/67/facebook_circle_color-512.png"
				width="35" height="35">
			</a> <a href="https://twitter.com/IncessantTech"> <img border="0"
				alt="Twitter"
				src="https://cdn3.iconfinder.com/data/icons/free-social-icons/67/twitter_circle_color-512.png"
				width="35" height="35">
			</a> <a href="http://www.linkedin.com/company/incessant-technologies">
				<img border="0" alt="LinkedIn"
				src="https://cdn3.iconfinder.com/data/icons/free-social-icons/67/linkedin_circle_color-512.png"
				width="35" height="35">
			</a> <a href="http://www.youtube.com/user/incessanttech"> <img
				border="0" alt="LinkedIn"
				src="https://cdn3.iconfinder.com/data/icons/free-social-icons/67/youtube_circle_color-512.png"
				width="35" height="35">
			</a>
		</div>

		<div id="main_wrp">
			<ul>
				<li>&copy; 2015 Incessant Technologies</li>

				<li class="links"><a
					href="http://www.incessanttechnologies.com/">Main Site </a> <span>|</span>
					<a href="#nogo">Privacy Policy</a></li>

			</ul>
		</div>
	</div>
</body>
</html>