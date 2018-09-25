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
	String name="Mohit Kumar";
%>
<h1><%=name %>'s Profile</h1>
<hr/>
<table>
	<%
		Connection connection=ConnectionProvider.getConnection();
		String query="SELECT*FROM customers WHERE customerId=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1, "C100");
		ResultSet resultSet=preparedStatement.executeQuery();
		while(resultSet.next()){
			%>
			<tr>
				<td class="heading">Customer ID</td>
				<td><%=resultSet.getString(1) %></td>
			</tr>
			<tr>
				<td class="heading">Name</td>
				<td><%=resultSet.getString(6) %></td>
			</tr>
			<tr>
				<td class="heading">Email ID</td>
				<td><%=resultSet.getString(2) %></td>
			</tr>
			<tr>
				<td class="heading">Password</td>
				<td><%=resultSet.getString(3) %></td>
			</tr>
			<tr>
				<td class="heading">Location</td>
				<td><%=resultSet.getString(4) %></td>
			</tr>
			<tr>
				<td class="heading">Contact Number</td>
				<td><%=resultSet.getString(5) %></td>
			</tr>
			<%
		}
	%>
</table>
</body>
</html>