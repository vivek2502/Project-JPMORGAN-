<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
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
<title>STATEMENT</title>
</head>
<body>

<%
	session=request.getSession();
	PrintWriter pw=response.getWriter();	
	ArrayList a=new ArrayList();
	a=(ArrayList)session.getAttribute("arraylistcredit");
	pw.println("Credited");
	
	for(int i=0;i<a.size();i++)
	{
		pw.println(a.get(i));
	}
	a=(ArrayList)session.getAttribute("arraylistdedit");
	pw.println("dedited");
	for(int i=0;i<a.size();i++)
	{
		pw.println(a.get(i));
	}
		
%>
<a href="home.html" >back to home</a><br>
</body>
</html>
