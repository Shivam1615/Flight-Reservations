<%@ page import ="java.sql.*" %>
<%
    String model = request.getParameter("model");   
    String airline = request.getParameter("airline");
    int economy = Integer.parseInt(request.getParameter("economy"));   
    int business = Integer.parseInt(request.getParameter("business"));
    int first = Integer.parseInt(request.getParameter("first"));   
   
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project","DhanushSG", "cs336project");
    Statement st = con.createStatement();
    
    String str = "INSERT INTO aircraft (aircraft_id,airline_id) VALUES ('" + model + "','" + airline + "')";
  
    
    	st.executeUpdate(str);
    	int i,k,j;
    	for(i=1;i<=economy;i++){
    		str = "INSERT INTO seat VALUES ('"+i+"','" + model +"','economy')";
    		st.executeUpdate(str);
    	}
		for(k=i;k<=business+i;k++){
    		
			str = "INSERT INTO seat VALUES ('"+k+"','" + model +"','business')";
			st.executeUpdate(str);
    	}
		for(j=k;j<=first+k;j++){
    		
			str = "INSERT INTO seat VALUES ('"+j+"','" + model +"','first')";
			st.executeUpdate(str);
    	}
    	
    	
    	con.close();
    	response.sendRedirect("customerRepHome.jsp");
    
   
%>