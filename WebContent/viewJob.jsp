<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<br><br><br>
<font size="10" color="white">JOB DETAILS</font>
<br><br><br><br><br>

<%@ page import ="java.sql.*" %>
<%@ page import ="com.MyPack.*"%>
<style>
		body {
  background-image: url('2.jpeg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
</style>
<% Connection con=DbConnection.connect(); 
PreparedStatement stmt=con.prepareStatement("select * from job");

ResultSet rs=stmt.executeQuery();
%>


<table border="5">
<tr>
<th><font color="white"size="5">JID</font></th>
<th><font color="white"size="5">JOBTITLE</font></th>
<th><font color="white"size="5">JOBDES</font></th>
<th><font color="white"size="5">SALARY</font></th>
<th><font color="white"size="5">QUALITIES</font></th>
<th><font color="white"size="5">EXPERIENCE</font></th>
<th><font color="white"size="5"></font></th>
<%while(rs.next()){%>
</tr>
<TD><font color="white"size="5"><%= rs.getInt(1) %></font></TD>
<TD><font color="white"size="5"><%= rs.getString(2) %></font></TD>
<TD><font color="white"size="5"><%= rs.getString(3) %></font></TD>
<TD><font color="white"size="5"><%= rs.getString(4) %></font></TD>
<TD><font color="white"size="5"><%= rs.getString(5) %></font></TD>
<TD><font color="white"size="5"><%= rs.getString(6) %></font></TD>
<TD><font color="white"size="5"><a href="Register.jsp?jid=<%=rs.getInt(1) %>">APPLY</a></font></TD>
<%} %>
</table><br><br><br>
</center>
</body>
</html>