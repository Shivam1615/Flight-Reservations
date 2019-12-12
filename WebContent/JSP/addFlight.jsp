<%@ page import ="java.sql.*" %>
<%
    String flight_type = request.getParameter("flight_type");   
    String depart_time = request.getParameter("depart_time");
    String arrive_time = request.getParameter("arrive_time");   
    String fare_first = request.getParameter("fare_first");
    String fare_bus = request.getParameter("fare_bus");   
    String fare_economy = request.getParameter("fare_economy");
    String airline_id = request.getParameter("airline_id");   
    String flight_number = request.getParameter("flight_number");
    String aircraft_id = request.getParameter("aircraft_id");   
    String departure_id = request.getParameter("departure_id");
    String destination_id = request.getParameter("destination_id");   
 
    
    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    
    
   	String str = "INSERT INTO flights VALUES ('" + flight_type + "','" + depart_time + "','" + arrive_time + "','" + fare_first + "','" + fare_bus + "','" + fare_economy + "','" + airline_id + "','" + flight_number + "','" + aircraft_id + "','" +departure_id + "','" + destination_id +"')";
  
    
  
    	st.executeUpdate(str);
    	st.close();
    	con.close();
    	response.sendRedirect("customerRepHome.jsp");
   
   
%>