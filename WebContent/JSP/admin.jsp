<%
    if (session.getAttribute("username") == null || !session.getAttribute("usertype").equals("admin")) {
%>
    <p>You are not logged in
    <a href="../index.html">Please Login</a></p>
<%  } else {  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <title>Admin Page</title>
   </head>
   <body>
   Create Customer Representative <a href='logout.jsp'>Log out</a>
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
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
	Statement st = con.createStatement();
	ResultSet rs;
%>
      Produce a list of all flights for a given airport
      <form action="checkFlights.jsp" method="POST">
     	Name:<select name="month">
     		<%
	      		rs = st.executeQuery("select * from airlines");
	      		while(rs.next()) {
	      			out.print("<option>" + rs.getString(1) + "</option>");
	      		}
	      		con.close();
	      	%>
     	</select> <br/>
       <input type="Submit" value="GET"/>
     </form>
     <br> 
    
   </body>
</html>
<%
    }
%>