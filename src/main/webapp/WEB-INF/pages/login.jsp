<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300'
	rel='stylesheet' type='text/css'>

<style>
.error {
	padding: 10px;
	margin-bottom: 10px;
	text-align: center;
	border: 1px solid transparent;
	border-radius: 3px;
	color: #930909;
	background-color: #FBA2A2;
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

#login-box {
	width: 300px;
	padding: 30px;
	margin: 70px auto;
	margin-top: 0px;
 	background: #ededed; 
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

body {
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	color: #3C3D3D;
}

a {
	text-decoration: none;
	color: #3C3D3D;
}

a:hover {
	color: #0101DF;
}

li {
	display: inline-block;
}

h2 {
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.links {
	float: right;
	margin-right: 10px;
}

.hidden-label {
	position: absolute !important;
	clip: rect(1px, 1px, 1px, 1px);
	height: 0px;
	width: 0px;
	overflow: hidden;
	visibility: hidden;
}

.submit-button {
	min-width: 46px;
	text-align: center;
	color: #444;
	font-size: 14px;
	font-weight: 300;
	height: 36px;
	padding: 0 8px;
	line-height: 36px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	-o-transition: all 0.218s;
	-moz-transition: all 0.218s;
	-webkit-transition: all 0.218s;
	transition: all 0.218s;
	border: 1px solid #dcdcdc;
	background-color: #f5f5f5;
	-o-transition: none;
	-moz-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

.submit-button, .submit-button:visited {
	color: #fff;
	text-shadow: 0 1px rgba(0, 0, 0, 0.1);
	background-color: #1A1D7F;
}

.submit-button:hover {
	color: #fff;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	background-color: #DF2B4C;
}

input {
	padding: 8px;
	margin: 10px;
	width: 90%;
	align: center;
}
</style>
</head>
<body onload='document.loginForm.username.focus();'>

	<center>
		<img
			src="https://classic.regonline.com/custImages/350000/352476/Incessant-Logo.png"
			alt="incessant" style="width: 300px; padding-top: 30px"
			align="middle">
	</center>

	<div id="login-box">

		<h2 align="center">Onboarding Portal</h2>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm'
			action="<c:url value='j_spring_security_check' />" method='POST'>

			<label class="hidden-label" for="Username">Username</label> <input
				id="Username" name="username" type="text" placeholder="Username"
				class=""> <input type="hidden" name="PersistentCookie"
				value="yes"> <label class="hidden-label" for="Passwd">Password</label>
			<input id="Passwd" name="password" type="password"
				placeholder="Password" class=""> <input type="hidden"
				name="PersistentCookie" value="yes"> 
				
				<input id="signIn"
				name="signIn" class="submit-button" type="submit" value="Sign in">

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>

	</div>

	<div id="footer_wrp">
		<div id="social_media" align="center">
			<a href="https://www.facebook.com/IncessantTechnologies"> <img
				border="0" alt="Facebook"
				src="https://cdn3.iconfinder.com/data/icons/free-social-icons/67/facebook_circle_color-512.png"
				width="40" height="40">
			</a> <a href="https://twitter.com/IncessantTech"> <img border="0"
				alt="Twitter"
				src="https://cdn3.iconfinder.com/data/icons/free-social-icons/67/twitter_circle_color-512.png"
				width="40" height="40">
			</a> <a href="http://www.linkedin.com/company/incessant-technologies">
				<img border="0" alt="LinkedIn"
				src="https://cdn3.iconfinder.com/data/icons/free-social-icons/67/linkedin_circle_color-512.png"
				width="40" height="40">
			</a> <a href="http://www.youtube.com/user/incessanttech"> <img
				border="0" alt="LinkedIn"
				src="https://cdn3.iconfinder.com/data/icons/free-social-icons/67/youtube_circle_color-512.png"
				width="40" height="40">
			</a>
		</div>

		<div id="main_wrp">
			<ul>
				<li>&copy; 2015 Incessant Technologies</li>

				<li class="links"><a
					href="http://www.incessanttechnologies.com/index.html">Main
						Site </a> <span>|</span> <a href="#nogo">Privacy Policy</a></li>

			</ul>
		</div>

	</div>

</body>
</html>