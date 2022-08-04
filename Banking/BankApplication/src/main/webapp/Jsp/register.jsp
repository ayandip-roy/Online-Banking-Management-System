<%-- 
    Document   : register
    Created on : Jul 15, 2022, 9:14:54 PM
    Author     : LENOVO
--%>
<%@ page language="java" import="java.sql.*" %>
<%@page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String fatherName = request.getParameter("fatherName");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String phNo = request.getParameter("phNo");
            String emailId = request.getParameter("emailId");
            String panNo = request.getParameter("panNo");
            String adharNo = request.getParameter("adharNo");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            String userName = request.getParameter("userName");
            String pass = request.getParameter("pass");
            String ConPass = request.getParameter("conPass");
            
            Random rand = new Random();	
        	int n = rand.nextInt(900000000)+1000000000;
        	
        	String accountNo = "002"+n;
            
            if(pass.equals(ConPass)){
         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
                    PreparedStatement ps = con.prepareStatement("insert into register values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            
                    ps.setString(1, fname);
                    ps.setString(2, lname);
                    ps.setString(3, fatherName);
                    ps.setString(4, dob);
                    ps.setString(5, gender);
                    ps.setString(6, phNo);
                    ps.setString(7, emailId);
                    ps.setString(8, panNo);
                    ps.setString(9, adharNo);
                    ps.setString(10, address);
                    ps.setString(11, city);
                    ps.setString(12, state);
                    ps.setString(13, zip);
                    ps.setString(14, userName);
                    ps.setString(15, pass);
                    ps.setString(16, "F");
                    ps.setString(17, accountNo);
                    ps.setString(18, "0");
                    
                    
                    ps.executeUpdate();
                    
                    String site = new String("../user/sucessR.html");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
            }
            catch(Exception e){
                out.print(e);
            }
            }
            else{
            	out.println("<script type=\"text/javascript\">");
            	out.println("alert('Password & Confirm Password DoesNot Maych. !');");
            	out.println("location='../user/register2.html';");
            	out.println("</script>");
            }
            %>
            
            
    </body>
</html>
