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
    <link rel="stylesheet" href="../Css/nav-side-bar.css">
    <link rel="stylesheet" href="../Css/user/setting.css">
    <title>Settings Page</title>
    <link rel="icon" href="../Media/logo.png" type="image/png">

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
                        <li><a href="./profile.jsp"><i class="bi bi-person-circle"></i>Profile</a></li>
                        <li><a href="./setting.jsp"><i class="bi bi-gear"></i>Settings</a></li>
                        <li><a href="../index.html"><i class="bi bi-box-arrow-left"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="l-navbar" id="nav-bar">
            <nav class="nav">
                <div> <a href="./setting.jsp" class="nav_logo text-light"> <i class='bx bx-layer nav_logo-icon'></i> <span
                            class="nav_logo-name">Settings</span> </a>
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
                        <a href="./transction.jsp" class="nav_link"> 
                            <i class='fs-4 bi-table nav_icon'></i> 
                            <span class="nav_name">Transaction</span> 
                        </a> 
                        <a href="./setting.jsp" class="nav_link active"> 
                            <i class='fs-4 bi-gear nav_icon'></i> 
                            <span class="nav_name">Settings</span>  
                        </a>
                    </div>
                </div> 
                <a href="../index.html" class="nav_link"> 
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
                        <li class="breadcrumb-item" aria-current="page"><a href="#" class="text-primary">Settings</a></li>
                    </ol>
                </nav>
            </div>
            <div class="container" id="settings">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                            <%
                            		
                            	
                            		String Session_u_name = (String)session.getAttribute("u_name");
                            
                            %>
                                <div class="card-title">Change User Name</div>
                                <form action="../Jsp/userChangeUserName.jsp" class="p-3">
                                    <div class="mb-3">
                                        <input type="text" class="form-control" name="currentUserName" id="currentUserName" value="<% out.print(Session_u_name); %>" disabled>
                                    </div>
                                    <div class="mb-3">
                                        <input type="text" class="form-control" name="newUserName" id="newUserName" value="" placeholder="Enter New Username">
                                        <div id="AvableUserName" class="UserNameAvable">
                                            <!-- <input type="text" name="accountHolderName" value="Kaushik Mondal"> -->
                                            <span>Available</span>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <input type="Password" class="form-control" name="currentPass" id="password" value="" placeholder="Enter Your Password" onclick="verifyAvailability();">
                                    </div>
                                    <div class="mb-3 text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">Change Password</div>
                                <form action="../Jsp/userChangePassowrd.jsp" class="p-3">
                                    <div class="mb-3">
                                        <input type="password" class="form-control" name="CcurrentPassword" id="currentPassword" value="" placeholder="Enter Current Password">
                                    </div>
                                    <div class="mb-3">
                                        <input type="password" class="form-control" name="cNewPassword" id="newPassword" value="" placeholder="Enter New Password" aria-describedby="passwordHelp">
                                        <div id="passwordHelp" class="form-text">Your password must be 8-12 characters long, contain letters and numbers, and must not contain spaces, special characters .</div>
                                    </div>
                                    <div class="mb-3">
                                        <input type="Password" class="form-control" name="cConfirmPassword" id="ConfirmPassword" value="" placeholder="Enter Confirm Password">
                                    </div>
                                    <div class="mb-3 text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">Active / Deactive Account</div>
                                <form action="">
                                    <div class="switch_box box_1">
                                        <input type="checkbox" class="switch_1">
                                    </div>
                                </form>
                            </div>
                        </div>
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
        
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

       <script src="../Js/navbar.js"></script>
       <script src="../Js/sidebar.js"></script>

       <script>
        function verifyAvailability() {
            const toggleName = document.querySelector('.UserNameAvable');
            toggleName.classList.toggle('activeUserNameAvable');
        }
    </script>
    </body>

</html>