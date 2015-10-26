<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page session="true"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Task Home</title>
<link rel="stylesheet"
	src="https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.3/normalize.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300'
	rel='stylesheet' type='text/css'>
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script>
	//Function To Display Popup
	function div_show() {
		$(document).ready(function() {
			//$("#form").on('click', '#popup', function () {
			$(".any-button").click(function() {
				console.log("Gorilla: ");
				document.getElementById('abc').style.display = "block";

				var table = document.getElementById('myTable');
				var rowindex = $(this).closest("tr").index();

				var taskidvalue = table.rows[rowindex].cells[0].innerHTML;
				var deptvalue = table.rows[rowindex].cells[1].innerHTML;
				var empidvalue = table.rows[rowindex].cells[2].innerHTML;
				var empnamevalue = table.rows[rowindex].cells[3].innerHTML;

				document.getElementById("mytaskid").value = taskidvalue;
				document.getElementById("mydept").value = deptvalue;
				document.getElementById("myempid").value = empidvalue;
				document.getElementById("myempname").value = empnamevalue;

			});
		});
	}

	//Function to Hide Popup
	function div_hide() {
		document.getElementById('abc').style.display = "none";
	}
</script>

<style>

.msg {
	padding: 10px;
	margin-bottom: 10px;
	text-align: center;
	border: 1px solid transparent;
	border-radius: 3px;
	color: #31708f;
	background-color: #C2E6F8;
}

#task-list {
	width: 700px;
	padding: 20px;
	margin: 100px auto;
	margin-top: 50px;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 2px solid #C5C6C7;
}

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

.links {
	float: right;
	margin-right: 10px;
}

#social_media {
	margin-left: 60px;
	margin-bottom: -10px;
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

/*----------------------------------------------
CSS settings for HTML div Exact Center
------------------------------------------------*/
#abc, #abcd {
	width: 100%;
	height: 100%;
	opacity: .95;
	top: 0;
	left: 0;
	display: none;
	position: fixed;
	background-color: #313131;
	overflow: auto;
}

img#close {
	position: absolute;
	right: -14px;
	top: -14px;
	cursor: pointer
}

div#popupContact {
	position: absolute;
	left: 50%;
	top: 17%;
	margin-left: -200px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

form.status {
	padding: 10px 50px;
	border: 2px solid #2E64FE;
	border-radius: 10px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	background-color: #fff;
	opacity: 1;
	font-weight: 300;
}

p {
	margin-top: 30px
}

hr {
	margin: 10px -50px;
	border: 0;
	border-top: 1px solid #BCC5DF;
	margin-top: 20px;
	margin-bottom: 30px;
}

