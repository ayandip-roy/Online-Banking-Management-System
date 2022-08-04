<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page language="java" import="java.sql.*" %>
	<%@page import="java.util.*" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Dashboard</title>
    <link rel="icon" href="../Media/logo.png" type="image/png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700;800;900&display=swap" rel="stylesheet">


    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    <!--fontawesome-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="../Css/admin/dashbord.css">

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

	

	String userCount = "";
	String ActiveAccountCount = "";
	String UserVerificationCount = "";
	String DeActiveAccountCount = "";
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
        
        
        Statement st=con.createStatement();
        String strQuary = "select count(userName) UserAcCount from register";
        ResultSet rs2 = st.executeQuery(strQuary);
        
        
        while(rs2.next()){
        	userCount = rs2.getString(1);
        }
        
        // Active Acount Count
        Statement st2=con.createStatement();
        String strQuary2 = "select count(userName) UserAcCount from register where userStatus='T'";
        ResultSet rs3 = st2.executeQuery(strQuary2);
        
        
        while(rs3.next()){
        	ActiveAccountCount = rs3.getString(1);
        }
        
        // Account For Verification
        Statement st3=con.createStatement();
        String strQuary3 = "select count(userName) UserAcCount from register where userStatus='F'";
        ResultSet rs4 = st3.executeQuery(strQuary3);
        
        
        while(rs4.next()){
        	UserVerificationCount = rs4.getString(1);
        }
        
     // DeAccount For Verification
        Statement st4=con.createStatement();
        String strQuary4 = "select count(userName) UserAcCount from register where userStatus='F'";
        ResultSet rs5 = st4.executeQuery(strQuary4);
        
        
        while(rs5.next()){
        	DeActiveAccountCount = rs5.getString(1);
        }
		
	}
	catch(Exception e){
		out.print(e);
	}

