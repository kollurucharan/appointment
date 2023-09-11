<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.*,com.models.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
/* CSS styles for the page */
body {
	font-family: Arial, sans-serif;
}

h1 {
	text-align: center;
}

.doctors-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.doctor-card {
	border: 1px solid #ccc;
	padding: 10px;
	margin: 10px;
	width: 300px; /* Adjust as needed */
}

img {
	max-width: 100%;
	height: auto;
}
/* Add more CSS styles as needed */
.button-link {
	display: inline-block;
	padding: 10px 20px; /* Adjust padding as needed */
	background-color: #007bff; /* Button background color */
	color: #fff; /* Button text color */
	text-decoration: none; /* Remove underline from the link */
	border: none; /* Remove border */
	border-radius: 5px; /* Add rounded corners */
	cursor: pointer; /* Change cursor on hover for better usability */
	font-weight: bold; /* Make the text bold */
}

.button-link:hover {
	background-color: #0056b3; /* Change background color on hover */
}
</style>
</head>
<body>
	<%
		ArrayList<Specialization> specList = (ArrayList<Specialization>) request.getAttribute("specList");
	ArrayList<Doctor> docList = (ArrayList<Doctor>) request.getAttribute("docList");
	%>
		<h1>Likhita Hospital</h1>
		<br>
		<br>
		<br>
		<form action="seloption" method="get">
			<label><b>Select specialization:</b></label> <select id="spec"
				name="specialization_name">
				<option>All</option>
				<%
					for (Specialization sp : specList) {
				%>
				<option value="<%=sp.getSpecialization_name()%>"><%=sp.getSpecialization_name()%></option>
				<%
					}
				%>
			</select> <input type="submit" value="submit">
		</form>
		<div class="doctors-container">
			<%
				for (Doctor doctor : docList) {
			%>
			<div class="doctor-card">
				<img src='<%=doctor.getPhoto()%>'></img>
				<p>
					Doctor name:<%=doctor.getFullname()%></p>
				<p>
					Doctor designation:<%=doctor.getDesignation()%></p>
				<p>
					Doctor qualification:<%=doctor.getQualification()%></p>
				<p>
					Doctor experience:<%=doctor.getExperience()%></p>
				<a href="control2?doctorId=<%=doctor.getDoctorid()%>" name='<%=doctor.getDoctorid()%>'
					class="button-link">View slot</a>
			</div>
			<%
				}
			%>
		</div>
	<script>
		
	</script>
</body>
</html>