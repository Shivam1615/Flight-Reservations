<%
if (request.getParameter("home") != null) {
	session.removeAttribute("departureAirport");
	session.removeAttribute("arrivalAirport");
	session.removeAttribute("triptype");
	session.removeAttribute("arg");
	response.sendRedirect("home.jsp");
} else {
	session.invalidate();
	response.sendRedirect("../index.html");
}
%>