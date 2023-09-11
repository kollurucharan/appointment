<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.models.*,java.util.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>dates</title>
<style>
    #slots {
        text-align: left;
        margin-top: 10px; /* Add space above the buttons */
    }


    #slots input[type="button"] {
        margin: 5px;
        padding: 10px 20px; 
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease; /* Add a smooth hover effect */
    }

    #slots input[type="button"]:hover {
        background-color: #0056b3; /* Change background color on hover */
    }
</style>
</head>
<body>
<% ArrayList<DocSchedule> dslist=(ArrayList<DocSchedule>)request.getAttribute("scheduleList");
//System.out.println(ds.get(0).getDoctor_schedule());
ArrayList<SlotDate> slotlist=(ArrayList<SlotDate>)request.getAttribute("slotlist");
int doctorid=(int)request.getAttribute("did");
System.out.println(doctorid+" hjgjh");
%>

	<select id="days">
	<option>select a month</option>
	<option value="31" data-info={"month":"01"}>january</option>
	<option value="28" data-info={"month":"02"}>february</option>
	<option value="31" data-info={"month":"03"}>march</option>
	<option value="30" data-info={"month":"04"}>april</option>
	<option value="31" data-info={"month":"05"}>may</option>
	<option value="30" data-info={"month":"06"}>june</option>
	<option value="31" data-info={"month":"07"}>july</option>
	<option value="31" data-info={"month":"08"}>august</option>
	<option value="30" data-info={"month":"09"}>september</option>
	<option value="31" data-info={"month":"10"}>october</option>
	<option value="30" data-info={"month":"11"}>november</option>
	<option value="31" data-info={"month":"12"}>december</option>
	</select>
	<div id="slots"></div>
	
	<script>
		var slot=document.getElementById("slots");
		var sel=document.getElementById("days");
		var mon=0 ;
		
		sel.addEventListener("change",function(){
			slot.innerHTML="";
			var selectedOption = sel.options[sel.selectedIndex];
		    var dataInfoString = selectedOption.getAttribute("data-info");
		    var dataInfo = JSON.parse(dataInfoString);
		    var month = Number(dataInfo.month);
		    mon=month;
		    console.log(month);
			var fun=sel.value;
			
			for(var i=1;i<=fun;i++){
				 var button = document.createElement("input");
			        button.type = "button";
			        button.value=i;
			        button.id = i;
			        button.setAttribute("dat",i);
			    	button.style.backgroundColor = "grey";
			        slot.appendChild(button);
			        if(i%7==0){
			        	var lineBreak = document.createElement("br");
			        	slot.appendChild(lineBreak);
			        }  
			}
			<%for(SlotDate sc:slotlist){%>
				var xx='<%=sc.getSlotdate()%>';
				var yy='<%=sc.getAvailable_slots_count()%>';
				console.log(yy);
				var date = new Date(xx);
				var dayOfMonth = date.getDate();
				console.log(dayOfMonth);
				console.log(date);
				var monthofYear=date.getMonth()+1;
				
				
				
				
				var but=document.getElementById(dayOfMonth);
				
				if (month===monthofYear && yy>0){
					but.style.backgroundColor = "green";
					but.addEventListener("click",function(){
						console.log(mon);
			        	window.location.href="control?id="+'<%=doctorid%>'+"&date="+ this.id+"&month="+mon;
			        });
				}
				if(yy===0){
					but.style.backgroundColor="red";
				}
				console.log(dayOfMonth);
			<%}%>
		});
	
	
		</script>
</body>
</html>