input[type=text] {
	width: 82%;
	padding: 10px;
	margin-top: 30px;
	border: 1px solid #ccc;
	padding-left: 40px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

button { /* for Details button */
	height: 45px;
	border-radius: 3px;
	background-color: #cd853f;
	color: #fff;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	cursor: pointer;
}

td, h2, h1, h3 {
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	color: #3C3D3D;
}

th {
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	color: #3C3D3D;
}

table, th, td {
	text-align: left;
}

.any-button, .any-button:visited {
	min-width: 40px;
	text-align: center;
	color: #444;
	font-weight: 300;
	height: 36px;
	padding: 0 8px;
	line-height: 36px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 1px;
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

.submit-button:hover, .any-button:hover {
	color: #606161;
	background-color: #BCC5DF;
}

.submit-button, .submit-button:visited {
	border: 1px solid #A4A4A4;
	color: #3C3D3D;
	background-color: #fff;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	font-size: 18;
	padding: 10px;
	padding-left: 20px;
	padding-right: 20px;
	margin-top: -15px;
}

h2 {
	margin-top: 30px;
	margin-bottom: 30px;
	font-weight: 400;
}

h3 {
	margin-top: 40px;
	margin-bottom: 20px;
	font-size: 25;
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
	/*	z-index: 10;*/
	height: 4.5em;
	margin-top: -4.5em;
}

#content {
	padding-bottom: 4.5em;
}

h1 {
	margin-top: 40px;
}

input.show {
	padding: 0px;
	margin: 0px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	color: #3C3D3D;
	border: none;
	font-size: 16;
}

.center {
	text-align: center;
}
</style>
</head>
<body id="body" style="overflow: auto;">


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


		<div id="header">
			<div id="toolbar">
				<ul>
					<li class="logo"><img
						src="https://classic.regonline.com/custImages/350000/352476/Incessant-Logo.png"
						alt="incessant" style="width: 150px" align="middle"></li>
					<li><a href='/OnboardingIbos/mytasks' class='topnav_mytasks'
						title='My Tasks'>My Tasks</a></li>
					<c:if
						test="${pageContext.request.userPrincipal.name == 'abhishek'}">
						<li><a href='/OnboardingIbos/newemp' class='topnav_newemp'
							title='New Employee'>New Employee</a></li>
					</c:if>
					<c:if
						test="${pageContext.request.userPrincipal.name == 'abhishek'}">
						<li><a href='/OnboardingIbos/emptable' class='topnav_reports'
							title='Reports'>Reports</a></li>
					</c:if>
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<li class="logout"><a href="javascript:formSubmit()">
								Logout</a></li>
					</c:if>
				</ul>


			</div>
		</div>

		<div id="content">
			<!------------------------------------------	
                  NO LOGIN
 ------------------------------------------>

			<c:if test="${pageContext.request.userPrincipal.name == null}">
				<h4 align="center" class="redirect">
					You do not have access to this page. Please <a
						href='/OnboardingIbos/login' class='redirect_login' title='Login'>login</a>
					to proceed.
				</h4>
			</c:if>
			<!------------------------------------------	
                  HR LOGIN
 ------------------------------------------>

			<c:if test="${pageContext.request.userPrincipal.name == 'abhishek'}">

				<div align="center">
					<center>
						<h1>HR Tasks</h1>
					</center>

					<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
						url="jdbc:mysql://localhost/karen" user="root" password="root" />

					<sql:query var="listTasks" dataSource="${myDS}">
					        SELECT * FROM tasksForUser; 
				    </sql:query>

					<div align="center" id="task-list">
					<c:if test="${not empty msg}">
						<div class="msg">${msg}</div>
					</c:if>

						<table width=100% cellspacing="10" id="myTable">
							<tr>
								<th width=11%>Task ID</th>
								<th width=16% class="center">Dept</th>
								<th width=22%>Employee ID</th>
								<th width=35%>Employee Name</th>
								<th width=16%>Status</th>
<!-- 								<th width=20% class="center">Change Status</th> -->
							</tr>
							<c:forEach var="task" items="${listTasks.rows}"
								varStatus="eachrow">
								<tr>
									<td><c:out value="${task.taskid}" /></td>
									<td class="center"><c:out value="${task.dept}" /></td>
									<td><c:out value="${task.empid}" /></td>
									<td><c:out value="${task.empname}" /></td>
									<td><c:out value="${task.status}" /></td>
									<%-- <td class="center"><div id="abc">
											<div id="popupContact">
												<form action="/OnboardingIbos/approvetask" id="form"
													class="status" method="post" name="form">

													<h2 align="center">Change Status</h2>
													<table width=100% cellspacing="10">

														<tr>
															<th>Task ID</th>
															<td><input type="text" id="mytaskid" name="processId"
																class="show" readonly></input></td>
														</tr>
														<tr>
															<th>Department</th>
															<td><input type="text" id="mydept" name="dept"
																class="show" readonly></input></td>
														</tr>
														<tr>
															<th>Employee ID</th>
															<td><input type="text" id="myempid" name="empid"
																class="show" readonly></input></td>
														</tr>
														<tr>
															<th>Employee Name</th>
															<td><input type="text" id="myempname" name="empname"
																class="show" readonly></input></td>
														</tr>

													</table>
													<hr>
													<table align="center" cellspacing="20">
														<tr>
															<td><input id="approve" name="approve"
																class="submit-button" type="submit" value="Approve"></td>
															<td><input id="reset" name="reset"
																class="submit-button" onclick="div_hide()" type="button"
																value="Cancel"></td>
														</tr>
													</table>
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" />
												</form>
											</div>
										</div>
										<button id="popup" class="any-button" onclick="div_show()">Details</button></td> --%>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</c:if>

			<!------------------------------------------	
                  ADMIN LOGIN
 ------------------------------------------>

			<c:if test="${pageContext.request.userPrincipal.name == 'karen'}">

				<div align="center">
					<center>
						<h1>Admin Tasks</h1>
					</center>

					<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
						url="jdbc:mysql://localhost/karen" user="root" password="root" />

					<sql:query var="listTasks" dataSource="${myDS}">
					        SELECT * FROM tasksForUser; 
				    </sql:query>

					<div align="center" id="task-list">
					<c:if test="${not empty msg}">
						<div class="msg">${msg}</div>
					</c:if>

						<table width=100% cellspacing="10" id="myTable">
							<tr>
								<th width=12%>Task ID</th>
								<th width=10% class="center">Dept</th>
								<th width=18%>Employee ID</th>
								<th width=25%>Employee Name</th>
								<th width=15%>Status</th>
								<th width=20% class="center">Change Status</th>
							</tr>
							<c:forEach var="task" items="${listTasks.rows}"
								varStatus="eachrow">
								<tr>
									<td><c:out value="${task.taskid}" /></td>
									<td class="center"><c:out value="${task.dept}" /></td>
									<td><c:out value="${task.empid}" /></td>
									<td><c:out value="${task.empname}" /></td>
									<td><c:out value="${task.status}" /></td>
									<td class="center"><div id="abc">
											<div id="popupContact">
												<form action="/OnboardingIbos/approvetask" id="form"
													class="status" method="post" name="form">

													<h2 align="center">Change Status</h2>
													<table width=100% cellspacing="10">

														<tr>
															<th>Task ID</th>
															<td><input type="text" id="mytaskid" name="taskid"
																class="show" readonly></input></td>
														</tr>
														<tr>
															<th>Department</th>
															<td><input type="text" id="mydept" name="dept"
																class="show" readonly></input></td>
														</tr>
														<tr>
															<th>Employee ID</th>
															<td><input type="text" id="myempid" name="empid"
																class="show" readonly></input></td>
														</tr>
														<tr>
															<th>Employee Name</th>
															<td><input type="text" id="myempname" name="empname"
																class="show" readonly></input></td>
														</tr>

													</table>
													<hr>
													<table align="center" cellspacing="20">
														<tr>
															<td><input id="approve" name="approve"
																class="submit-button" type="submit" value="Approve"></td>
															<td><input id="reset" name="reset"
																class="submit-button" onclick="div_hide()" type="button"
																value="Cancel"></td>
														</tr>
													</table>
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" />
												</form>
											</div>
										</div>
										<button id="popup" class="any-button" onclick="div_show()">Details</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

			</c:if>

			<!------------------------------------------	
                  IT LOGIN
 ------------------------------------------>

			<c:if test="${pageContext.request.userPrincipal.name == 'emilyb'}">

				<div align="center">
					<center>
						<h1>IT Tasks</h1>
					</center>

					<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
						url="jdbc:mysql://localhost/karen" user="root" password="root" />

					<sql:query var="listTasks" dataSource="${myDS}">
					        SELECT * FROM tasksForUser; 
				    </sql:query>

					<div align="center" id="task-list">
					<c:if test="${not empty msg}">
						<div class="msg">${msg}</div>
					</c:if>

						<table width=100% cellspacing="10" id="myTable">
							<tr>
								<th width=12%>Task ID</th>
								<th width=10% class="center">Dept</th>
								<th width=18%>Employee ID</th>
								<th width=25%>Employee Name</th>
								<th width=15%>Status</th>
								<th width=20% class="center">Change Status</th>
							</tr>
							<c:forEach var="task" items="${listTasks.rows}"
								varStatus="eachrow">
								<tr>
									<td><c:out value="${task.taskid}" /></td>
									<td class="center"><c:out value="${task.dept}" /></td>
									<td><c:out value="${task.empid}" /></td>
									<td><c:out value="${task.empname}" /></td>
									<td><c:out value="${task.status}" /></td>
									<td class="center"><div id="abc">
											<div id="popupContact">
												<form action="/OnboardingIbos/approvetask" id="form"
													class="status" method="post" name="form">

													<h2 align="center">Change Status</h2>
													<table width=100% cellspacing="10">

														<tr>
															<th>Task ID</th>
															<td><input type="text" id="mytaskid"
																name="processId" class="show" readonly></input></td>
														</tr>
														<tr>
															<th>Department</th>
															<td><input type="text" id="mydept" name="dept"
																class="show" readonly></input></td>
														</tr>
														<tr>
															<th>Employee ID</th>
															<td><input type="text" id="myempid" name="empid"
																class="show" readonly></input></td>
														</tr>
														<tr>
															<th>Employee Name</th>
															<td><input type="text" id="myempname" name="empname"
																class="show" readonly></input></td>
														</tr>

													</table>
													<hr>
													<table align="center" cellspacing="20">
														<tr>
															<td><input id="approve" name="approve"
																class="submit-button" type="submit" value="Approve"></td>
															<td><input id="reset" name="reset"
																class="submit-button" onclick="div_hide()" type="button"
																value="Cancel"></td>
														</tr>
													</table>
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" />
												</form>
											</div>
										</div>
										<button id="popup" class="any-button" onclick="div_show()">Details</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

			</c:if>

		</div>
		<!-- content -->
	</div>
	<!-- #wrapper -->



	<div id="footer">

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
	</div>
	<!-- #footer -->

</body>
</html>