%>

    <div id="wrapper">
        <div class="overlay"></div>

        <!-- Sidebar -->
        <nav class="fixed-top align-top" id="sidebar-wrapper" role="navigation">
            <div class="simplebar-content" style="padding: 0px;">
                <a class="sidebar-brand" href="">
                    <span class="align-middle"></span>
                </a>

                <ul class="navbar-nav align-self-stretch">

                    <!-- <li class="sidebar-header">
                        Pages
                    </li> -->
                    <li class="">

                        <a class="nav-link text-left active" href="./dashbord.jsp" aria-haspopup="true" aria-expanded="false">
                            <i class="flaticon-bar-chart-1"></i><i class="bx bxs-dashboard ico"></i> Dashboard
                        </a>
                    </li>

                    <li class="has-sub menuHover">
                        <!-- this link href="collapseExample1" shows submenue  -->
                        <a class="nav-link collapsed text-left" href="#collapseExample1" role="button" data-toggle="collapse">
                            <i class="flaticon-user"></i> <i class="bi bi-wallet2"></i> Wallet
                        </a>
                        <!-- id is a collapseExample1 -->
                        <div class="collapse menu mega-dropdown" id="collapseExample1">
                            <div class="dropmenu" aria-labelledby="navbarDropdown">
                                <div class="container-fluid ">
                                    <div class="row">
                                        <div class="col-lg-12 px-2">
                                            <div class="submenu-box">
                                                <ul class="list-unstyled m-0">
                                                    <li><a href="./withdrawMoney.html">Withdraw Money</a></li>
                                                    <li><a href="./depositMoney.html">Deposit Money</a></li>

                                                </ul>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>


                 <!--     <li class="menuHover">
                        <a href="./moneyTransferAdmin.html" class="nav-link text-left" role="button">
                            <i class="flaticon-bar-chart-1"></i><i class="bi bi-arrow-left-right"></i> Transfer
                        </a>
                    </li>-->

                    <li class="has-sub menuHover">
                        <a class="nav-link collapsed text-left" href="#collapseExample2" role="button" data-toggle="collapse">
                            <i class="flaticon-user"></i> <i class="bi bi-person-circle"></i> Customer Accounts
                        </a>
                        <div class="collapse menu mega-dropdown" id="collapseExample2">
                            <div class="dropmenu" aria-labelledby="navbarDropdown">
                                <div class="container-fluid ">
                                    <div class="row">
                                        <div class="col-lg-12 px-2">
                                            <div class="submenu-box">
                                                <ul class="list-unstyled m-0">
                                                    <li><a href="./EditProfile.jsp">Edit Account</a></li>
                                                    <li><a href="./activeUser.jsp">Activate Account</a></li>
                                                    <li><a href="./deactiveUser.jsp">Deactivate Account</a></li>
                                                    <li><a href="./closeAccount.jsp">Close Account</a></li>
                                                </ul>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="menuHover box-icon">
                    
                        <a href="./userVerification.jsp" class="nav-link text-left" role="button">
                            <i class="flaticon-bar-chart-1"></i> <i class="bi bi-check-circle"></i> Verify Account <span class="badge badge-success" style="font-size: 12px; margin-left: 50px;"> New</span>
                        </a>
           
                    </li>
                    <li class="menuHover">
                        <a class="nav-link text-left" role="button" href="../index.html">
                            <i class="flaticon-map"></i><i class="bi bi-box-arrow-left"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- /#sidebar-wrapper -->


        <!-- Page Content -->
        <div id="page-content-wrapper">


            <div id="content">

                <div class="container-fluid p-0 px-lg-0 px-md-0">
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light gray_bg my-navbar">

                        <!-- Sidebar Toggle (Topbar) -->
                        <div type="button" id="bar" class="nav-icon1 hamburger animated fadeInLeft is-closed" data-toggle="offcanvas">
                            <span class="light_bg"></span>
                            <span class="light_bg"></span>
                            <span class="light_bg"></span>
                        </div>

                        <div class="container">
                            <a class="navbar-brand" href="#">
                              <img src="../Media/logo.png" alt="" width="30" height="24">
                            </a>
                        </div>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            


                            <li>
                                <a class="nav-link" href="#" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
                                    <img id="AdminDropdown" class="img-profile rounded-circle" src="../Media/male-image.webp">
                                </a>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid px-lg-4 dark_bg light">
                        <div class="row">
                            <div class="col-md-12 mt-lg-4 mt-4">
                                <!-- Page Heading -->
                                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                    <h1 class="h3 mb-0 light">Dashboard</h1>
                                    <div>
                                        <a href="./depositMoney.html" role="button" class="btn btn-success btn-circle btn-md ShowHide mr-5">
                                            <div><i class='bi bi-arrow-down'></i></div>Deposit
                                        </a>
                                        <a href="./withdrawMoney.html" role="button" class="btn btn-danger btn-circle btn-md ShowHide mr-5">
                                            <div><i class='bi bi-arrow-up'></i></div>Withdraw
                                        </a>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="card gray_bg">
                                            <div class="card-body card-shadow">
                                                <h5 class="card-title light mb-4 ">Total Customer</h5>
                                                <h1 class="display-5 mt-1 mb-3 light"></h1>
                                                <div class="mb-1">
                                                    <span class="text-danger"> <i class="mdi mdi-arrow-bottom-right"></i></span>
                                                    <span class="text-muted light"><% out.print(userCount); %></span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-3">
                                        <div class="card gray_bg">
                                            <div class="card-body card-shadow">
                                                <h5 class="card-title light mb-4">Active Accounts</h5>
                                                <h1 class="display-5 mt-1 mb-3 light"></h1>
                                                <div class="mb-1">
                                                    <span class="text-danger"> <i class="mdi mdi-arrow-bottom-right"></i></span>
                                                    <span class="text-muted light"><% out.print(ActiveAccountCount); %></span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-3">
                                        <div class="card gray_bg">
                                            <div class="card-body card-shadow">
                                                <h5 class="card-title light mb-4">Accounts for Verification</h5>
                                                <h1 class="display-5 mt-1 mb-3 light"></h1>
                                                <div class="mb-1">
                                                    <span class="text-danger"> <i class="mdi mdi-arrow-bottom-right"></i></span>
                                                    <span class="text-muted light"><% out.print(UserVerificationCount); %></span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-3">
                                        <div class="card gray_bg">
                                            <div class="card-body card-shadow">
                                                <h5 class="card-title light mb-4">Deactivated Accounts</h5>
                                                <h1 class="display-5 mt-1 mb-3 light"></h1>
                                                <div class="mb-1">
                                                    <span class="text-success"> <i class="mdi mdi-arrow-bottom-right"></i></span>
                                                    <span class="text-muted light"><% out.print(DeActiveAccountCount); %></span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>


                            </div>

                            <div class="col-md-12">

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card gray_bg">
                                            <div class="card-body card-shadow">
                                                <h5 class="card-title light mb-4 ">Daily Account Created</h5>
                                                <canvas id="Customer" width="600" height="200"></canvas>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-6">

                                        <div class="row">
                                            <div class="col-sm-6">

                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="card gray_bg">
                                                            <div class="card-body card-shadow">

                                                                <div class="d-flex justify-content-center">
                                                                    <a role="button" href="./EditProfile.jsp" class="btn text-decoration-none btn-custo mt-3 mb-3"><i class="bi bi-pencil-square px-2"></i>Edit Account</a>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <div class="card gray_bg">
                                                            <div class="card-body card-shadow">

                                                                <div class="d-flex justify-content-center">
                                                                    <a role="button" href="./userVerification.jsp" class="btn text-decoration-none btn-custo mt-3 mb-3"><i class="bi bi-patch-check-fill px-2"></i> Verification Account</a>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-sm-6">
                                                <div class="card gray_bg">
                                                    <div class="card-body card-shadow">
                                                        <h5 class="card-title light mb-4">Account Status</h5>
                                                        <canvas id="Accounts"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <footer class="footer gray_bg">
                    <div class="container-fluid">
                        <div class="row text-muted">
                            <div class="col-6 text-left">
                                <p class="mb-0">
                                    <a href="" class="text-muted light"><strong>ABC BANK
                                        </strong></a> &copy
                                </p>
                            </div>
                            <div class="col-6 text-right">
                                <ul class="list-inline">

                                    <li class="footer-item">
                                        <a class="text-muted light" href="">Privacy</a>
                                    </li>
                                    <li class="footer-item">
                                        <a class="text-muted light" href="">Terms</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </footer>


            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->





    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <script src="../Js/admin/dounghatChart.js"></script>

    <script>
        $('#bar').click(function() {
            $(this).toggleClass('open');
            $('#page-content-wrapper ,#sidebar-wrapper').toggleClass('toggled');

        });

        // logout popover on profile 

        $("#AdminDropdown").click(function() {
            $(this).popover({

                title: 'Profile Detail',
                html: true,
                container: "body",
                placement: 'bottom',
                content: ` <a href="../index.html" role="button" class="btn btn-danger nav-link">Logout</a>`

            })
        });
    </script>

</body>

</html>