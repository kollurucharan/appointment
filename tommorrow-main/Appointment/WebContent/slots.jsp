<%@ page language="java" import="java.util.*,com.models.*" contentType="text/html; charset=ISO-8859-1" import="java.util.*,com.models.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Green Buttons</title>
    <style>
        .green-button {
       		 background-color:green;
            color: white;
            padding: 10px 20px																																																
            border: none;
            cursor: pointer;
            margin: 5px;
            border-radius: 5px;
        }
        .red-button {
        background-color:red;
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
<% ArrayList<SlotClass> slist=(ArrayList<SlotClass>)request.getAttribute("slot");

%>
 <h1>Slot booking</h1>
<div id="xyz"></div>
<script >var xy=document.getElementById("xyz");</script>
   
    <%for(SlotClass i:slist){
    	
%><script>
	var button=document.createElement("input");
	button.type="button";
	button.id=<%=i.getSlotid()%>;
	button.value='<%=i.getSlotfrom()%>-<%=i.getSlotto()%>';
	button.setAttribute("date",'<%=i.getSlotdate()%>');
	button.setAttribute("from",'<%=i.getSlotfrom()%>');
	button.setAttribute("to",'<%=i.getSlotto()%>');
	button.setAttribute("docid",<%=i.getSlotdoctorid()%>);
	if('<%=i.getSlotstatus()%>'==="Available"){
		button.classList.add("green-button");
		button.addEventListener("click",function(){
			console.log(this.getAttribute("from"));
			window.location.href=
				"register?from="+this.getAttribute("from")+"&to="+this.getAttribute("to")+"&id="+this.getAttribute("docid")+"&date="+this.getAttribute("date");
		});
	}else{

		button.classList.add("red-button");
	}
	
	xy.appendChild(button);
</script>
    	
	<%} %>
	
	
    
</body>
</html>
