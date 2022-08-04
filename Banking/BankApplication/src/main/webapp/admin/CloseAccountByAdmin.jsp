<%@ page language="java" import="java.sql.*" %>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Dashboard</title>
    <link rel="icon" href="../Media/logo.png" type="image/png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700;800;900&display=swap" rel="stylesheet">


    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&family=Roboto:wght@300;400;500;700;900&display=swap"
        rel="stylesheet">
    <!--fontawesome-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="../Css/admin/dashbord.css">
    <link rel="stylesheet" href="../Css/admin/vreifyuser.css">

    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.2.0/dist/chart.min.js"></script>

    <style>
        .btn-circle.btn-md {
            width: 65px;
            height: 65px;
            padding: 7px 10px;
            border-radius: 45px;
            font-size: 10px;
            font-weight: bold;
            text-align: center;


        }
        
        @media (max-width: 768px) {
            .ShowHide {
                display: none;
            }
        }
    </style>


</head>

<body class="dark_bg">

<%
	
	String UserName = request.getParameter("userName");

	String firstName = null;
	String lastName = null;
	String userFatherName = null;
	String dob = null;
	String gender = null;
	String phNo = null;
	String emailId = null;
	String panNo = null;
	String adharNo = null;
	String city = null;
	String state = null;
	String zip = null;
	String userName = null;
	try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
    PreparedStatement ps = con.prepareStatement("delete from register where userName='"+UserName+"'");
    
    ps.executeUpdate();
    
    //while(rs.next()){
    	//userName = rs.getString(14);
		//out.print(userName);
		
		//firstName = rs.getString(1);
		//lastName = rs.getString(2);
		
		//userFatherName = rs.getString(3);
		//dob = rs.getString(4);
		//gender = rs.getString(5);
		//phNo = rs.getString(6);
		//emailId = rs.getString(7);
		//panNo = rs.getString(8);
		//adharNo = rs.getString(9);
		//city = rs.getString(11);
		//state = rs.getString(12);
		//zip = rs.getString(13);
		
		session.setAttribute("UserName1", userName);
		
		out.println("<script type=\"text/javascript\">");
    	out.println("alert('User Delete From DataBase Sucessfully... !');");
    	out.println("location='../admin/closeAccount.jsp';");
    	out.println("</script>");
		
    //}
	}
	catch(Exception e){
    	out.print(e);
	}
	%>

    

</body>

</html>