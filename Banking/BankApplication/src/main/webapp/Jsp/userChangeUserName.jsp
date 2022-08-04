<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page language="java" import="java.sql.*" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

		String Session_u_name = (String)session.getAttribute("u_name");

		String currentUserName = request.getParameter("currentUserName");
		String newUserName = request.getParameter("newUserName");
		String currentPass = request.getParameter("currentPass");
		String pass = null;
		String userNme = null;
		
		//out.print(Session_u_name);
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
            PreparedStatement ps = con.prepareStatement("select * from register where userName='"+Session_u_name+"'");
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
            	pass = rs.getString(15);
            	userNme = rs.getString(14);	
            	
            }
            
            if(currentPass.equals(pass)){
            	PreparedStatement ps2 = con.prepareStatement("update register set userName=? where userName='"+Session_u_name+"'");
            	ps2.setString(1, newUserName);
            	ps2.executeUpdate();
            	
            	out.println("<script type=\"text/javascript\">");
            	out.println("alert('UserName Change Sucessfully... !');");
            	//out.println("location='../user/setting.jsp';");
            	out.println("</script>");
            	
            	session.invalidate();
                String site = new String("../index.html");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
            else{
            	out.println("<script type=\"text/javascript\">");
            	out.println("alert('Incorrect Password. Please Check your Password... !');");
            	out.println("location='../user/setting.jsp';");
            	out.println("</script>");
            }
            
            
            
            
            
		}
    	catch(Exception e){
        	out.print(e);
    }
		
%>

</body>
</html>