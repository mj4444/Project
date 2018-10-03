<%@page import="com.service.model.Customer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Profile</title>
<style type="text/css">
		
		table{
			width: 70%;
			height: 60%;
			background: transparent;
			border-style: none;
			box-shadow: 0px 0px 4px 1px black;
			margin: 0px auto;
			border-radius: 12px 12px 12px 12px;
			font-size: 20px;
			transition: all 1s;
		}
		table:hover{
			box-shadow: 0px 0px 4px 4px #00B0FF;
		}
		
		tr{
			border-style: none;
			transition: all 1s;
		}
		tr:hover{
			box-shadow: 0px 0px 4px 4px #00B0FF;
		}
		td{
			height: 20px;
			width: 33%;
			background: transparent;
			border-style: none;
			padding-right: 4px;
			/* border-right: 2px solid #00B0FF;
			border-bottom: 2px solid #00B0FF;
			border-left: 2px solid #00B0FF; */
			border-radius: 12px 12px 12px 12px;
			box-shadow: 0px 0px 4px 1px black;
			text-align: center;
			transition: all 1s;
		}
		td:hover{
			box-shadow: 0px 0px 4px 4px #00B0FF;
		}
		h1{
			padding-bottom: 0px;
			text-align: center;
			color: red;
			text-shadow: 0px 2px 4px black;
			margin-bottom: 0px;
		}
		hr{
			height: 4px;
			width: 80%;
			border-style: none;
			background: linear-gradient(to right,#37474f,white,#37474f);
			margin-bottom: 40px;
			margin-top: 0px;
		}
		.heading{
			color: #00B0FF;
			text-shadow: 0px 4px 4px black;
		}
		
</style>
</head>
<body>
	<%
		Customer customer = new Customer();
		HttpSession session1 = request.getSession(false);
		if (session1 != null) {
			customer = (Customer) session1.getAttribute("customer");
		}
	%>
	<h1><%=customer.getName() %>'s Profile</h1>
	<hr/>
		<table>
			<tr>
				<td class="heading">Customer ID</td>
				<td><%=customer.getCustomerId() %></td>
			</tr>
			<tr>
				<td class="heading">Name</td>
				<td><%=customer.getName() %></td>
			</tr>
			<tr>
				<td class="heading">Email ID</td>
				<td><%=customer.getEmail() %></td>
			</tr>
			<tr>
				<td class="heading">Password</td>
				<td><%=customer.getPassword() %></td>
			</tr>
			<tr>
				<td class="heading">Location</td>
				<td><%=customer.getLocation() %></td>
			</tr>
			<tr>
				<td class="heading">Contact Number</td>
				<td><%=customer.getContactNo() %></td>
			</tr>
			<tr>
				<td class="heading">Address</td>
				<td><%=customer.getAddress().getStreetAddress() %>,<%=customer.getAddress().getState() %>,<%=customer.getAddress().getPincode() %></td>
			</tr>
			
	</table>
</body>
</html>