<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deposit Page</title>
</head>
<body>

<%
	String sendAccNo = request.getParameter("sendAccNo"); 
	String amount = request.getParameter("sendAmmount");
	
	//out.print(amount);
	//out.print(sendAccNo);
	
	double sendAmount = Double.parseDouble(amount);
	String updateBalaneS = null;

	double updateBalane = 0;
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
        
        PreparedStatement ps1 = con.prepareStatement("select * from register where accountNo='"+sendAccNo+"'");
        
        ResultSet rs1 = ps1.executeQuery();
        
        while(rs1.next()){
        	String accountbalanceOld = rs1.getString(18);
        	double accountbalanceOldD = Double.parseDouble(accountbalanceOld);
        	updateBalane = sendAmount + accountbalanceOldD;
        	
        }
        
        PreparedStatement ps = con.prepareStatement("update register set balance = '"+updateBalane+"'where accountNo='"+sendAccNo+"'");
        ps.executeUpdate();
        
        out.println("<script type=\"text/javascript\">");
    	out.println("alert('Money Added Sucessfully... !');");
    	out.println("location='../admin/depositMoney.html';");
    	out.println("</script>");
	}
	catch(Exception e){
        out.print(e);
    }
%>
</body>
</html>