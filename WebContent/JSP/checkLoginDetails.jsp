<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    Statement sd = con.createStatement();
    Statement sp = con.createStatement();
    ResultSet customer = st.executeQuery("select * from customer where binary userid='" + userid + "' and binary pwd='" + pwd + "'");
    ResultSet admin = sd.executeQuery("select * from admin where binary admin_id='" + userid + "' and binary pwd='" + pwd + "'");
    ResultSet rep = sp.executeQuery("select * from rep where binary rep_id='" + userid + "' and binary pwd='" + pwd + "'");
    try {
	    if (customer.next()) {
	        session.setAttribute("username", userid); // the username will be stored in the session
	        session.setAttribute("usertype", "customer");
	        response.sendRedirect("home.jsp");
	    } else if (admin.next()) {
	    	session.setAttribute("username", userid); // the username will be stored in the session
	    	session.setAttribute("usertype", "admin");
	        response.sendRedirect("");
	    } else if (rep.next()) {
	    	session.setAttribute("username", userid); // the username will be stored in the session
	    	session.setAttribute("usertype", "rep");
	        response.sendRedirect("customerRepHome.jsp");
	    } else {
	        out.println("Invalid password <a href='../index.html'>try again</a>");
	    }
    } catch (Exception e) {
    	out.println("Exception occured " + e);
    }
%>