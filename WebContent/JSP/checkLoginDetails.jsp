<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    
    ResultSet rs;
    rs = st.executeQuery("select * from customer where userid='" + userid + "' and pwd='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("username", userid); // the username will be stored in the session
        response.sendRedirect("home.jsp");
    } else {
        out.println("Invalid password <a href='../index.html'>try again</a>");
    }
%>