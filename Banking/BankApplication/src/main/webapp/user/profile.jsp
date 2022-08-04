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
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../Css/nav-side-bar.css">
    <link rel="stylesheet" href="../Css/user/profile.css">
    
    <title>Profile Page</title>
    <link rel="icon" href="../Media/logo.png" type="image/png">
</head>
    <body id="body-pd">
        
        <%
        	
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	

    	if(session.getAttribute("u_name")==null){
    		response.sendRedirect("../index.html");
    	}
        
            String Session_u_name = (String)session.getAttribute("u_name");
        	
        
    	
        
        
        	
            
        	String fname = null;
        	String lname = null;
        	String fullName = null;
        	
        	String phNo = null;
            String emailId = null;
            String panNo = null;
            String adharNo = null;
            String userName1 = null;
            String accountNo = null;
            String bankIFSC = "ABCB564374";
            String accountStatus =null;
            String balance = null;
            
            String gender = null;
        	
        	
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","1234");
                PreparedStatement ps = con.prepareStatement("select * from register where userName='"+Session_u_name+"'");
                
                ResultSet rs = ps.executeQuery();
                
//                String fname1;
                
                while(rs.next()){
                    fname = rs.getString(1);
                    lname = rs.getString(2);
                    
                    fullName = fname + " " + lname;
                    
                    gender = rs.getString(5);
                    phNo = rs.getString(6);
                    emailId = rs.getString(7);
                    panNo = rs.getString(8);
                    adharNo = rs.getString(9);
                    userName1 = rs.getString(14);
                    accountNo = rs.getString(17);
                    accountStatus = rs.getString(16);
                    balance = rs.getString(18);
                    
                    
                }
                
                
            
            }
            catch(Exception e){
                out.print(e);
            }
            %>
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
                        <li><a href="../Jsp/logout.jsp" onclick="DestropySession();"><i class="bi bi-box-arrow-left"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="l-navbar" id="nav-bar">
            <nav class="nav">
                <div> <a href="./profile.jsp" class="nav_logo text-light"> <i class='bx bx-layer nav_logo-icon'></i> <span
                            class="nav_logo-name">Profile</span> </a>
                    <div class="nav_list"> 
                        <a href="./dashbord.jsp" class="nav_link"> 
                            <i class='fs-4 bi-speedometer2 nav_icon'></i> 
                            <span class="nav_name">Dashboard</span> 
                        </a> 
                        <a href="./sendMoney.html" class="nav_link"> 
                            <i class='fs bi-cash-coin nav_icon'></i> 
                            <span class="nav_name">Money Transfer</span> 
                        </a> 
                        
                        <a href="./profile.jsp" class="nav_link active"> 
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
                    <span class="nav_name">Sign Out</span> 
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
                        <li class="breadcrumb-item"><a href="#" class="text-primary">Profile</a></li>
                    </ol>
                </nav>
            </div>

            <div class="profile-page">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card text-center mb-2">
                            <img src="../Media/Profile-background-image.jpg" class="card-img-top" alt="">
                            <div class="card-body">
                            
                            <%
                            	if(gender.equals("male")){
	                                %><img src="../Media/male-image.webp" width="100" height="100" alt="" class="profile-img"><%
                            		
                            	}
                            	else{
                            		%><img src="../Media/user.png" width="100" height="100" alt="" class="profile-img"><%
                            	}
                            
                            %>
                            
                              <h5 class="card-title profile-title"><% out.print(fullName); %></h5>
                              <p class="card-text"></p>
                              <%
                              	if(gender.equals("male")){
                              		%><i class="bi bi-gender-male" style="font-size: 3rem !important;"></i><br><%
                              	}
                              	else{
                              		%><i class="bi bi-gender-female" style="font-size: 3rem !important; color: rgb(191, 15, 162) !important"></i><br><%
                              	}
                              %>
                              
                              <!--  <a href="#" class="btn btn-primary" onclick="document.getElementById('id01').style.display='block'" style="width:auto;"><i class="bi bi-pencil-square"></i>Edit Profile</a>-->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card mb-2">
                                    <div class="card-body">
                                        <div class="card-title card-titles">
                                            <p><b>Balance</b></p>
                                            <p><i class="bi bi-currency-dollar"></i></p>
                                        </div>
                                        <div class="card-text card-texts">
                                            <p>Your Total Balance</p>
                                             <p><% out.print(balance); %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 my-2">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card mb-2">
                                            <div class="card-body">
                                                <div class="card-title card-titles">
                                                    <p><b>Account Details</b></p>
                                                    <p><i class="bi bi-person-circle"></i></p>
                                                </div>
                                                <div class="account-details">
                                                    <table class="table table-borderless">
                                                        <tr>
                                                            <th>A/C Numbar:</th>
                                                            <td><% out.print(accountNo); %></td>
                                                        </tr>
                                                        <tr>
                                                            <th>IFSC Code:</th>
                                                            <td><% out.print(bankIFSC); %></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Account Type:</th>
                                                            <td>Saving</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Addhar Nunbar:</th>
                                                            <td><% out.print(adharNo); %></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Pan Numbar:</th>
                                                            <td><% out.print(panNo); %></td>
                                                        </tr>
                                                        <tr>
                                                            <th>A/C Status:</th>
                                                            <%
                                                            	if(accountStatus.equals("T")){
                                                            		%><td class="text-success">Active</td><%
                                                            	}
                                                            	else{
                                                            		%><td class="text-danger">Deactivate</td><%
                                                            	}
                                                            %>
                                                            
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card mb-2">
                                    <div class="card-body">
                                        <div class="card-title card-titles">
                                            <p><b>Saving Balance</b></p>
                                            <p><i class="bi bi-piggy-bank-fill"></i></p>
                                        </div>
                                        <div class="card-text card-texts">
                                            <p>Your Total Saving</p>
                                             <p>100</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="card my-2">
                                    <div class="card-body">
                                        <div class="card-title card-titles">
                                            <p><b>Login Details</b></p>
                                            <p><i class="bi bi-key-fill"></i></p>
                                        </div>
                                        <div class="card-text card-texts">
                                            <div>
                                                <p>User Name</p>
                                                <p>Password</p>
                                            </div>
                                            <div>
                                                <p><% out.print(userName1); %></p>
                                                <p>***********</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="card my-2">
                                    <div class="card-body">
                                        <div class="card-title card-titles">
                                            <p><b>Contact Details</b></p>
                                            <p><i class="bi bi-telegram"></i></p>
                                        </div>
                                        <div class="card-text card-texts">
                                            <div>
                                                <p>Mobile No</p>
                                                <p>Email Id</p>
                                            </div>
                                            <div>
                                                <p>+91<span class="mx-1"><% out.print(phNo); %></span></p>
                                                <p><% out.print(emailId); %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- ********** pop Up From *****  -->
            <div id="id01" class="modal">
                <form class="modal-content animate" action="" method="post" enctype="multipart/form-data">
                    <div class="imgcontainer">
                        <!-- <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span> -->
                        <h5><b>Edit Profile</b></h5>
                    </div>
                      <div class="container">
                        <div class="row mt-4 mr-5">
                            <div class="col-lg-12 uploafProfileimage">
                                <!-- Profile Image Show Here -->
                                <div class="d-flex justify-content-center">
                                    <div>
                                        <i id="ProfileIcon" class="bi bi-person-circle" style="color: #a8a8a8; font-size: 9rem;"></i>
                                        <img hidden class="profileImage" id="ModalProfileImg" alt="profile">
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center mt-4">
                                    <input type="file" name="upload" id="upload" hidden>
    
                                    <label id="uploadLabel" for="upload" class="btn btn-primary profileUpload">
                                        <i class="bi bi-camera" style="font-size: 2rem; margin-top: 5px"></i>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label for="exampleInputText" class="form-label"><b>Enter Your Bio</b></label>
                                    <input type="text" class="form-control" id="exampleInputText">
                                </div>
                                <span class="mb-4"><b>Select Your Gender</b></span><br>
                                <div class="form-check form-check-inline mt-3">
                                    <input class="form-check-input mx-2" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                    <label class="form-check-label" for="inlineRadio1"><i class="bi bi-gender-male mx-3"></i></label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input class="form-check-input mx-2" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                    <label class="form-check-label" for="inlineRadio2"><i class="bi bi-gender-female mx-3"></i></label>
                                  </div>
                            </div>
                            <div class="modelActionbutton">
                                <button type="button" onclick="document.getElementById('id01').style.display='none'" class="btn btn-danger">Cancel</button>
                                <button type="submit"  class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        
        <!--Container Main end-->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" ></script>

    <script src="../Js/navbar.js"></script>
    <script src="../Js/sidebar.js"></script>

    <script>
        // Get the modal
        var modal = document.getElementById('id01');
        
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        </script>
        
        
        
    </body>

</html>
