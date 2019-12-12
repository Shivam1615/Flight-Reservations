<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    
    String str = "INSERT INTO customer(userid, pwd) VALUES('" + userid + "','" + pwd + "')";
    try {
    	st.executeUpdate(str);
    	con.close();
    	response.sendRedirect("successR.jsp");
    } catch (Exception e) {
    	con.close();
    	out.println("User already exists <a href='../index.html'>try again</a>");
    }
%>