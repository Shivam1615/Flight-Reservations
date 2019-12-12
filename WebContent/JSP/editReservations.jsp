<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Reservations</title>
</head>
<body>
	<%
	    
		try {
		
			String number = request.getParameter("ticket_number");
		
			
			String url = "jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project";
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, "DhanushSG", "cs336project");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
		
			String str;
			String str2;
			String check = request.getParameter("check");
			String username = (check != null) ? session.getAttribute("username").toString() : request.getParameter("userid");
			ResultSet rs = stmt.executeQuery("select userid, class from trip join ticket using(ticket_number) join seat using (seat_number, aircraft_id) where ticket_number = " + number);
			
			if (rs.next()) {
				if (!rs.getString(1).equals(username)) {
					session.setAttribute("message", "You can only cancel your own tickets");
					if (check != null) response.sendRedirect("reservations.jsp");
					else response.sendRedirect("customerRepHome.jsp?val=FAIL");
					return;
				} else if (rs.getString(2).equals("economy") && check != null) {
					session.setAttribute("message", "Economy class reservations cannot be cancelled");
					response.sendRedirect("reservations.jsp");
					return;
				}
			} else {
				session.setAttribute("message", "Invalid Ticket Number");
				if (check != null) response.sendRedirect("reservations.jsp");
				else response.sendRedirect("customerRepHome.jsp?val=FAIL");
				return;
			}
			
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			
			
			
			str = "DELETE FROM trip WHERE ticket_number = " + number;
			
			str2 = "DELETE FROM ticket WHERE ticket_number = " + number;
			
				stmt.executeUpdate(str);
				stmt.executeUpdate(str2);
				if (check != null) {
					session.setAttribute("message", "Successfully cancelled your reservation.");
					response.sendRedirect("reservations.jsp");
				}
		    	response.sendRedirect("customerRepHome.jsp");
			
			
			//Run the query against the database.
			
			

			//close the connection
			con.close();
			
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>