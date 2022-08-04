<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
		String Session_edit_name = (String)session.getAttribute("UserName1");
		
		String firstName = request.getParameter("editFirstName");
		String lastName = request.getParameter("editLastName");
		String userFatherName = request.getParameter("editUserFatherName");
		String phNo = request.getParameter("editPhNo");
		String emailId = request.getParameter("editEmailId");
		String city = request.getParameter("editCity");
		String state = request.getParameter("editState");
		String zip = request.getParameter("editZip");
		//String adharNo = request.getParameter("editFirstName");
		//String panNo = request.getParameter("editFirstName");
		//String gender = request.getParameter("editFirstName");
		//String dob = request.getParameter("editFirstName");
		//String userName = request.getParameter("editFirstName");
		
		try{
			
			out.print(Session_edit_name);
			
			//update register set balance = '"+updateBalane+"'where accountNo='"+sendAccNo+"'"
			
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
            PreparedStatement ps = con.prepareStatement("update register set firstName=?, lastName=?, fatherName=?, phoneNo=?, emailId=?, city=?, state=?, zip=? where userName='"+Session_edit_name+"'" );
            
            ps.setString(1,firstName);
            ps.setString(2,lastName);
            ps.setString(3,userFatherName);
            ps.setString(4,phNo);
            ps.setString(5,emailId);
            ps.setString(6,city);
            ps.setString(7,state);
            ps.setString(8,zip);
            ps.executeUpdate();
            
            out.println("<script type=\"text/javascript\">");
        	out.println("alert('User Details Edit Sucessfully... !');");
        	out.println("location='../admin/EditProfile.jsp';");
        	out.println("</script>");
		}
		catch(Exception e){
            out.print(e);
        }

%>



</body>
</html>