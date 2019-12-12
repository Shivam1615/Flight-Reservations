<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flight Waitlist</title>
</head>
<body>
	<%
	    
		try {
	
			//Get the database connection
			//ApplicationDB db = new ApplicationDB();	
			//Connection con = db.getConnection();		
			String number = request.getParameter("flight_number");
			String airline = request.getParameter("airline_id");
			
			String url = "jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project";
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, "DhanushSG", "cs336project");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
		
			String str;
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			
			str = "SELECT userid,date_added FROM waitlist WHERE flight_number = '"+number+"'AND airline_id = '" +airline+ "' order by date_added";
			

				
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table style=\"width:100%\">");
			//make a row
			out.print("<tr>");
			
			out.print("<th>");
			out.print("Username");
			out.print("</th>");
			out.print("<th>");
			out.print("date added");
			out.print("</th>");
			
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				
				out.print("<tr>");
		

				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("userid"));
				out.print("</td>");
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("date_added"));
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