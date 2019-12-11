<%
    if (session.getAttribute("username") == null || !session.getAttribute("usertype").equals("rep")) {
%>
		<p>You are not logged in
		<a href="../index.html">Please Login</a></p>
<%	} else {  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Representative Home Page</title>
</head>
<body>

  <p>Flight Reservation <a href='logout.jsp'>log out</a></p>

  <p><b>Search Flights</b></p>
		<form action="getSearchData.jsp" method="post">
			Departure Airport:
			<select name="departureAirport">
				<option value="airport1">Airport 1</option>
				<option value="airport2">Airport 2</option>
				<option value="airport3">Airport 3</option>
			</select><br>
			Arrival Airport:
			<select name="arrivalAirport">
				<option value="airport1">Airport 1</option>
				<option value="airport2">Airport 2</option>
				<option value="airport3">Airport 3</option>
			</select><br>
			Departure Date: <input type="datetime" name="departureDate" required><br>
			Arrival Date: <input type="datetime" name="arrivalDate" required><br>
			Trip Type:
			<select name="triptype">
				<option value="oneway">One Way</option>
				<option value="roundtrip">Round Trip</option>
			</select><br>
			Class:
			<select name="class">
				<option value="economy">Economy</option>
				<option value="business">Business</option>
				<option value="first">First</option>
			</select><br>
			<button>Search</button>
		</form>
    <br>
    <button href = "">Edit Flight Reservations</button>
    <br>
    <br>
    <button href = ""> Add Information</button>
    <button href = ""> Edit Information</button>
    <button href = ""> Delete Information</button>
    <br>







</body>
</html>

<% }  %>
