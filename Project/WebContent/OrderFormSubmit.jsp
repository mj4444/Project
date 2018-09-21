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
<title>Insert title here</title>
	<style type="text/css">
		table{
			width: 70%;
			height: 60%;
			background: transparent;
			border-style: none;
			box-shadow: 0px 0px 4px 4px black;
			margin: 0px auto;
			border-radius: 12px 12px 12px 12px;
			font-size: 20px;
		}
		tr{
			border-style: none;
			border-radius: 12px 12px 12px 12px;
			transition: all 1s;
		}
		tr:hover{
			box-shadow: 0px 0px 4px 2px #00B0FF;
		}
		td{
			height: 20px;
			width: 33%;
			background: transparent;
			border-style: none;
			padding-right: 4px;
			padding: 0px 4px 0px 4px;
			/* border-right: 2px solid #00B0FF;
			border-bottom: 2px solid #00B0FF;
			border-left: 2px solid #00B0FF; */
			border-radius: 12px 12px 12px 12px;
			box-shadow: 0px 0px 4px 1px black;
			text-align: center;
			transition: all 1s;
			padding: 2px 2px 2px 2px;
		}
		td:hover{
			box-shadow: 0px 0px 4px 2px #00B0FF;
		}
		h1{
			margin-bottom: 20px;
			text-align: center;
			color: red;
		}
		th{
			color: #03A9FA;
		}
		
		input{
			border-style: none;
			border-radius: 12px 12px 12px 12px;
			box-shadow: 0px 0px 4px 1px black;
			background: #37474f;
			color: white;
			transition: all 1s;
		}
		input:hover{
			box-shadow: 0px 0px 4px 1px ;
		}
		input:focus{
			box-shadow: 0px 0px 4px 4px #00B0FF;
		}
		
		#submit{
			padding: 8px 8px 8px 8px;
			width: 200px;
			margin-left: 350px;
			margin-top: 20px;
		}
		#submit:hover{
			box-shadow: 0px 0px 4px 4px #00B0FF;
		}
		h1{
			margin-bottom: 20px;
			text-align: center;
			color: red;
		}
		
	</style>
</head>
<body>

	<h1>Choose Dealer</h1>

		<form method="post" action="OrderCompletion">
		<table>
			<tr>
				<th>Select</th>
				<th>Dealer ID</th>
				<th>Name</th>
				<th>Email ID</th>
				<th>Contact</th>
				<th>Rating</th>
			</tr>
			
		<%
		Connection connection=ConnectionProvider.getConnection();
		String query="SELECT * FROM DEALERS WHERE LOCATION IN (SELECT LOCATION FROM CUSTOMERS WHERE customerId=?)";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1, "C100");
		ResultSet resultSet=preparedStatement.executeQuery();
		while(resultSet.next()){
			%>
			<tr>
				<td><input type="radio" name="selectDealer" value="<%=resultSet.getString(1) %>"/></td>
				<td><%=resultSet.getString(1) %></td>
				<td><%=resultSet.getString(6) %></td>
				<td><%=resultSet.getString(2) %></td>
				<td><%=resultSet.getString(5) %></td>
				<td><%=resultSet.getString(7) %></td>
			</tr>
			<%
		}
		%>
		</table>
		<input id="submit" type="submit" name="order" value="Place Order">
	</form>
</body>
</html>