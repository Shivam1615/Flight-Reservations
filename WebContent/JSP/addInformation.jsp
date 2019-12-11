<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adding Information for Customers</title>
</head>
<body>

  <p>Flight Reservation <a href='logout.jsp'>log out</a></p>

  <p><b>Search Aircraft, Airport, and Flights</b></p>
		<form action="getSearchData.jsp" method="post">
			Add Aircraft Information:
			<select name="Aircrafts">
				<option value="model1">Model1</option>
				<option value="model2">Model2</option>
				<option value="model3">Model3</option>
			</select><br><br>
			Add Flight Information:
			<select name="Flights">
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







</body>
</html>
