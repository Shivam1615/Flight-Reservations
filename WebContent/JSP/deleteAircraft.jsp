<%@ page import ="java.sql.*" %>
<%
    String model = request.getParameter("model");   
    String airline = request.getParameter("airline");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    
    String str = "DELETE FROM aircraft WHERE aircraft_id = '" + model + "' AND airline_id = '" + airline + "'";
  
    st.executeUpdate(str);
    con.close();
    response.sendRedirect("customerRepHome.jsp");
    
    
%>