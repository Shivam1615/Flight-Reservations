<%
    if ((session.getAttribute("user") == null)) {
%>
You are successfully registered<br/>
<a href="../index.html">Please Login</a>
<%} else {
%>
Username already taken <%=session.getAttribute("user")%>  //this will display the username that is stored in the session.
<a href='../JSP/logout.jsp'>Log out</a>
<%
    }
%>