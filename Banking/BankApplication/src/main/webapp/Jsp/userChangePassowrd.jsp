<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page language="java" import="java.sql.*" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cnagng</title>
</head>
<body>

	<%
	
		String Session_u_name = (String)session.getAttribute("u_name");
		String cCurrentPassword = request.getParameter("CcurrentPassword");
		String cNewPassword = request.getParameter("cNewPassword");
		String cConfirmPassword = request.getParameter("cConfirmPassword");
		
		String pass = null;
		String userNme = null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
            PreparedStatement ps = con.prepareStatement("select * from register where userName='"+Session_u_name+"'");
			
			ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
            	pass = rs.getString(15);
            	userNme = rs.getString(14);	
            	
            }
           	
            if(cCurrentPassword.equals(pass)){
            	if(cNewPassword.equals(cConfirmPassword)){
            		PreparedStatement ps2 = con.prepareStatement("update register set password=? where userName='"+Session_u_name+"'");
                	ps2.setString(1, cNewPassword);
                	ps2.executeUpdate();
                	
                	out.println("<script type=\"text/javascript\">");
                	out.println("alert('Password Change Sucessfully... !');");
                	out.println("location='../user/setting.jsp';");
                	out.println("</script>");
            	}
            	else{
            		out.println("<script type=\"text/javascript\">");
                	out.println("alert('New Password And Confirm Password does not Matched... !');");
                	out.println("location='../user/setting.jsp';");
                	out.println("</script>");
            	}
            }
            else{
            	out.println("<script type=\"text/javascript\">");
            	out.println("alert('Current Password is Incorrect. Please Check And try again.... !');");
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