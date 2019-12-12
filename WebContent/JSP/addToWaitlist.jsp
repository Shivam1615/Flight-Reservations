<%@ page import ="java.sql.*" %>
<%
    String number = request.getParameter("flight_number");   
    String airline = request.getParameter("airline_id");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    
    String username = null;
	try{
	username = session.getAttribute("username").toString();
	}catch (Exception e){
		out.println("You have not logged in <a href='../index.html'>login</a>");
	}
    
    String str = "INSERT INTO waitlist VALUES ('" + number + "','" + airline + "','" + username + "',NOW())";
  	
    try {
   		st.executeUpdate(str);
    } catch (Exception e) {
    	if (request.getParameter("val") != null) {
    		response.sendRedirect("home.jsp?message='Already added to waitlist'");
    		return;
    	}
    	else response.sendRedirect("customerRepHome.jsp");
    }
   	con.close();
   	if (request.getParameter("val") != null) {
   		response.sendRedirect("home.jsp?message='Added to waitlist'");
   		return;
   	}
   	else response.sendRedirect("customerRepHome.jsp");
    
   
%>