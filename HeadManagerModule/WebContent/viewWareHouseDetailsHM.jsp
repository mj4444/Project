<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Warehouse Details</title>
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
		h2{
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
		
		#innerTableDiv0,#innerTableDiv1,#innerTableDiv2,#innerTableDiv3{
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
		
		#innerTable0,#innerTable1,#innerTable2,#innerTable3{
			margin-top: 20px;
			box-shadow: 0px 0px 4px 1px #00B0FF;
		}
		
		#showItemsButton0,#showItemsButton1,#showItemsButton2,#showItemsButton3{
			padding: 6px 6px 6px 6px;
			border-radius: 4px 4px 4px 4px;
			background: #263238;
			color: #1de9b6;
			border-style: none;
			transition: all 1s;
		}
		#showItemsButton0:hover,#showItemsButton1:hover,#showItemsButton1:hover#showItemsButton1:hover{
			box-shadow: 0px 0px 4px 2px;
		}
		
		#closeButton0,#closeButton1,#closeButton2,#closeButton3{
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
		#closeButton0:hover,#closeButton1:hover,#closeButton2:hover#closeButton3:hover{
			box-shadow: 0px 0px 4px 2px red;
			color: black;
			background-color: red;
		}
		
	</style>
</head>
<body>

<%

	String[] warehouseId=new String[4];

%>

	<h1>Warehouse Details</h1>
	<hr/>
	<table>
		<tr>
			<th>Warehouse ID</th>
			<th>Manager ID</th>
			<th>Item List</th>
		</tr>
	<%
		int i=0;
		int j=0;
		Connection connection=ConnectionProvider.getConnection();
		String query="select * from warehouse";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next()){
			
			warehouseId[i++]=resultSet.getString(1);
			%>
			<tr>
				<td><%=resultSet.getString(1) %></td>
				<td><%=resultSet.getString(2) %></td>
				<td>
					<button id="showItemsButton<%=j++ %>" onclick="fun1(this)">Show Items</button>	
				</td>
			</tr>
			<%
		}
	%>
	</table>
	
			<div id="innerTableDiv0">
			<button id="closeButton0" onclick="fun2(this)">X</button>
				<h2>Item List</h2>
				<hr/>
					<table id="innerTable0">
						<tr>
							<th>Item ID</th>
							<th>Quantity</th>
						</tr>
						<%
							
							String query1="Select * from WAREHOUSE_ITEMS where warehouseId=?";
							PreparedStatement preparedStatement=connection.prepareStatement(query1);
							preparedStatement.setString(1, warehouseId[0]);
							ResultSet resultSet2=preparedStatement.executeQuery();
							while(resultSet2.next()){
								%>
									<tr>
										<td><%=resultSet2.getString(1) %></td>
										<td><%=resultSet2.getInt(3) %></td>
									</tr>
								<%
							}
						%>
					</table>
				</div>
				
			<div id="innerTableDiv1">
				<button id="closeButton1" onclick="fun2(this)">X</button>
				<h2>Item List</h2>
				<hr/>
					<table id="innerTable1">
						<tr>
							<th>Item ID</th>
							<th>Quantity</th>
						</tr>
						<%
							
							query1="Select * from WAREHOUSE_ITEMS where warehouseId=?";
							preparedStatement=connection.prepareStatement(query1);
							preparedStatement.setString(1, warehouseId[1]);
							resultSet2=preparedStatement.executeQuery();
							while(resultSet2.next()){
								%>
									<tr>
										<td><%=resultSet2.getString(1) %></td>
										<td><%=resultSet2.getInt(3) %></td>
									</tr>
								<%
							}
						%>
					</table>
				</div>
				
			<div id="innerTableDiv2">
				<button id="closeButton2" onclick="fun2(this)">X</button>
				<h2>Item List</h2>
				<hr/>
					<table id="innerTable2">
						<tr>
							<th>Item ID</th>
							<th>Quantity</th>
						</tr>
						<%
							
							query1="Select * from WAREHOUSE_ITEMS where warehouseId=?";
							preparedStatement=connection.prepareStatement(query1);
							preparedStatement.setString(1, warehouseId[2]);
							resultSet2=preparedStatement.executeQuery();
							while(resultSet2.next()){
								%>
									<tr>
										<td><%=resultSet2.getString(1) %></td>
										<td><%=resultSet2.getInt(3) %></td>
									</tr>
								<%
							}
						%>
					</table>
				</div>
				
			<div id="innerTableDiv3">
				<button id="closeButton3" onclick="fun2(this)">X</button>
					<h2>Item List</h2>
					<hr/>
					<table id="innerTable3">
						<tr>
							<th>Item ID</th>
							<th>Quantity</th>
						</tr>
						<%
							
							query1="Select * from WAREHOUSE_ITEMS where warehouseId=?";
							preparedStatement=connection.prepareStatement(query1);
							preparedStatement.setString(1, warehouseId[3]);
							resultSet2=preparedStatement.executeQuery();
							while(resultSet2.next()){
								%>
									<tr>
										<td><%=resultSet2.getString(1) %></td>
										<td><%=resultSet2.getInt(3) %></td>
									</tr>
								<%
							}
						%>
					</table>
				</div>
	
	<script type="text/javascript">
	
		function fun1(y) {
			if(y.id=='showItemsButton0'){
				y.onclick= function(){
					document.getElementById('innerTableDiv0').style.display='block';
				}
			}
			else if(y.id=='showItemsButton1'){
				y.onclick= function(){
					document.getElementById('innerTableDiv1').style.display='block';
				}
			}
			else if(y.id=='showItemsButton2'){
				y.onclick= function(){
					document.getElementById('innerTableDiv2').style.display='block';
				}
			}
			else if(y.id=='showItemsButton3'){
				y.onclick= function(){
					document.getElementById('innerTableDiv3').style.display='block';
				}
			}
		}
		//==========================
		function fun2(y) {
			if(y.id=='closeButton0'){
				y.onclick= function(){
					document.getElementById('innerTableDiv0').style.display='none';
				}
			}
			else if(y.id=='closeButton1'){
				y.onclick= function(){
					document.getElementById('innerTableDiv1').style.display='none';
				}
			}
			else if(y.id=='closeButton2'){
				y.onclick= function(){
					document.getElementById('innerTableDiv2').style.display='none';
				}
			}
			else if(y.id=='closeButton3'){
				y.onclick= function(){
					document.getElementById('innerTableDiv3').style.display='none';
				}
			}
		}
		
	</script>
</body>
</html>