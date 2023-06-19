<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="com.MyPack.*"%>
<style>
		body {
  background-image: url('2.jpeg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
</style>
<% int id=Integer.parseInt(request.getParameter("id"));
Connection con=DbConnection.connect(); 
PreparedStatement stmt=con.prepareStatement("delete from hr where id=?");
stmt.setInt(1, id);
int i=stmt.executeUpdate();
%>
<%while(i>0){%>
<center>
<br><br><br>
<font size="10" color="white"></font>
<br><br><br><br><br>
response.sendRedirect("viewHr.jsp");
<table border="1">


<%} %>
</table><br><br><br>
</center>
</body>
</html>