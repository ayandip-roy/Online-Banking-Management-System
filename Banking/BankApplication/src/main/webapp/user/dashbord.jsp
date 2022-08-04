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
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ******** Custom  File ************  -->
    <link rel="stylesheet" href="../Css/nav-side-bar.css">
    <link rel="stylesheet" href="../Css/user/dashbord.css">
    <link rel="stylesheet" href="../Css/user/card.css">

    <!-- ******* Chart ***********  -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


    <title>Dashboard</title>
    <link rel="icon" href="../Media/logo.png" type="image/png">
</head>

<body id="body-pd">

<%

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	

	if(session.getAttribute("u_name")==null){
		response.sendRedirect("../index.html");
	}
	String Session_u_name = (String)session.getAttribute("u_name");

	String balance = null;
	String countCrMoney="0";
	
	String firstName = null;
	String lastName = null;
	String name = null;
	String countDrMoney="0";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
        PreparedStatement ps = con.prepareStatement("select * from register where userName='"+Session_u_name+"'");
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
        	firstName = rs.getString(1);
        	lastName = rs.getString(2);
        	name = firstName+" "+lastName;
        	balance = rs.getString(18);
        }
        
        
        
        // Last Month Cidited Money
        Statement st=con.createStatement();
        String strQuary = "select sum(amount) criditMoney from transction where userName='"+Session_u_name+"' and type='Cr.'";
        ResultSet rs2 = st.executeQuery(strQuary);
        
        
        while(rs2.next()){
        	countCrMoney = rs2.getString(1);
        }
        
        // Debited Money
        
        Statement st2=con.createStatement();
        String strQuary2 = "select sum(amount) criditMoney from transction where userName='"+Session_u_name+"' and type='Dr.'";
        ResultSet rs3 = st2.executeQuery(strQuary2);
        
        
        while(rs3.next()){
        	countDrMoney = rs3.getString(1);
        }
        
	}
	catch(Exception e){
        out.print(e);
    }

%>


    <header class="header bg-primary mb-5" id="header">
        <div class="header_toggle text-light mx-2"> <i class='bx bx-menu' id="header-toggle"></i>
            <a class="navbari-brand" href="#">
                <img src="../Media/logo.png" alt="" width="40" height="30">
            </a>
        </div>
        <div class="header_img">
            <img src="../Media/user.png" alt="" onclick="showProfileMenu();">
            <div class="menu">
                <ul>
                    <li><a href="./profile.jsp"><i class="bi bi-person-circle"></i>Profile</a></li>
                    <li><a href="./setting.jsp"><i class="bi bi-gear"></i>Settings</a></li>
                    <li><a href="../index.html" onclick="DestropySession();"><i class="bi bi-box-arrow-left"></i>Logout</a></li>
                </ul>
            </div>
        </div>
    </header>
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div> <a href="./dashbord.jsp" class="nav_logo text-light"> <i class='bx bx-layer nav_logo-icon'></i> <span
                        class="nav_logo-name">Dashboard</span> </a>
                <div class="nav_list">
                    <a href="./dashbord.jsp" class="nav_link active">
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
                    <a href="./transction.jsp" class="nav_link">
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
                    <li class="breadcrumb-item">User</li>
                    <li class="breadcrumb-item"><a href="#" class="text-primary">Dashbord</a></li>
                </ol>
            </nav>
        </div>

        <div class="dashboard-card">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="card m-2">
                        <div class="card-title p-3">Balance</div>
                        <div class="card-body">Your total Balance <span
                                class="text-primary ms-4 float-right"><% out.print(balance); %></span></div>
                    </div>
                </div>
          
                <div class="col-lg-4 col-md-6">
                    <div class="card m-2">
                        <div class="card-title p-3">Credit Money</div>
                        <div class="card-body">Since Last Month <span class="text-primary ms-4"><% out.print(countCrMoney); %></span></div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="card m-2">
                        <div class="card-title p-3">Debited Money</div>
                        <div class="card-body">Since Last Month <span class="text-primary ms-4"><% out.print(countDrMoney); %></span></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="moneyChart my-4">
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="card">
                        <canvas id="BarChart" class="m-5"></canvas>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card atm-card">
                        <h5 class="text-primary float-start"><b><em>ATM CARD</em></b></h5>
                        <div class="cridit-card">
                            <div class="card__front card__part">
                              <img class="card__front-square card__square" src="../Media/logo.png">
                              <img class="card__front-logo card__logo" src="../Media/visa-card.png">
                              <p class="card_numer">3452 3452 3452 6258</p>
                              <div class="card__space-75">
                                <span class="card__label">Card holder</span>
                                <p class="card__info"><% out.print(name); %></p>
                              </div>
                              <div class="card__space-25">
                                <span class="card__label">Expires</span>
                                      <p class="card__info">10/25</p>
                              </div>
                            </div>
                            
                            <div class="card__back card__part">
                              <div class="card__black-line"></div>
                              <div class="card__back-content">
                                <div class="card__secret">
                                  <p class="card__secret--last">420</p>
                                </div>
                                <img class="card__back-square card__square" src="https://i1.wp.com/abacusbooksonline.com/wp-content/uploads/2016/12/square_inc-_logo-svg3.png?resize=620%2C155&ssl=1">
                                <img class="card__back-logo card__logo" src="https://clipground.com/images/discover-logo-clipart-2.jpg">
                                
                              </div>
                            </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <div class="transaction-history pb-4">
            <div class="card">
                <div class="card-title">Transaction History  
                    <span class="btn ml-auto"><a href="./transction.jsp">View More</a></span> <br>
                    <span class="transaction-text">Over View Of recent transaction</span> 
                </div>
                <div class="history-table p-3 py-2">
                    <table class="table table-hover">
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
                PreparedStatement ps = con.prepareStatement("select * from transction where userName='"+Session_u_name+"' LIMIT 5");
                
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->

    <!-- ************* Custom JavaScript File **********  -->
    <script src="../Js/sidebar.js"></script>
    <script src="../Js/navbar.js"></script>

    <!-- ************ Chart Script *********  -->
    <script src="../Js/BarChart.js"></script>



</body>

</html>