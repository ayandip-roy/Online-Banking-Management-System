<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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

                        <a href="./dashbord.jsp" class="nav-link text-left" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="flaticon-bar-chart-1"></i><i class="bx bxs-dashboard ico"></i> Dashboard
                        </a>
                    </li>

                    <li class="has-sub menuHover">
                        <!-- this link href="collapseExample1" shows submenue  -->
                        <a class="nav-link collapsed text-left" href="#collapseExample1" role="button"
                            data-toggle="collapse">
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


           
                    <li class="has-sub menuHover">
                        <a class="nav-link collapsed text-left active" href="#collapseExample2" role="button"
                            data-toggle="collapse">
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
                        <a href="./verifyUser.html" class="nav-link text-left" role="button">
                            <i class="flaticon-bar-chart-1"></i> <i class="bi bi-check-circle"></i> Verify Account <span
                                class="badge badge-success" style="font-size: 12px; margin-left: 50px;"> New</span>
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
                        <div type="button" id="bar" class="nav-icon1 hamburger animated fadeInLeft is-closed"
                            data-toggle="offcanvas">
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
                    <div class="container">
                        <h3 class="text-light">Active Account</h3>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="veryfy-user-account pb-4">
                                    <div class="card bg-dark">
                                        <div class="card-title text-light">Active Account <br>
                                            <span class="verify-text text-light">Vew All the user who is Active</span>
                                        </div>
                                        <div class="verify-table p-3 py-2">
                                            <table class="table table-hover table-dark">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" class="text-light">#</th>
                                                        <th scope="col" class="text-light">UserName</th>
                                                        <th scope="col" class="text-light">Name</th>
                                                        <th scope="col" class="text-light">Gender</th>
                                                        <th scope="col" class="text-light">A/C No</th>
                                                        <th scope="col" class="text-light">Status</th>
                                                    </tr>
                                                </thead>
                                                <%
                                                	try{
                                                		Class.forName("com.mysql.cj.jdbc.Driver");
												        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
												        PreparedStatement ps = con.prepareStatement("select * from register where userStatus='T'");
												        
												        ResultSet rs = ps.executeQuery();
												        
												        int countNumber = 0;
												        
												        while(rs.next()){
												        	String userStatus = rs.getString(16);
												        	
												        	String UserName = rs.getString(14);
												        	String fname = rs.getString(1);
												        	String lname = rs.getString(2);
												        	String fullName = fname+" "+lname;
												        	String gender = rs.getString(5);
												        	String accountNo = rs.getString(17);
							
												        	countNumber++;
												        	
												        	%>
												        	<tbody>
	                                                    		<tr>
	                                                        		<th scope="row" class="text-light"><% out.print(countNumber); %></th>
	                                                        		<td class="text-light"><% out.print(UserName); %></td>
	                                                        		<td class="text-light"><% out.print(fullName); %></td>
	                                                        		<td class="text-light"><% out.print(gender); %></td>
	                                                        		<td class="text-light"><% out.print(accountNo); %></td>
	                                                        		<td class="text-success">Active</td>
	                                                        		
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
                        </div>
                        <div id="id01" class="modal">
                            <div class="model-content">
                                <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card py-3">
                                            <form action="">
                                                <div class="card-body">
                                                    <div class="card-title">User Details</div>
                                                    <div class="row g-3">
                                                        <div class="col-md-6">
                                                            <label for="inputFirstname" class="form-label">First
                                                                Name</label>
                                                            <input type="text" class="form-control" id="inputFirstname">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputLastname" class="form-label">Lirst
                                                                Name</label>
                                                            <input type="text" class="form-control" id="inputLastname">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputFathername" class="form-label">Father's
                                                                Name</label>
                                                            <input type="text" class="form-control"
                                                                id="inputFathername">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputDateOfBirth" class="form-label">Date of
                                                                Birth</label>
                                                            <input type="date" class="form-control"
                                                                id="inputDateOfBirth">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputGender" class="form-label">Gender</label>
                                                            <input type="text" class="form-control" id="inputGender">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputPanNo" class="form-label">Phone
                                                                Number</label>
                                                            <input type="text" class="form-control" id="inputMobileNo">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputEmailId" class="form-label">Email
                                                                Id</label>
                                                            <input type="text" class="form-control" id="inputEmailId">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputPanNo" class="form-label">Pan
                                                                Number</label>
                                                            <input type="text" class="form-control" id="inputPanNo">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputAdharNo" class="form-label">Adhar
                                                                Number</label>
                                                            <input type="text" class="form-control" id="inputAdharNo">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputUserName" class="form-label">User
                                                                Name</label>
                                                            <input type="text" class="form-control" id="inputUserName">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputCity" class="form-label">City</label>
                                                            <input type="text" class="form-control" id="inputCity">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputState" class="form-label">State</label>
                                                            <input type="text" class="form-control" id="inputState">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputZip" class="form-label">Zip</label>
                                                            <input type="text" class="form-control" id="inputZip">
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-12 ms-auto">
                                                    <button type="submit" class="btn btn-primary float-end"
                                                        id="btnSubmit">Verify</button>
                                                </div>
                                            </form>
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

    <!-- Pop Up model  -->







    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

    <script src="../Js/admin/dounghatChart.js"></script>

    <script>
        $('#bar').click(function () {
            $(this).toggleClass('open');
            $('#page-content-wrapper ,#sidebar-wrapper').toggleClass('toggled');

        });

        // logout popover on profile 

        $("#AdminDropdown").click(function () {
            $(this).popover({

                title: 'Profile Detail',
                html: true,
                container: "body",
                placement: 'bottom',
                content: ` <a href="../index.html" role="button" class="btn btn-danger nav-link">Logout</a>`

            })
        });
    </script>

    <script>
        // Get the modal
        var modal = document.getElementById('id01');

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>

</body>

</html>