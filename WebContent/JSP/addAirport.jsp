<%@ page import ="java.sql.*" %>
<%
    String name = request.getParameter("name");   
   
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    
    String str = "INSERT INTO airports VALUES ('" + name + "')";
  
    
    try {
    	st.executeUpdate(str);
    	con.close();
    	response.sendRedirect("customerRepHome.jsp");
    } catch (Exception e) {
    	out.println("User already exists <a href='customerRepHome.jsp'>try again</a>");
    }
    /*ResultSet rs;
    rs = st.executeQuery("select * from users where userid='" + userid + "' and pwd='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }*/
%>