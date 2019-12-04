<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
<style>  
   body
   	{
   		background-color:white;  
   	} 
   	marquee
   	{
   		font-size: 40px;
        font-weight: 200;
        color: black;
        font-family: sans-serif;
        width: 100%;
        padding: 1px 0 ;
        background-color:lightblue;
   	}	
    a
    {
    	font-size: 20px;
        font-weight: 200;
        color: blue;
        font-family: sans-serif;
    }        
</style>
<title>BALANCE</title>
</head>
<body>
<marquee >Your Balance is:</marquee><br><br>
<%
	session=request.getSession();
	PrintWriter pw=response.getWriter();
	pw.println("You Balance is : "+session.getAttribute("balance"));	
%>
<a href="home.html" >back to home</a><br>
</body>
</html>
