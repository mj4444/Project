<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	html,body
	{
		height: 100%;
		width: 100%;
		background-color: #37474f;
		color: white;
		font-size: 30px;
	}
	
	#main_container
	{
		height: 100%;
		width: 100%;
	}
	.menu
	{
		height: 10%;
		width: 100%;
		background-color: #2196f3;
		margin-bottom: 20px;
		text-align: center;
		box-shadow: 0px 1px 4px 1px black;
		transition: all 1s;
		filter: opacity(70%);
		border-radius: 12px 12px 12px 12px;
	}
	
	.menu:hover
	{
		filter: opacity(100%);
		box-shadow: 0px 1px 4px 4px #2196f3;
	}
	
	#left
	{
		margin-top: 10%;
		float: left;
		width: 30%;
		height: 100%;
	}
	
	#right
	{
		margin-top: 10%;
		float: right;
		width: 65%;
		height: 100%;
		box-shadow: 0px 0px 4px 1px black;
		margin-right: 20px;
	}
	
	#top_bar
	{
		width: 100%;
		height: 10%;
		background-color: #2196f3;
		position: fixed;
		top: 0px;
		left: 0px;
		text-align: center;
		font-size: 40px;
		box-shadow: 0px 0px 4px 1px black;
		z-index:1000;
	}
	
	a
	{
		text-decoration: none;
	}
	
	a:visited
	{
		text-decoration: none;
		color: white;
	}
	
	#photo
	{
		margin-bottom: 10%;
		width: 100%;
		height: 50%;
		transition: all 2s;
		filter: opacity(0.8);
		box-shadow: 0px 0px 4px 1px black;
		transition: all 1s;
	}
	#photo:hover{
		box-shadow: 0px 0px 4px 4px #2196f3;
	}
	
	#main_container
	{
		height:100%;
		width:100%;
	}
	
</style>
</head>
<body>

	<%
	String user="Ben";
	//Get Details from Session
%>

<div id="main_container">
	<div id="top_bar">Welcome <%=user %></div>
	<div id="left">
		<a href="?var=photos"><div id="photo"><img src="images/6614142.jfif" height="100%"></div></a>
		<a href="?var=viewWareHouseDetails"><div class="menu">View Warehouse Details</div></a>
		<a href="?var=viewFactoryDetails"><div class="menu">View Factory Details</div></a>
		<a href="?var=viewCustomerDetails"><div class="menu">View Customer Details</div></a>
		<a href="?var=viewDealerDetails"><div class="menu">View Dealer Details</div></a>
		<a href="?var=viewManagerDetails"><div class="menu">View Manager Details</div></a>
	</div>
	<div id="right">
		<% 
			String a=request.getParameter("var");
		if(a!=null)
		{
			if(a.equals("photos")){
				%>
				<%@include file="photoHManager.jsp" %>
				<%
			 }
			else if(a.equals("viewWareHouseDetails")){
				%>
				<%@include file="viewWareHouseDetailsHM.jsp" %>
				<%
			}
			else if(a.equals("viewFactoryDetails")){
					%>
					<%@include file="viewFactoryDetailsHM.jsp" %>
					<%
				}
			else if(a.equals("viewCustomerDetails")){
				%>
				<%@include file="viewCustomerDetailsHM.jsp" %>
				<%
			}
			else if(a.equals("viewDealerDetails")){
				%>
				<%@include file="viewDealerDetailsHM.jsp" %>
				<%
			}
			else if(a.equals("viewManagerDetails")){
				%>
				<%@include file="viewManagerDetailsHM.jsp" %>
				<%
			}
		}
		else{
			
		}
		%>
	</div>
</div>

</body>
</html>