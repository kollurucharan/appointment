<%@ page language="java" import="java.util.*,com.models.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Green Buttons</title>
    <style>
        .green-button {
            background-color: green;
            color: white;
            padding: 10px 20px																																																
            border: none;
            cursor: pointer;
            margin: 5px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<% ArrayList<DocSchedule> dslist=(ArrayList<DocSchedule>)request.getAttribute("scheduleList");
%>

    <h1>Slot booking</h1>
    		<button type="submit" class="green-button">09:00-11:00</button>
    			<button type="submit" class="green-button">14:00-17:00</button>
    		
    
       
   
</body>
</html>
