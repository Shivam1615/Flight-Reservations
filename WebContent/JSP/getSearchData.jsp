<%@ page import ="java.sql.*" %>
<% 
	String departureAirport, arrivalAirport, triptype, arg;
	if (request.getParameter("sort") != null) {
		session.removeAttribute("arg");
		response.sendRedirect("getSearchData.jsp");
	}
	try {
		departureAirport = session.getAttribute("departureAirport").toString();
	} catch (Exception e) {
		departureAirport = request.getParameter("departureAirport");
		session.setAttribute("departureAirport", departureAirport);
	}
	try {
		arrivalAirport = session.getAttribute("arrivalAirport").toString();
	} catch (Exception e) {
		arrivalAirport = request.getParameter("arrivalAirport");
		session.setAttribute("arrivalAirport", arrivalAirport);
	}
	try {
		triptype = session.getAttribute("triptype").toString();
	} catch (Exception e) {
		triptype = request.getParameter("triptype");
		session.setAttribute("triptype", triptype);
	}
	try {
		arg = session.getAttribute("arg").toString();
	} catch (Exception e) {
		arg = request.getParameter("arg");
		session.setAttribute("arg", arg);
	}
	
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    String[] titles = {"Flight Number", "Departure Airport", "Arrival Airport", "Departure Time", "Arrival Time", "Airline", "Model", "Economy Class", "Business Class", "First Class"};
    String query = "select flight_number, departure_id, destination_id, depart_time, arrive_time, airline_id, aircraft_id, fare_economy, fare_bus, fare_first ";
    String airlineFilter = request.getParameter("airlineFilter");
    String modelFilter = request.getParameter("modelFilter");
    if (airlineFilter != null && airlineFilter.equals("null")) airlineFilter = null;
    if (modelFilter != null && modelFilter.equals("null")) modelFilter = null;
    query+="from flights ";
    query+="where departure_id = '" + departureAirport + "' ";
    query+="and destination_id = '" + arrivalAirport + "' ";
    query+="and flight_type = '" + triptype + "' ";
    if (airlineFilter != null) query+="and airline_id = '" + airlineFilter + "' ";
    if (modelFilter != null) query+="and aircraft_id = '" + modelFilter + "' ";
    if (arg != null) query+="order by " + arg;
    
    ResultSet rs = st.executeQuery(query);
    ResultSetMetaData rsmd = rs.getMetaData();
    
    %>
    	<title>Search Results</title>
		<button onclick="location.href='getSearchData.jsp?sort=clear';">Clear Sorts</button>
		<button onclick="location.href='logout.jsp?home=true';">Go Home</button><br>
		<form action="getSearchData.jsp" method="post">
			<br>Filter By:
			<select name="airlineFilter">
				<option value="null">---</option>
				<option value="airline1">airline1</option>
				<option value="airline2">airline2</option>
			</select>
			<select name="modelFilter">
				<option value="null">---</option>
				<option value="model1">model1</option>
				<option value="model2">model2</option>
			</select>
			<button>Go</button>
		</form><br>
	<%
    
    int n = rsmd.getColumnCount();
    out.print("<table style=\"width:100%\">");
    
    out.print("<tr>");
    for (int i = 0; i < n; i++) {
    	if (i == 3) {
    		out.print("<th style='text-align:center'><a href='getSearchData.jsp?arg=depart_time'>" + titles[i] + "</a></th>");
    	} else if (i == 4) {
    		out.print("<th style='text-align:center'><a href='getSearchData.jsp?arg=arrive_time'>" + titles[i] + "</a></th>");
    	} else if (i == 7) {
    		out.print("<th style='text-align:center'><a href='getSearchData.jsp?arg=fare_economy'>" + titles[i] + "</a></th>");
    	} else if (i == 8) {
    		out.print("<th style='text-align:center'><a href='getSearchData.jsp?arg=fare_bus'>" + titles[i] + "</a></th>");
    	} else if (i == 9) {
    		out.print("<th style='text-align:center'><a href='getSearchData.jsp?arg=fare_first'>" + titles[i] + "</a></th>");
    	}
    	else out.print("<th style='text-align:center'>" + titles[i] + "</th>");
    }
    out.print("</tr>");
    
    while (rs.next()) {
    	out.print("<tr>");
		for (int i = 1; i <= n; i++) {
			if (i >= 8) {
				%>
					<td style='text-align:center'>
						<a href="reserveFlight.jsp?class=<%=i%>">
							$<%=rs.getString(i)%>
						</a>
					</td>
				<%
			}
			else out.print("<td style='text-align:center'>" + rs.getString(i) + "</td>");
		}
		out.print("</tr>");
    }
    out.print("</table>");
%>