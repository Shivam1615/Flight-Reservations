<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reservations</title>
</head>
<body>
	<%
	    
		try {
	
			//Get the database connection
			//ApplicationDB db = new ApplicationDB();	
			//Connection con = db.getConnection();		
			
			String url = "jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project";
			
			session.setAttribute("home", "true");
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, "DhanushSG", "cs336project");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Get the selected radio button from the index.jsp
			String username = null;
			try{
			username = session.getAttribute("username").toString();
			}catch (Exception e){
				out.println("You have not logged in <a href='../index.html'>login</a>");
			}
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT userid, seat_number, class, depart_time, arrive_time, total_fare, airline_id, flight_number, ticket_number, departure_id, destination_id FROM ticket JOIN trip USING (ticket_number) JOIN seat USING (seat_number,aircraft_id) JOIN flights USING (flight_number,airline_id,aircraft_id) WHERE userid = '"+username+"' AND depart_time < NOW()";
			String str2 = "SELECT userid, seat_number, class, depart_time, arrive_time, total_fare, airline_id, flight_number, ticket_number, departure_id, destination_id FROM ticket JOIN trip USING (ticket_number) JOIN seat USING (seat_number,aircraft_id) JOIN flights USING (flight_number,airline_id,aircraft_id) WHERE userid = '"+username+"' AND depart_time >= NOW()";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			out.print("<b>Past Reservations</b><br><br>");
			//Make an HTML table to show the results in:
			out.print("<table style=\"width:100%\">");
			//make a row
			out.print("<tr>");
			
			out.print("<th>");
			out.print("Username");
			out.print("</th>");
			out.print("<th>");
			out.print("Seat #");
			out.print("</th>");
			out.print("<th>");
			out.print("Class");
			out.print("</th>");
			out.print("<th>");
			out.print("Depart Time");
			out.print("</th>");
			out.print("<th>");
			out.print("Arrive Time");
			out.print("</th>");
			out.print("<th>");
			out.print("Total Fare");
			out.print("</th>");
			out.print("<th>");
			out.print("Airline");
			out.print("</th>");
			out.print("<th>");
			out.print("Flight #");
			out.print("</th>");
			out.print("<th>");
			out.print("Ticket #");
			out.print("</th>");
			out.print("<th>");
			out.print("Departure Airport");
			out.print("</th>");
			out.print("<th>");
			out.print("Arrival Airport");
			out.print("</th>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				
				out.print("<tr>");
		
				out.print("<td style='text-align:center'>");
				out.print(result.getString("userid"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("seat_number"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("class"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("depart_time"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("arrive_time"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("total_fare"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("airline_id"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("flight_number"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("ticket_number"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("departure_id"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("destination_id"));
				out.print("</td>");
				
				out.print("</tr>");

			}
			out.print("</table><br><br>");
			out.print("<b>Current Reservations</b><br><br>");
			
			out.print("<table style=\"width:100%\">");
			//make a row
			out.print("<tr>");
			
			out.print("<th>");
			out.print("Username");
			out.print("</th>");
			out.print("<th>");
			out.print("Seat #");
			out.print("</th>");
			out.print("<th>");
			out.print("Class");
			out.print("</th>");
			out.print("<th>");
			out.print("Depart Time");
			out.print("</th>");
			out.print("<th>");
			out.print("Arrive Time");
			out.print("</th>");
			out.print("<th>");
			out.print("Total Fare");
			out.print("</th>");
			out.print("<th>");
			out.print("Airline");
			out.print("</th>");
			out.print("<th>");
			out.print("Flight #");
			out.print("</th>");
			out.print("<th>");
			out.print("Ticket #");
			out.print("</th>");
			out.print("<th>");
			out.print("Departure Airport");
			out.print("</th>");
			out.print("<th>");
			out.print("Arrival Airport");
			out.print("</th>");
			
			out.print("</tr>");
			result = stmt.executeQuery(str2);
			//parse out the results
			while (result.next()) {
				
				out.print("<tr>");
		
				out.print("<td style='text-align:center'>");
				out.print(result.getString("userid"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("seat_number"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("class"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("depart_time"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("arrive_time"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("total_fare"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("airline_id"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("flight_number"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("ticket_number"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("departure_id"));
				out.print("</td>");
				out.print("<td style='text-align:center'>");
				out.print(result.getString("destination_id"));
				out.print("</td>");
				
				out.print("</tr>");

			}
			out.print("</table><br>");
			%>
			<b>Cancel Flight Reservations</b>
		      <form action = "editReservations.jsp?check=true" method="post">
		        <br>Ticket Number:
		        <input type = "text" name = "ticket_number" required>
		        <button>Cancel Reservation</button>
		      </form>

		    <br>
		    <%
		    	try {
		    		String message = session.getAttribute("message").toString();
		    		if (message != null) out.print(message);
		    	} catch (Exception e) {}
		    %>
		    <br>
		    <%
			out.print("<a href='home.jsp'>Go home</a>");
;			con.close();
			//close the connection
			
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>