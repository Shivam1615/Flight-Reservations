<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Reservation Page</title>
	</head>
	<body>
		<b>Travel Itinerary</b><br><br>
<%
	String price = request.getParameter("price");
	String model = request.getParameter("model");
	String airline = request.getParameter("airline");
	String flightno = request.getParameter("flightno");
	String triptype = session.getAttribute("triptype").toString();
	int triptypeb = (triptype != null && triptype.equals("round trip")) ? 1 : 0;
	String classtype = "";
	int classnum = Integer.parseInt(request.getParameter("class"));
	if (classnum == 8) classtype = "economy";
	else if (classnum == 9) classtype = "business";
	else if (classnum == 10) classtype = "first";
	
	out.print("<table border=1 width=250px>");
	out.print("<tr><td>Flight #: </td><td>" + flightno + "</td></tr>");
	out.print("<tr><td>Model: </td><td>" + model + "</td></tr>");
	out.print("<tr><td>Airline: </td><td>" + airline + "</td></tr>");
	out.print("<tr><td>Trip-type: </td><td>" + triptype + "</td></tr>");
	out.print("<tr><td>Class: </td><td>" + classtype + "</td></tr>");
	out.print("<tr><td>Price: </td><td>$" + price + "</td></tr>");
	out.print("<tr><td>Reservation Fee: </td><td>$50</td></tr>");
	out.print("<tr><td>Total Price: </td><td><b>$" + (int) (Integer.parseInt(price) + 50) + "</b></td></tr>");
	out.print("</table><br>");
	
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    
    ResultSet rs = st.executeQuery("SELECT * FROM seat WHERE aircraft_id = '" + model + "' AND class = '" + classtype + "' AND seat_number NOT IN (SELECT seat_number FROM trip JOIN seat using (seat_number,aircraft_id) WHERE airline_id='" + airline + "' AND flight_number=" + flightno + ")");
    int count = 0;
    %>
    	<form action="makeReservation.jsp?round=<%=triptypeb%>&model=<%=model%>&airline=<%=airline%>&flightno=<%=flightno%>&price=<%=price%>" method='post'>
    <%
    out.print("Choose Seat: <select name='seatno'>");
    while (rs.next()) {
    	out.print("<option>" + rs.getString(1) + "</option>");
    	count++;
    }
    out.print("</select>");
    
    if (count == 0) {
    	%></form><%
    	out.println("<br>There are no available seats for this flights <a href='getSearchData.jsp'>go back</a><br>");
    	%><a href="addToWaitlist.jsp?val=TRUE&flight_number=<%=flightno%>&airline_id=<%=airline%>">Add me to waitlist for this flight</a><%
    }
    else {
    	out.print("<br><br>Meal ('N/A' for no meals): <input type='text' name='meal' required><br><br>");
    	out.print("<button>Make Reservation</button>");
    	%></form><%
    }
    
    con.close();
	
%>
	</body>
</html>