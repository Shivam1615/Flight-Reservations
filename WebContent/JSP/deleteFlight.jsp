<%@ page import ="java.sql.*" %>
<%
    String flight_number = request.getParameter("flight_number");   
    String airline = request.getParameter("airline_id");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    
    String str = "DELETE FROM flights WHERE flight_number = '" + flight_number + "' and airline_id = '" + airline + "'";
  
    st.executeUpdate(str);
    con.close();
    response.sendRedirect("customerRepHome.jsp");
    
    
%>