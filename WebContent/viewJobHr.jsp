<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar Dashboard Template With Submenu</title>
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" type="text/css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="com.MyPack.*"%>

    <!--wrapper start-->
    <div class="wrapper">
        <!--header start-->
        <div class="header">
            <div class="header-menu">
                <div class="title">Hr <span>Dash</span></div>
                <div class="sidebar-btn">
                    <i class="fas fa-bars"></i>
                </div>
                <ul>
                    <li><a href=""><i class="fas fa-search"></i></a></li>
                    <li><a href=""><i class="fas fa-bell"></i></a></li>
                    <li><a href=""><i class="fas fa-power-off"></i></a></li>
                </ul>
            </div>
        </div>
        <!--header menu end-->
        <!--sidebar start-->
        <div class="sidebar">
            <div class="sidebar-menu">
                <center class="profile">
                    <img src="default-admin.png"alt="">
                    <p>Administrador</p>
                </center>
                <li class="item">
                    <a href="#" class="menu-btn">
                        <i class="fas fa-desktop"></i><span>Dashboard</span>
                    </a>
                </li>
                <li class="item" id="profile">
                    <a href="#profile" class="menu-btn">
                        <i class="fas fa-user-circle"></i><span>HR <i class="fas fa-chevron-down drop-down"></i></span>
                    </a>
                    <div class="sub-menu">
                        <a href="addJob.html"><i class="fas fa-image"></i><span>ADD JOB</span></a>
                        <a href="deleteJob.html"><i class="fas fa-address-card"></i><span>DELETE JOB</span></a>
                    </div>
                </li>
                <li class="item" id="messages">
                    <a href="#profile" class="menu-btn">
                        <i class="fas fa-envelope"></i><span>VIEW<i class="fas fa-chevron-down drop-down"></i></span>
                    </a>
                    <div class="sub-menu">
                        <a href="NewFIle.jsp"><i class="fas fa-envelope"></i><span>VIEW JOB'S</span></a>
                     
                    </div>
                </li>
                <li class="item" id="settings">
                    <a href="#profile" class="menu-btn">
                        <i class="fas fa-cog"></i><span>LogOut<i class="fas fa-chevron-down drop-down"></i></span>
                    </a>
                    <div class="sub-menu">
                        <a href="index.html"><i class="fas fa-lock"></i><span>ADMIN PAGE</span></a>
                        <a href="hr.html"><i class="fas fa-lock"></i><span>HR PAGE</span></a>
                    </div>
                </li>
                <li class="item">
                    <a href="https://www.linkedin.com/in/chetan-shivade-b84aa7221/" class="menu-btn">
                        <i class="fas fa-info-circle"></i><span>About Me</span>
                    </a>
                </li>
            </div>
        </div>
        <!--sidebar end-->
        <!--main container start-->
        <div class="main-container">
            <div class="card">
                <p>
                <% Connection con=DbConnection.connect(); 
PreparedStatement stmt=con.prepareStatement("select * from job");

ResultSet rs=stmt.executeQuery();
%>



<table border="1"  style="color:blue">
<style>
table { 
  width: 100%;
  text-align: left;
  background-color: lemonchiffon;
  border-collapse: collapse; 
  }
table th { 
  background-color: goldenrod;
  color: black; 
  }
table td, 
table th { 
  padding: 10px;
  border: 1px solid goldenrod; 
  }
</style>
<tr>
<th><font color="black"size="5">JID</font></th>
<th><font color="black"size="5">JOBTITLE</font></th>
<th><font color="black"size="5">JOBDES</font></th>
<th><font color="black"size="5">SALARY</font></th>
<th><font color="black"size="5">QUALITIES</font></th>
<th><font color="black"size="5">EXPERIENCE</font></th>
<th><font color="black"size="5"></font></th>
<%while(rs.next()){%>
</tr>
<TD><font color="black"size="5"><%= rs.getInt(1) %></font></TD>
<TD><font color="black"size="5"><%= rs.getString(2) %></font></TD>
<TD><font color="black"size="5"><%= rs.getString(3) %></font></TD>
<TD><font color="black"size="5"><%= rs.getString(4) %></font></TD>
<TD><font color="black"size="5"><%= rs.getString(5) %></font></TD>
<TD><font color="black"size="5"><%= rs.getString(6) %></font></TD>
<TD><font color="white"size="5"><a href="viewCan.jsp">viewShortlisted</a></font></TD>
<%} %>
</table><br><br><br>
</center>
<style><style>
.myTable { 
  width: 100%;
  text-align: left;
  background-color: lemonchiffon;
  border-collapse: collapse; 
  }
.myTable th { 
  background-color: goldenrod;
  color: white; 
  }
.myTable td, 
.myTable th { 
  padding: 10px;
  border: 1px solid goldenrod; 
  }
</style>
                </p>
            </div>
            <div class="card">
               <p></p>
                </div>
            <div class="card">
              <p></p>
            </div>
        </div>
        <!--main container end-->
    </div>
    <!--wrapper end-->



        
    <script type="text/javascript">
    $(document).ready(function(){
        $(".sidebar-btn").click(function(){
            $(".wrapper").toggleClass("collapse");
        });
    });
    
    </script>
