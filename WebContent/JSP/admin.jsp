<%
    if (session.getAttribute("username") == null || !session.getAttribute("usertype").equals("admin")) {
%>
    <p>You are not logged in
    <a href="../index.html">Please Login</a></p>
<%  } else {  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <title>Admin Page</title>
   </head>
   <body>
   <b>Admin Page</b>
   <a href="logout.jsp">logout</a><br><br>
   Create Customer Representative
   <form action="addRep.jsp" method="POST">
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <br>
   
   
   <br>
   Sales report 
     <form action="report.jsp" method="POST">
     	Month(input numerical value 1-12) <input type="text" name="month"/> <br/>
       <input type="Submit" value="GET"/>
     </form>
     <br>
     
    Check reservations
    <form action="checkReservations.jsp" method="POST">
    by
    <select name="type">
				<option value="flight">flight number</option>
				<option value="customer">customer</option>
			</select><br>
     	<input type="text" name="name"/> <br/>
       <input type="Submit" value="GET"/>
     </form>
     <br>
    Revenue Generated
    <form action="checkRevenue.jsp" method="POST">
    by
    <select name="type">
				<option value="customer">customer</option>
				<option value="airline">airline</option>
				<option value="flight">flight</option>
			</select><br>
     	<input type="text" name="name"/> <br/>
       <input type="Submit" value="GET"/>
     </form>
     
     <br>
     
     Get most active flights
     <form action="mostActive.jsp" method="POST">
       <input type="Submit" value="GET"/>
     </form>
     
     <br>
      Produce a list of all flights for a given airport
      <form action="checkFlights.jsp" method="POST">
     	Name:<input type="text" name="month"/> <br/>
       <input type="Submit" value="GET"/>
     </form>
     <br> 
    
   </body>
</html>
<%
    }
%>