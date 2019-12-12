<%
    if (session.getAttribute("username") == null || !session.getAttribute("usertype").equals("customer")) {
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
		<title>Home Page</title>
	</head>
	<body>
		<p><b>Welcome <%=session.getAttribute("username")%>
		<a href='logout.jsp'>Log out</a></b></p>
		Check your reservations
  		<button onclick="location.href='reservations.jsp';">Go</button>
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
			Trip Type:
			<select name="triptype">
				<option value="one way">One Way</option>
				<option value="round trip">Round Trip</option>
			</select><br><br>
			<button>Search</button>
		</form>
	</body>
</html>
<%
    }
%>
