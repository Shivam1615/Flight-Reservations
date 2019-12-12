<%@ page import ="java.sql.*" %>
<%
    String name = request.getParameter("name");   
   
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    
    String str = "DELETE FROM airports WHERE airport_id = '" + name + "'";
  
    
    try {
    	st.executeUpdate(str);
    	con.close();
    	response.sendRedirect("customerRepHome.jsp");
    } catch (Exception e) {
    	out.println("User already exists <a href='customerRepHome.jsp'>try again</a>");
    }
    
%>