<style>
* {
    margin: 0;
    padding: 0;
    font-family: "Roboto", sans-serif;
    list-style: none;
    text-decoration: none;
    box-sizing: border-box;
}

body {
    background: #fff;
}

.wrapper .header {
    z-index: 1;
    background: rgba(0,0,0,.8);
    position: fixed;
    width: calc(100% - 0%);
    height: 70px;
    display: flex;
    top: 0;
}

.wrapper .header .header-menu {
    width: calc(100% - 0%);
    height: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
}

.wrapper .header .header-menu .title {
    color: rgba(255,255,255,.7);
    font-size: 1.6em;
    text-transform: uppercase;
    font-weight: 900;
}

.wrapper .header .header-menu .title span {
    color: #4cceeb;
}

.wrapper .header .header-menu .sidebar-btn {
    color: rgba(255,255,255,.7);
    position: absolute;
    margin-left: 9.4em;
    font-size: 1.6em;
    font-weight: 600;
    cursor: pointer;
    transition: all 1s;
}

.wrapper .header .header-menu .sidebar-btn:hover {
    opacity: .6;
}

.wrapper .header .header-menu ul {
    display: flex;
}

.wrapper .header .header-menu ul li a {
    background-color: rgba(255,255,255,.7);
    color: rgba(0,0,0,.7);
    display: block;
    margin: 0 10px;
    font-size: 18px;
    width: 32px;
    height: 32px;
    line-height: 32px;
    text-align: center;
    border-radius: 50%;
    transition: all 1s;
}

.wrapper .header .header-menu ul li a:hover {
    opacity: .6;
}
/* ate aqui tudo certo */

.wrapper .sidebar {
    z-index: 1;
    background: rgba(0,0,0,.8);
    position: fixed;
    top: 70px;
    width: 250px;
    height: calc(100% - 9%);
    transition: all 1s;
    overflow-y: hidden;
}
.wrapper .sidebar .sidebar-menu {
    overflow: hidden;
}

.wrapper .sidebar .sidebar-menu .profile img {
    margin: 1em auto;
    width: 70px;
    height: 70px;
    border-radius: 50%;
}
.profile img {
	background-color: rgba(255,255,255,.6);
	transition: all 1s;
}
.wrapper .sidebar .sidebar-menu .profile p {
    color: rgba(255,255,255,.7);
    font-weight: 700;
    margin-bottom: 1em;
}

.wrapper .sidebar .sidebar-menu .item {
    width: 250px;
    overflow: hidden;
}

.wrapper .sidebar .sidebar-menu .item .menu-btn {
    display: block;
    color: rgba(255,255,255,.7);
    position: relative;
    padding: 1em;
    transition: all 1s;
}

.wrapper .sidebar .sidebar-menu .item .menu-btn:hover {
    opacity: .6;
}

.wrapper .sidebar .sidebar-menu .item .menu-btn i {
    margin-right: 1em;
}

.wrapper .sidebar .sidebar-menu .item .menu-btn .drop-down {
    float: right;
    font-size: 1em;
    margin-top: .2em;
}

.wrapper .sidebar .sidebar-menu .item .sub-menu {
    background: rgba(255,255,255,.6);
    overflow: hidden;
    max-height: 0;
    transition: all 1s;
}

.wrapper .sidebar .sidebar-menu .item .sub-menu a {
    display: block;
    position: relative;
    color: rgba(0,0,0,.7);
    white-space: nowrap;
    font-size: 1em;
    padding: 1em;
    border-bottom: 1px solid rgba(0,0,0,.3);
    transition: all 1s;
}

.wrapper .sidebar .sidebar-menu .item .sub-menu a:hover {
    opacity: .6;
}

.wrapper .sidebar .sidebar-menu .item .sub-menu i {
    padding-right: 1em;
    font-size: .8em;
}

.wrapper .sidebar .sidebar-menu .item:hover .sub-menu {
    max-height: 500px;
}

.main-container {
    width: (100% - 250px);
    margin-top: 4em;
    margin-left: 16em;
    padding: 1em;;
    height: 100vh;
    transition: all 1s;
}

.wrapper.collapse .sidebar {
    width: 70px;
}

.wrapper.collapse .sidebar .profile img,
.wrapper.collapse .sidebar .profile p,
.wrapper.collapse .sidebar a span {
    display: none;
}

.wrapper.collapse .sidebar .sidebar-menu .item .menu-btn {
    font-size: 23px;
}

.wrapper.collapse .sidebar .sidebar-menu .item .sub-menu i {
    font-size: 18px;
    padding-left: .2em;
}

.wrapper.collapse .main-container {
    width: (100% - 70px);
    margin-left: 70px;
}

.wrapper .main-container .card {
    background: #fff;
    padding: 1em;
    font-size: 1em;
    margin-bottom: 1em;
}
</style>

    
</body>
</html>