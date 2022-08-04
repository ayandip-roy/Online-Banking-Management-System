<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page language="java" import="java.sql.*" %>
    <%@page import="java.util.*" %>
    <%@ page language="java" import ="java.time.format.DateTimeFormatter"  %>
<%@ page language="java" import ="java.time.LocalDateTime"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String Session_u_name = (String)session.getAttribute("u_name");
		String userAccountNo = request.getParameter("userAccountNo"); 
		String userSendAmount = request.getParameter("userSendAmount");
		
		double sendAmount = Double.parseDouble(userSendAmount);
		String updateBalaneS = null;
		String updateSendUserBalance = null;
		
		double accountbalanceOldD = 0;
	
		double updateBalane = 0;
		double updateSuserbalance = 0;
		
		String reciverUserName = null;
		String SenderccountNo = null;
		
		//Random Transction Id Generator 
		
		Random rand = new Random();
		int n = rand.nextInt(90000)+1000000;
		Random rand2 = new Random();
		int n2 = rand2.nextInt(90000)+1000;
		String transctionNo = "Aeddb"+n+"ghadj"+n2;
		
		//Local data And time
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();  
		
		//transction table data sender
		String SUserName= Session_u_name;
		String Sdate = dtf.format(now);
		String SAmount = userSendAmount;
		String Stype = "Dr.";
		String Stransction_id = transctionNo;
		String ReciverAccountNo = userAccountNo;
        
		// Transction Data Reciver
		
		String RUserName = reciverUserName;
		String Rdate = dtf.format(now);
		String RAmount = userSendAmount;
		String Rtype = "Cr.";
		String Rtransction_id = transctionNo;
		String SenderAccountNo = SenderccountNo;
		
		try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
	        
	        // Fatch reciver user Account
	        
	        PreparedStatement ps1 = con.prepareStatement("select * from register where accountNo='"+userAccountNo+"'");
	        ResultSet rs1 = ps1.executeQuery();	        
	        while(rs1.next()){
	        	reciverUserName = rs1.getString(14);
	        	String accountbalanceOld = rs1.getString(18);
	        	accountbalanceOldD = Double.parseDouble(accountbalanceOld);
	        	updateBalane = sendAmount + accountbalanceOldD;	        	
	        }
	        
	        if(sendAmount<accountbalanceOldD){
	        
	        //Select send user details
	        PreparedStatement ps3 = con.prepareStatement("select * from register where userName='"+Session_u_name+"'");
	        ResultSet rs2 = ps3.executeQuery();	        
	        while(rs2.next()){
	        	SenderccountNo = rs2.getString(17);
	        	String SendUserOldbalance = rs2.getString(18);
	        	double SendUserOldbalanceD = Double.parseDouble(SendUserOldbalance);
	        	updateSuserbalance = SendUserOldbalanceD - sendAmount;
	        }
	        	        	        
	        //update reciver balance
	        PreparedStatement ps = con.prepareStatement("update register set balance = '"+updateBalane+"'where accountNo='"+userAccountNo+"'");
	        ps.executeUpdate();
	        
	        // update sender balance
	        PreparedStatement ps4 = con.prepareStatement("update register set balance = '"+updateSuserbalance+"'where userName='"+Session_u_name+"'");
	        ps4.executeUpdate();
	        
	        
	        // insert sender data in transction table 
	        
	        PreparedStatement ps5 = con.prepareStatement("insert into transction values(?,?,?,?,?,?)");
	        ps5.setString(1, SUserName);
	        ps5.setString(2, Sdate);
	        ps5.setString(3, SAmount);
	        ps5.setString(4, Stransction_id);
	        ps5.setString(5, ReciverAccountNo);
	        ps5.setString(6, Stype);
	        
	        ps5.executeUpdate();
	        
			// insert reciver data in transction table 
	        
	        PreparedStatement ps6 = con.prepareStatement("insert into transction values(?,?,?,?,?,?)");
	        ps6.setString(1, reciverUserName);
	        ps6.setString(2, Rdate);
	        ps6.setString(3, RAmount);
	        ps6.setString(4, Rtransction_id);
	        ps6.setString(5, SenderccountNo);
	        ps6.setString(6, Rtype);
	        
	        ps6.executeUpdate();
	        
	        
	        //out.print(transctionNo);
	        
	        out.println("<script type=\"text/javascript\">");
	    	out.println("alert('Money Transfer Sucessfully from... !');");
	    	out.println("location='../user/sendMoney.html';");
	    	out.println("</script>");
	    	
	        //out.println("Sender UserName "+SUserName+"<br>");
	        //out.println("Send Date "+Sdate+"<br>");
	        //out.println("Send Ammount "+SAmount+"<br>");
	        //out.println("Type "+Stype+"<br>");
	        //out.println("Transction Id "+Stransction_id+"<br>");
	        //out.println("Reciver Acc "+ReciverAccountNo+"<br>");
	        //out.println("Reciver UserName "+reciverUserName+"<br>");
	        //out.println("Recived Date "+Rdate+"<br>");
	        //out.println("Reciverd Amount: "+RAmount+"<br>");
	        //out.println("Transction Id"+Rtransction_id+"<br>");
	        //out.println("Sender Account No "+SenderccountNo+"<br>");
	        //out.println("Type "+Rtype+"<br>");
	        
		}
		else{
			out.println("<script type=\"text/javascript\">");
    		out.println("alert('InSuffcient Balance.. !');");
    		out.println("location='../user/sendMoney.html';");
    		out.println("</script>");
		}
		}
		catch(Exception e){
	        out.print(e);
	    }
	%>


</body>
</html>