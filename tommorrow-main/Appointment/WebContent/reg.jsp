<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <center>
        <form id="patientForm" action="PatientForm" method="get">
        
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required></br></br>
            
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required></br></br>
            
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required></br></br>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select></br></br>
            
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" pattern="[0-9]{10}" required></br></br>
            
            <!-- Hidden input fields for model attributes -->
            <input type="hidden" id="docid" name="docid" value="${docid}">
            <input type="hidden" id="from" name="from" value="${from}">
            <input type="hidden" id="to" name="to" value="${to}">
            <input type="hidden" id="dates" name="dates" value="${dates}">
            
            <button type="submit">Submit</button>
        </form>
    </center>
</body>
</html>
