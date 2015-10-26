<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Spring MVC Form Handling</title>
</head>
<body>

	<h2>Submitted Student Information</h2>
	<table>
		<tr>
			<td>Name</td>
			<td>${name}</td>
		</tr>
		<tr>
			<td>Employee ID</td>
			<td>${empid}</td>
		</tr>
		<tr>
			<td>DOB</td>
			<td>${dob}</td>
		</tr>
		<tr>
			<td>Experience</td>
			<td>${experience}</td>
		</tr>
		<tr>
			<td>Logistics</td>
			<td>${logistics}</td>
		</tr>
		<tr>
			<td>Arrange</td>
			<td>${arrange}</td>
		</tr>
	</table>
</body>
</html>