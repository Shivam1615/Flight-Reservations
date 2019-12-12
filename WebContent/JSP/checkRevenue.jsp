<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	    
		try {
	
			//Get the database connection
			//ApplicationDB db = new ApplicationDB();	
			//Connection con = db.getConnection();		
			String name = request.getParameter("name");
			String type = request.getParameter("type");
			
			String url = "jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project";
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, "DhanushSG", "cs336project");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("command");
			String str;
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			
			if(type.compareTo("customer")==0){
			str = "SELECT SUM(booking_fee + total_fare) as 'Revenue generated' FROM ticket JOIN trip USING (ticket_number) JOIN seat USING (seat_number,aircraft_id) JOIN flights USING (flight_number,airline_id,aircraft_id) WHERE userid = "+"\'"+name+"\'";
			}else if(type.compareTo("airline")==0){
			str = "SELECT SUM(booking_fee + total_fare) as \'Revenue generated\' FROM ticket JOIN trip USING (ticket_number) JOIN seat USING (seat_number,aircraft_id) JOIN flights USING (flight_number,airline_id,aircraft_id) WHERE airline_id = "+"\'"+name+"\'";
			}else{
				str= "SELECT SUM(booking_fee + total_fare) as 'Revenue generated' FROM ticket JOIN trip USING (ticket_number) JOIN seat USING (seat_number,aircraft_id) JOIN flights USING (flight_number,airline_id,aircraft_id) WHERE flight_number = "+"\'"+name+"\'";	
			}
				
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table style=\"width:100%\">");
			//make a row
			out.print("<tr>");
			
			out.print("<th>");
			out.print("Revenue generated");
			out.print("</th>");
			
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				
				out.print("<tr>");
		
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("Revenue generated"));
				out.print("</td>");
				

				
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection
			con.close();
			
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>