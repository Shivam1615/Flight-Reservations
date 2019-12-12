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
				<option value="one way">One Way</option>
				<option value="round trip">Round Trip</option>
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



    <b>Edit/Remove Flight Reservations</b>
      <form action = "" method="post">
        UserID:
        <input type = "text" name = "userid" required>
        <br>
        Ticket Number:
        <input type = "text" name = "ticket_number" required>
          <br>
        <button>Remove Reservation</button>
      </form>

    <br>
    <br>


    <b> Add Information</b>
    <br>
    <br>
    <form action="" method="post">
      <select name = "info">
        <option value = "aircraft">Aircraft</option>
        <option value = "airport">Airport</option>
        <option value = "flight">Flight</option>
      </select>
      name:
      <input type = "text" name = "info_name" required>
      <button href = "">Add</button>
    </form>
    <br>
    <br>


      <b> Edit Information</b>
      <br>
      <br>
      <form action="" method="post">
        <select name = "info">
          <option value = "aircraft">Aircraft</option>
          <option value = "airport">Airport</option>
          <option value = "flight">Flight</option>
        </select>
        Name:

        <input type = "text" name = "info_name" required>
        <button href = "">Edit</button>
      </form>
      <br>
      <br>


        <b> Delete Information</b>
        <br>
        <br>
        <form action="" method="post">
          <select name = "info">
            <option value = "aircraft">Aircraft</option>
            <option value = "airport">Airport</option>
            <option value = "flight">Flight</option>
          </select>
          Name of info to delete:
          <input type = "text" name = "info_name" required>
          <button href = "">Delete</button>
        </form>
        <br>
        <br>


  <br>

    <b> Wait List for Passengers</b>
    <br>
    <br>
      <form action="" method = "post">
        Flight Number:
        <select name = "Flight Number">
          <option value = "1">1</option>
          <option value = "2">2</option>
        </select>
        <br>
        <br>
        AirLine:
        <br>
        <select name = "Airline Numbers">
          <option value = "airline1">airline1</option>
          <option value = "airline2">airline2</option>
        </select>
        <br>
        <br>
        <button href = "">Enter</button>
        <br>
        <br>
        List of passengers:
        <select name = "Passengers">

        </select>

    </form>



</body>
</html>

<% }  %>
