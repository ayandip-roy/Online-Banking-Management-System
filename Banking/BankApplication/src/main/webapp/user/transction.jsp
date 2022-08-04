<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page language="java" import="java.sql.*" %>
	<%@page import="java.util.*" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- ********** Custom CSS *********  -->
    <link rel="stylesheet" href="../Css/nav-side-bar.css">
    <link rel="stylesheet" href="../Css/user/transction.css">
    
    <title>Transaction Page</title>
</head>
    <body id="body-pd">
        <header class="header bg-primary" id="header">
            <div class="header_toggle text-light mx-2"> <i class='bx bx-menu' id="header-toggle"></i> 
            <a class="navbari-brand" href="#">
                <img src="../Media/logo.png" alt="" width="40" height="30">
            </a>
            </div>
            <div class="header_img"> 
                <img src="../Media/user.png" alt="" onclick="showProfileMenu();"> 
                <div class="menu">
                    <ul>
                        <li><a href="./profile.html"><i class="bi bi-person-circle"></i>Profile</a></li>
                        <li><a href="./setting.html"><i class="bi bi-gear"></i>Settings</a></li>
                        <li><a href="../Jsp/logout.jsp"><i class="bi bi-box-arrow-left"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </header>
        
        
        
        <div class="l-navbar" id="nav-bar">
            <nav class="nav">
                <div> <a href="./transaction.jsp" class="nav_logo text-light"> <i class='bx bx-layer nav_logo-icon'></i> <span
                            class="nav_logo-name">Transaction</span> </a>
                    <div class="nav_list"> 
                        <a href="./dashbord.jsp" class="nav_link"> 
                            <i class='fs-4 bi-speedometer2 nav_icon'></i> 
                            <span class="nav_name">Dashboard</span> 
                        </a> 
                        <a href="./sendMoney.html" class="nav_link"> 
                            <i class='fs bi-cash-coin nav_icon'></i> 
                            <span class="nav_name">Money Transfer</span> 
                        </a> 
                        <a href="./profile.jsp" class="nav_link"> 
                            <i class='fs-4 bi-person-circle nav_icon'></i> 
                            <span class="nav_name">Profile</span> 
                        </a> 
                        <a href="./transaction.jsp" class="nav_link active"> 
                            <i class='fs-4 bi-table nav_icon'></i> 
                            <span class="nav_name">Transaction</span> 
                        </a> 
                        <a href="./setting.jsp" class="nav_link"> 
                            <i class='fs-4 bi-gear nav_icon'></i> 
                            <span class="nav_name">Settings</span>  
                        </a>
                    </div>
                </div> 
                <a href="../Jsp/logout.jsp" class="nav_link"> 
                    <i class='bx bx-log-out nav_icon'></i> 
                    <span class="nav_name">SignOut</span> 
                </a>
            </nav>
        </div>
        <!--Container Main start-->
        <div class="height-100 bg-light">
            <div id="showBredcum">
                <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);"
                    aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#" class="text-dark">Home</a></li>
                        <li class="breadcrumb-item" aria-current="page">User</li>
                        <li class="breadcrumb-item" aria-current="page"><a href="#" class="text-primary">Transaction</a></li>
                    </ol>
                </nav>
            </div>

            <div class="transaction-history pb-4">
                <div class="card">
                    <div class="card-title">Transaction History <br>
                        <span class="transaction-text">Over View Of recent transaction</span> 
                    </div>
                    <div class="history-table p-3 py-2">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Account No</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Amount</th>
                                    <th scope="col">Transction Id</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            
           <%
           
           response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	

       	if(session.getAttribute("u_name")==null){
       		response.sendRedirect("../index.html");
       	}
        	String Session_u_name = (String)session.getAttribute("u_name");
        
        	String userName = null;
        	String date = null;
        	String Amount = null;
        	String transction_Id = null;
        	String AccountNo = null;
        	String type = null;
        	
        	int countId = 0;
        	try{
        		Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
                PreparedStatement ps = con.prepareStatement("select * from transction where userName='"+Session_u_name+"'");
                
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                	userName = rs.getString(1);
                	date = rs.getString(2);
                	Amount = rs.getString(3);
                	transction_Id = rs.getString(4);
                	AccountNo = rs.getString(5);
                	type = rs.getString(6);
                	countId++;
                	%>
                	<tbody>
                           <tr>
                              <th scope="row"><% out.print(countId); %></th>
                               <td><% out.print(AccountNo); %></td>
                               <td><% out.print(date); %></td>
                               <td><% out.print(Amount); %></td>
                               <td><% out.print(transction_Id); %></td>
                                <%
                                	if(type.equals("Dr.")){
                                		%><td class="text-danger"><% out.print(type); %></td><%
                                	}
                                	else{
                                		%><td class="text-success"><% out.print(type); %></td><%
                                	}
                                %>
                              </tr>  
                            </tbody>
                   <%
                }
        	}
        	catch(Exception e){
                out.print(e);
            }
            %>
                            
                        </table>
                    </div>
                </div>
            </div>
        </div>

       

        <!--Container Main end-->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        
    <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script> -->

       <script src="../Js/navbar.js"></script>
       <script src="../Js/sidebar.js"></script>
    </body>

</html>