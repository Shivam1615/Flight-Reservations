<%@ page import ="java.sql.*" %>
<% 
	String departureAirport = request.getParameter("departureAirport");
	String arrivalAirport = request.getParameter("arrivalAirport");
	String departureDate = request.getParameter("departureDate");
	String arrivalDate = request.getParameter("arrivalDate");
	String triptype = request.getParameter("triptype");
	String classtype = request.getParameter("class");
	System.out.println(departureAirport);
	System.out.println(arrivalAirport);
	System.out.println(departureDate);
	System.out.println(arrivalDate);
	System.out.println(triptype);
	System.out.println(classtype);
%>