<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<html>
<head>
<title>New Employee Form</title>
<link rel="stylesheet"
	src="https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.3/normalize.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300'
	rel='stylesheet' type='text/css'>
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
	padding: 10px;
	margin-bottom: 10px;
	text-align: center;
	border: 1px solid transparent;
	border-radius: 3px;
	color: #31708f;
	background-color: #C2E6F8;
}

#new-employee {
	width: 600px;
	padding: 20px;
	margin: 100px auto;
	margin-top: 50px;
	margin-bottom: 50px;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
/*	border: 2px solid #ECEEEF; */
	border: 2px solid #C5C6C7;
	background: #fff;
}

#toolbar {
	padding: 0px;
	margin: -50px auto;
	margin-top: -20px;
	margin-bottom: 20px;
	margin-right: -25px;
	margin-left: -20px;
	background: #D0DDF0;
	margin-top: -20px;
	margin-bottom: 20px;
	margin-right: -25px;
	margin-left: -20px;
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
	margin-top: 10px;
	padding: -10px;
	padding-top: 10px;
	padding: -10px;
}

a:hover {
	color: #DF2B4C;
}

body {
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	color: #3C3D3D;
}

h1, h3 {
	font-weight: 300;
	color: #3C3D3D;
	font-family: 'Roboto', sans-serif;
}

h1 {
	margin-top: 40px;
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

td {
	padding: 12px;
	font-weight: 300;
	color: #3C3D3D;
	font-family: 'Roboto', sans-serif;
}

.submit-button:hover {
	color: #606161;
	background-color: #D0DDF0;
}

.submit-button, .submit-button:visited {
	border: 1px solid #D2D3D4;
	color: #3C3D3D;
	background-color: #fff;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	font-size: 15;
	padding: 10px;
	padding-left: 20px;
	padding-right: 20px;
	margin-bottom: -40px;
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
		<!-------------------------------------------  
		NON HR LOGIN 
		--------------------------------------------->

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
			<div id="content">
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

						<table style="width: 90%" id="table-form">
							<tr>
								<td><font color="red">* </font>Employee Name:</td>
								<td><input type='text' name='name' required></td>
							</tr>
							<tr>
								<td><font color="red">* </font>Employee ID:</td>
								<td><input type='number' name='empid' required></td>
							</tr>
							<tr>
								<td><font color="red">* </font>Employee DOB:</td>
								<td><input type='date' name='dob' required></td>
							</tr>
							<tr>
								<td><font color="white">* </font>Experience:</td>
								<td><input type='text' name='experience' maxlength="500" /></td>
							</tr>
							<tr>
								<td><font color="white">* </font>Logistics:</td>
								<td><input type='checkbox' name='logistics' /></td>
							</tr>
							<tr>
								<td><font color="white">* </font>IT Arrangements:</td>
								<td><input type='checkbox' name='arrange' /></td>
							</tr>
							<tr>
								<td><font color="red" size="2">* indicates required
										field.</font></td>
							</tr>
						</table>
						<table align="center" cellspacing="20">
							<tr>
								<td><input id="signIn" name="signIn" class="submit-button"
									type="submit" value="Submit"></td>
								<td><input id="reset" name="reset" class="submit-button"
									type="reset" value="Reset"></td>
							</tr>
						</table>

						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

					</form>

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