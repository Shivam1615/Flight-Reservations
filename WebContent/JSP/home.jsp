<%
    if (session.getAttribute("username") == null || !session.getAttribute("usertype").equals("customer")) {
%>
		<p>You are not logged in
		<a href="../index.html">Please Login</a></p>
<%	} else {  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home Page</title>
	</head>
	<body>
<%
	if (session.getAttribute("home") != null) response.sendRedirect("logout.jsp?home=true");
%>
		<p><b>Welcome <%=session.getAttribute("username")%>
		<a href='logout.jsp'>Log out</a></b></p>
		Check your reservations
  		<button onclick="location.href='reservations.jsp';">Go</button>
		<p><b>Search Flights</b></p>
		<form action="getSearchData.jsp" method="post">
			Departure Airport:
			<select name="departureAirport">
				<%
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
					Statement st = con.createStatement();
					ResultSet rs;
		      		rs = st.executeQuery("select * from airports");
		      		while(rs.next()) {
		      			out.print("<option>" + rs.getString(1) + "</option>");
		      		}
		      		rs = st.executeQuery("select * from airports");
	      		%>
			</select><br>
			Arrival Airport:
			<select name="arrivalAirport">
				<%
		      		while(rs.next()) {
		      			out.print("<option>" + rs.getString(1) + "</option>");
		      		}
		      		con.close();
	      		%>
			</select><br>
			Trip Type:
			<select name="triptype">
				<option value="one way">One Way</option>
				<option value="round trip">Round Trip</option>
			</select><br><br>
			<button>Search</button>
		</form>
		<%
			if (request.getParameter("message") != null) out.println("<br><br>" + request.getParameter("message"));
		%>
	</body>
</html>
<%
    }
%>
