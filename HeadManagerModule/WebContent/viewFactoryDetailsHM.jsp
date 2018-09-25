<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

	<style type="text/css">
		
		table{
			width: 70%;
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
			padding: 4px 0px 4px 0px;
		}
		#innerTableDiv{
			height: 50%;
			width: 60%;
			display: none;
			background: rgba(0,0,0,0.9);
			position: fixed;
			z-index: 2000;
			top: 30%;
			left: 20%;
			box-shadow: 0px 1px 4px 4px black;
			border-radius: 12px 12px 12px 12px;
		}
		
		#innerTable{
			margin-top: 40px;
			box-shadow: 0px 0px 4px 1px #00B0FF;
		}
		
		#showItemsButton{
			padding: 6px 6px 6px 6px;
			border-radius: 4px 4px 4px 4px;
			background: #263238;
			color: #1de9b6;
			border-style: none;
			transition: all 1s;
		}
		#showItemsButton:hover{
			box-shadow: 0px 0px 4px 2px;
		}
		
		#closeButton{
			padding: 6px 6px 6px 6px;
			border-radius: 4px 4px 4px 4px;
			background: #263238;
			color: red;
			border-style: none;
			transition: all 1s;
			float: right;
			margin-top: 10px;
			margin-right: 10px;
			box-shadow: 0px 0px 4px 2px #1de9b6;
		}
		#closeButton:hover{
			box-shadow: 0px 0px 4px 2px red;
		}
	</style>

</head>
<body>
	<h1>Factory Details</h1>
	<hr/>
	<table>
		<tr>
			<th>Factory ID</th>
			<th>Manager ID</th>
			<th>Item List</th>
		</tr>
	<%
		Connection connection=ConnectionProvider.getConnection();
		String query="select * from factory";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next()){
			%>
			<tr>
				<td><%=resultSet.getString(1) %></td>
				<td><%=resultSet.getString(2) %></td>
				<td><button id="showItemsButton" onclick="fun1()">Show Items</button>
					<div id="innerTableDiv">
					<button id="closeButton" onclick="fun2()">X</button>
					<table id="innerTable">
						<tr>
							<th>Item ID</th>
							<th>Quantity</th>
						</tr>
						<%
							
							String query1="Select * from factory_items where factoryId=?";
							PreparedStatement preparedStatement=connection.prepareStatement(query1);
							preparedStatement.setString(1, resultSet.getString(1));
							ResultSet resultSet2=preparedStatement.executeQuery();
							while(resultSet2.next()){
								%>
									<tr>
										<td><%=resultSet2.getString(2) %></td>
										<td><%=resultSet2.getInt(3) %></td>
									</tr>
								<%
							}
						%>
					</table></div>
				</td>
			</tr>
			<%
		}
	%>
	</table>
	<script type="text/javascript">
	
		function fun1(y) {
			var x=document.getElementById("innerTableDiv");
			x.style.display="block";
		}
		
		function fun2() {
			var x=document.getElementById("innerTableDiv");
			x.style.display="none";
		}
		
	
	</script>
</body>
</html>