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
<style>
		table{
			width: 70%;
			/*height: 60%;*/
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
			/* border-right: 2px solid #00B0FF;
			border-bottom: 2px solid #00B0FF;
			border-left: 2px solid #00B0FF; */
			border-radius: 12px 12px 12px 12px;
			box-shadow: 0px 0px 4px 1px black;
			text-align: center;
			transition: all 1s;
		}
		td:hover{
			box-shadow: 0px 0px 4px 2px #00B0FF;
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
		th{
			color: #03A9FA;
		}
		
		h2{
			margin: 0px auto;
			text-align: center;
			color: red;
			box-shadow: 0px 0px 4px 1px black;
			background: transparent;
			width: 80%;
			border-radius: 12px 12px 12px 12px;
			transition: all 1s;
			text-shadow: 0px 2px 4px black;
		}
		
		h2:hover{
			box-shadow: 0px 0px 4px 4px #00B0FF;
		}
		
</style>
</head>
<body>
<h1>Bills</h1>
<hr/>
<%
	Connection connection=ConnectionProvider.getConnection();
	String query="Select * from orders where customerId=? and status=1";
	PreparedStatement preparedStatement=connection.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	preparedStatement.setString(1,"C100");
	ResultSet resultSet=preparedStatement.executeQuery();
	if(resultSet.next()){
		resultSet.previous();
		%>
		<table>
			<tr>
				<th>Order ID</th>
				<th>Cost</th>
				<th>Dealer ID</th>
			</tr>
			<%
			while(resultSet.next()){
				%>
				<tr>
					<td><%=resultSet.getString(1) %></td>
					<td><%=resultSet.getString(2) %></td>
					<td><%=resultSet.getString(3) %></td>
				</tr>
				<%}
			%>
		</table>
		<%
	}
	else{
		%>
			<h2>No Bills</h2>
		<%
	}

%>

</body>
</html>