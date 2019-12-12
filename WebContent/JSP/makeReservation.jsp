<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Reservation Message</title>
	</head>
	<body>
<%
	String username = session.getAttribute("username").toString();
	int price = Integer.parseInt(request.getParameter("price")) + 50;
	String model = request.getParameter("model");
	String airline = request.getParameter("airline");
	String flightno = request.getParameter("flightno");
	String round = request.getParameter("round");
	String meal = request.getParameter("meal");
	String seatno = request.getParameter("seatno");
	int ticketno = 1;

	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    
    ResultSet rs = st.executeQuery("select max(ticket_number)+1 from ticket");
    if (rs.next()) ticketno = rs.getInt(1);
    
    try {
    	st.executeUpdate("INSERT INTO ticket VALUES ('" + username + "'," + ticketno + "," + round + ",'50', NOW()," + price + ")");
    	st.executeUpdate("INSERT INTO trip VALUES('" + meal + "', '" + ticketno + "', '" + seatno + "', '" + model + "', '" + airline + "', '" + flightno + "')");
    	out.print("Flight was reserved successfully... <a href='home.jsp'>Go home</a>");
    } catch (Exception e) {
    	out.print("Flight could not be reserved... <a href='home.jsp'>Go home</a>");
    }
    con.close();
	
%>
	</body>
</html>