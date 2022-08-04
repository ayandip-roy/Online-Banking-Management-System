<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page language="java" import="java.sql.*" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify</title>
</head>


<body>

	<%
	
	//String Session_u_name = request.getParameter("userName"); 
	
	String Session_u_name = (String)session.getAttribute("User_name");
	
	
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
        PreparedStatement ps = con.prepareStatement("update register set userStatus = 'T' where userName='"+Session_u_name+"'");
        
        ps.executeUpdate();
        
        String site = new String("../admin/userVerification.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
		
	}
	catch(Exception e){
        out.print(e);
    }
	
	%>

</body>
</html>