<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page session="true"%>
<html>
<head>
<title>Task Home</title>

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.3.min.js">
	//Validating Empty Field
	function check_empty() {
		if (document.getElementById('name').value == ""
				|| document.getElementById('email').value == ""
				|| document.getElementById('msg').value == "") {
			alert("Fill All Fields !");
		} else {
			document.getElementById('form').submit();
			alert("Form Submitted Successfully...");
		}
	}

	//Function To Display Popup
	//function div_show() {
		//$(document).ready( function() {
			//$("#form").on('click', '#popup', function () {
			$("#popup").click( function() {
				console.log("Gorilla: ");
				document.getElementById('abc').style.display = "block";
				//var inputValue = $(this).closest("tr").find("input[type=text]").val();
				//var selectValuse = $(this).closest("tr").find("[name='select_job']").val();
				var table = document.getElementById('myTable');
				var rowindex = $(this).closest("tr").index();
				var taskidvalue = table.rows[rowindex].cells[0].innerHTML;

				console.log("Elephant: " + taskidvalue);

				var deptvalue = table.rows[rowindex].cells[1].innerHTML;
				var empidvalue = table.rows[rowindex].cells[2].innerHTML;
				var empnamevalue = table.rows[rowindex].cells[3].innerHTML;

				document.getElementById("mytaskid").value = taskidvalue;
				document.getElementById("mydept").value = deptvalue;
				document.getElementById("myempid").value = empidvalue;
				document.getElementById("myempname").value = empnamevalue;

				//document.getElementById("theRowIndex").innerHTML = rowindex;

			});
		//});
	//}

	//Function to Hide Popup
	function div_hide() {
		document.getElementById('abc').style.display = "none";
	}
</script>

<style>
#task-list {
	width: 700px;
	padding: 20px;
	margin: 100px auto;
	margin-top: 50px;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #3399ff;
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
	/*E3E6E8*/
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
	margin-top: 150px;
	margin-left: 60px;
	margin-bottom: 10px;
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
#abc {
	width: 100%;
	height: 100%;
	opacity: .95;
	top: 0;
	left: 0;
	display: none;
	position: fixed;
	background-color: #313131;
	overflow: auto
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
	margin-left: -202px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

form.status {
	max-width: 300px;
	min-width: 250px;
	padding: 10px 50px;
	border: 2px solid gray;
	border-radius: 10px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	background-color: #fff;
	font-weight: 300;
}

p {
	margin-top: 30px
}

hr {
	margin: 10px -50px;
	border: 0;
	border-top: 1px solid #ccc
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

#name {
	background-image: url(../images/name.jpg);
	background-repeat: no-repeat;
	background-position: 5px 7px
}

#email {
	background-image: url(../images/email.png);
	background-repeat: no-repeat;
	background-position: 5px 7px
}

textarea {
	background-image: url(../images/msg.png);
	background-repeat: no-repeat;
	background-position: 5px 7px;
	width: 82%;
	height: 95px;
	padding: 10px;
	resize: none;
	margin-top: 30px;
	border: 1px solid #ccc;
	padding-left: 40px;
	font-size: 16px;
	font-family: raleway;
	margin-bottom: 30px
}

#submit {
	text-decoration: none;
	width: 100%;
	text-align: center;
	background-color: #FFBC00;
	color: #fff;
	border: 1px solid #FFCB00;
	padding: 10px 0;
	font-size: 20px;
	cursor: pointer;
	border-radius: 5px;
	display: inline-block;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

#cancel {
	text-decoration: none;
	width: 100%;
	text-align: center;
	background-color: #FFBC00;
	color: #fff;
	border: 1px solid #FFCB00;
	padding: 10px 0;
	font-size: 20px;
	cursor: pointer;
	border-radius: 5px;
	display: inline-block;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

button {
	height: 45px;
	border-radius: 3px;
	background-color: #cd853f;
	color: #fff;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	cursor: pointer;
}

th {
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	color: #3C3D3D;
}

td, h2, h1 {
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	color: #3C3D3D;
}

table, th, td {
	text-align: left;
}
</style>
</head>
<body>
	<!--  	<?php
 	echo "HELLOOO";
if(isset($_POST['approve'])){
	$dbhost = 'localhost:3036';
	$dbuser = 'root';
	$dbpass = 'root';
	$conn = mysql_connect($dbhost, $dbuser, $dbpass);
	if(! $conn ){
		echo "Elephant cannot connect";
  		die('Could not connect: ' . mysql_error());
	}
	echo "Parrot connected";

	$taskid = $_POST['theTaskID'];

	$sql = "UPDATE tasksForUser ".
       "SET status = 'Approved' ".
       "WHERE taskid = $taskid" ;

	mysql_select_db('karen');
	$retval = mysql_query( $sql, $conn );
	if(! $retval ){
		echo "Jaguar cannot update";
  		die('Could not update data: ' . mysql_error());
	}
	echo "Updated data successfully\n";
	echo "Cougar update success";
	mysql_close($conn);
	}else{
?>
-->

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
		<h1>My Tasks</h1>
	</center>

	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/karen" user="root" password="root" />

	<sql:query var="listTasks" dataSource="${myDS}">
        SELECT * FROM tasksForUser;
    </sql:query>

	<div align="center">

		<table border="1" id="myTable">
			<caption>
				<h2>Employee Details</h2>
			</caption>
			<tr>
				<th>Task ID</th>
				<th>Department</th>
				<th>Employee ID</th>
				<th>Employee Name</th>
				<th>Status</th>
			</tr>
			<c:forEach var="task" items="${listTasks.rows}" varStatus="eachrow">
				<tr>
					<td><c:out value="${task.taskid}" /></td>
					<td><c:out value="${task.dept}" /></td>
					<td><c:out value="${task.empid}" /></td>
					<td><c:out value="${task.empname}" /></td>
					<td><c:out value="${task.status}" /></td>
					<td><div id="abc">
							<div id="popupContact">
								<form action="/OnboardingIbos/approvetask" id="form"
									class="status" method="post" name="form">

									<h2>Change Status</h2>
									<table width=100%>
										<tr>
											<th>Task ID</th>
											<th>Department</th>
											<th>Employee ID</th>
											<th>Employee Name</th>
										</tr>
										<tr>
											<td><input type="text" id="mytaskid" name="mytaskid"
												value=""></input> <input type="hidden" name="taskid"
												value="${task.taskid}" /></td>
											<td><input type="text" id="mydept" name="mydept"
												value=""></input> <input type="hidden" name="dept"
												value="${task.dept}" /></td>
											<td><input type="text" id="myempid" name="myempid"
												value=""></input> <input type="hidden" name="empid"
												value="${task.empid}" /></td>
											<td><input type="text" id="myempname" name="myempname"
												value=""></input> <input type="hidden" name="empname"
												value="${task.empname}" /></td>
										</tr>
									</table>
									<hr>
									<!-- <input id="name" name="name" placeholder="Name" type="text">
									<textarea id="msg" name="message" placeholder="Message"></textarea> -->
									<input id="approve" name="approve" type="submit"
										value="Approve">
									<!-- <a href="javascript:%20check_empty()" id="cancel" onclick="div_hide()" width=50%>Cancel</a> -->
									<!-- <img id="close" src="images/3.png" onclick="div_hide()"> -->

									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
							</div>
						</div>
						<button id="popup" >Details</button></td>
				</tr>
			</c:forEach>
		</table>
		<!-- <input type="hidden" name="thetaskid" value="365005"> -->
	</div>
</body>
</html>