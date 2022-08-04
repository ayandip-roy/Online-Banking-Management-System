<%-- 
    Document   : login
    Created on : Jul 15, 2022, 10:11:33 PM
    Author     : LENOVO
--%>

<%@ page language="java" import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login JSP Page</title>
    </head>
    <body>
        <%
            String userName = request.getParameter("userName");
            String pass = request.getParameter("pass");
            
            if(userName.equals("admin") && pass.equals("pass1234")){
                        String site = new String("../admin/dashbord.jsp");
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", site);
            }
            
            else{
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
                PreparedStatement ps = con.prepareStatement("select * from register");
                
                int f=0;
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                    String userName1 = rs.getString(14);
                    String pass2 = rs.getString(15);
                    String userStatus = rs.getString(16);
//                    out.print(userName1);
                    
                    if(userName.equals(userName1) && pass.equals(pass2)){
                    	
                    	if(userStatus.equals("T")){
	                        String site = new String("../user/dashbord.jsp");
	                        response.setStatus(response.SC_MOVED_TEMPORARILY);
	                        response.setHeader("Location", site);
	                        f++;
	                        session.setAttribute("u_name", userName1);
                    	}
                    	else{
                    		
                            
                            out.println("<script type=\"text/javascript\">");
                        	out.println("alert('Your Account Is not verified.. Plz Wait !');");
                        	out.println("location='../index.html';");
                        	out.println("</script>");
                        	
                        	
                    	}
                    }
                }
                
                if(f <= 0){
                	out.println("<script type=\"text/javascript\">");
                	out.println("alert('Incorrect Username or Password... !');");
                	out.println("location='../index.html';");
                	out.println("</script>");
                }
            
            }
            catch(Exception e){
                out.print(e);
            }
            
            }
            %>
    </body>
</html>
