<%@page import="com.service.model.Dealer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dealer Profile</title>
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
			box-shadow: 0px 0px 4px 4px #bf360c;
		}
		tr{
			border-style: none;
			transition: all 1s;
		}
		tr:hover{
			box-shadow: 0px 0px 4px 4px #bf360c;
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
			box-shadow: 0px 0px 4px 4px #bf360c;
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
			color: red;
			text-shadow: 0px 4px 4px black;
		}
</style>
</head>
<body>
	<%
		Dealer dealer = new Dealer();
		HttpSession session1 = request.getSession(false);
		if (session1 != null) {
			dealer = (Dealer) session1.getAttribute("dealer");

		}
	%>
	<h1><%=dealer.getName()%>'s Profile
	</h1>
	<hr />
	<table>
		<tr>
			<td class="heading">Dealer ID</td>
			<td><%=dealer.getDealerId()%></td>
		</tr>
		<tr>
			<td class="heading">Name</td>
			<td><%=dealer.getName()%></td>
		</tr>
		<tr>
			<td class="heading">Email ID</td>
			<td><%=dealer.getEmail()%></td>
		</tr>
		<tr>
			<td class="heading">City</td>
			<td><%=dealer.getLocation()%></td>
		</tr>
		<tr>
			<td class="heading">Contact Number</td>
			<td><%=dealer.getContactNo()%></td>
		</tr>
	</table>
</body>
</html>