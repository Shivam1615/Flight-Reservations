<%
    if (session.getAttribute("username") == null || !session.getAttribute("usertype").equals("rep")) {
%>
		<p>You are not logged in
		<a href="../index.html">Please Login</a></p>
<%	} else {  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Representative Home Page</title>
</head>
<body>

  <p>Customer Representative Home Page <a href='logout.jsp'>log out</a></p>


    <b>Edit/Remove Flight Reservations</b>
      <form action = "editReservations.jsp" method="post">
      Username:
        <input type = "text" name = "userid" required>
          <br>
        Ticket Number:
        <input type = "text" name = "ticket_number" required>
          <br>
        <button>Remove Reservation</button>
      </form>

    <br>
    	<%
    		if (request.getParameter("val") != null) out.println("Failed to remove reservation due to incorrect userid");
    	%>
    <br>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
	Statement st = con.createStatement();
	ResultSet rs;
%>

    <b> Add Aircraft</b>
    <br>
    <form action="addAircraft.jsp" method="post">
      Model:
      <input type = "text" name = "model" required>
       Airline:
      <select name = "airline" required>
      	<%
      		rs = st.executeQuery("select * from airlines");
	   		while(rs.next()) {
	   			out.print("<option>" + rs.getString(1) + "</option>");
	   		}
     	%>
      </select><br>
      Max seats for Economy Class:
      	<input type = "text" name = "economy" required><br>
      Max seats for Business Class:
      	<input type = "text" name = "business" required><br>
      Max seats for First Class:
      	<input type = "text" name = "first" required><br>
      <button>Add</button>
    </form>
    <br>
    <br>

	<b> Add Airport</b>
    <br>
    <form action="addAirport.jsp" method="post">
      Name:
      <input type = "text" name = "name" required>
      <button>Add</button>
    </form>
    <br>
    <br>

<b> Add Flight</b>
    <br>
    <table width="80%">
	    <form action="addFlight.jsp" method="post">
	    <tr>
	      <td>Trip Type:<select name = "flight_type" required>
	      	<option>one way</option>
	      	<option>round trip</option>
	      </select></td>
	      <td>Departure Datetime (format: yyyy-mm-dd hh:mm:ss):<br><input type = "text" name = "depart_time" required></td>
	      <td>Arrival Datetime (format: yyyy-mm-dd hh:mm:ss):<br><input type = "text" name = "arrive_time" required></td>
	    </tr>
	    <tr>
	      <td>First Class Fare: $<input type = "text" name = "fare_first" required></td>
	      <td>Business Class Fare: $<input type = "text" name = "fare_bus" required></td>
	      <td>Economy Class Fare: $<input type = "text" name = "fare_economy" required></td>
	    </tr>
	    <tr>
	      <td>Airline:<select name = "airline_id" required>
	      	<%
	      		rs = st.executeQuery("select * from airlines");
	      		while(rs.next()) {
	      			out.print("<option>" + rs.getString(1) + "</option>");
	      		}
	      		rs = st.executeQuery("select aircraft_id from aircraft");
	      	%>
	      </select></td>
	      <td>Flight Number:<input type = "text" name = "flight_number" required></td>
	      <td>Model Number:<select name = "aircraft_id" required>
	      	<%
	      		while(rs.next()) {
	      			out.print("<option>" + rs.getString(1) + "</option>");
	      		}
	      		rs = st.executeQuery("select * from airports");
	      	%>
	      </select></td>
	    </tr>
	    <tr>
	      <td>Departure Airport:<select name = "departure_id" required>
	      	<%
	      		while(rs.next()) {
	      			out.print("<option>" + rs.getString(1) + "</option>");
	      		}
	      		rs = st.executeQuery("select * from airports");
	      	%>
	      </select></td>
	      <td>Arrival Airport:<select name = "destination_id" required>
	      	<%
	      		while(rs.next()) {
	      			out.print("<option>" + rs.getString(1) + "</option>");
	      		}
	      		con.close();
	      	%>
	      </select></td>
	      <td><button>Add</button></td>
	    </tr>
	    </form>
	 </table>
    <br>
    <br>


         <b> Delete Aircraft</b>
    <br>
    <br>
    <form action="deleteAircraft.jsp" method="post">
      Model:
      <input type = "text" name = "model" required>
       Airline:
      <input type = "text" name = "airline" required>
      <button>Delete</button>
    </form>
    <br>
    <br>

	<b> Delete Airport</b>
    <br>
    <br>
    <form action="deleteAirport.jsp" method="post">
      Name:
      <input type = "text" name = "name" required>
      <button>Delete</button>
    </form>
    <br>
    <br>

	<b> Delete Flight</b>
    <br>
    <br>
    <form action="deleteFlight.jsp" method="post">
      Flight number:
      <input type = "text" name = "flight_number" required>
       Airline:
      <input type = "text" name = "airline_id" required>
      <button>Delete</button>
    </form>
    <br>
    <br>


  <b> Waiting list for a flight</b>
    <br>
    <br>
    <form action="getWaitList.jsp" method="post">
      Flight number:
      <input type = "text" name = "flight_number" required>
       Airline:
      <input type = "text" name = "airline_id" required>
      <button>Get</button>
    </form>
    <br>
    <br>

    </form>



</body>
</html>

<% }  %>
