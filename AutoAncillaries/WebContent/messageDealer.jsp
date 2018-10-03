
<%@page import="com.service.model.Item"%>
<%@page import="java.util.List"%>
<%@page import="com.service.model.Dealer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.service.dao.DAOOperationsImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Messages</title>
<style type="text/css">
#message {
	height: 20%;
	width: 80%;
	margin-bottom: 50px;
	background: transparent;
	border-radius: 12px;
	box-shadow: 0px 0px 4px 1px black;
	margin-left: 20px;
	font-size: 15px;
	padding-left: 20px;
	color: white;
	transition: all 1s;
	overflow-y: auto;
}
#message::-webkit-scrollbar {
    width: 20px;
}
#message::-webkit-scrollbar-track{
    box-shadow: inset 0 0 5px grey; 
    border-radius: 10px;
}
#message::-webkit-scrollbar-thumb {
    background: red; 
    border-radius: 10px;
}
#message:hover {
	box-shadow: 0px 0px 4px 4px #bf360c;
}

#messageID {
	height: 4%;
	width: 70%;
	margin-left: 10px;
	margin-bottom: 20px;
	background: transparent;
	border-radius: 12px;
	box-shadow: 0px 0px 4px 1px black;
	font-size: 20px;
	padding-left: 20px;
	color: white;
	transition: all 1s;
}
#messageID:hover {
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
.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	text-align: left;
	border: none;
	outline: none;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	background-color: white;
	display: none;
	overflow: hidden;
}

span {
	float: right;
	font-size: 14px;
}
.heading{
	color: #bf360c;
	font-weight: bold;
}
</style>


</head>
<body>
	<h1>Messages</h1>
	<hr/>
	<%
		HttpSession sessionMsg = request.getSession(false);
		String id = "";
		if (sessionMsg != null) {
			Dealer dealer = (Dealer) sessionMsg.getAttribute("dealer");
			id = dealer.getDealerId();
		}
		DAOOperationsImpl obj = new DAOOperationsImpl();
		ResultSet rs = obj.getMessage(id);
		while (rs.next()) {
	%>
	<div id="messageID" class="accordion">
		MessageID : M<%=rs.getString(1)%> &nbsp; &nbsp; &nbsp; <%=rs.getString(2) %><span>Click To Expand</span>
	</div>
	<div id="message" class="panel">
	<table style="width: 100%;">
		<tr>
			<td class="heading">Item ID</td>
			<td class="heading">Item Name</td>
			<td class="heading">Item Cost</td>
			<td class="heading">Item Quantity</td>
		</tr>
	<%
		String temp[]=rs.getString(2).split(" ");
		String orderId=temp[9];
		List<Item> itemList=obj.getOrderDetail(orderId);
		for (Item item : itemList) {
			%>
			<tr>
				<td><%=item.getItemId()%></td>
				<td><%=item.getItemName()%></td>
				<td><%=item.getCost()%></td>
				<td><%=item.getQuantity()%></td>
			</tr>
			<%}%>
	</table>
	</div>
	<%
		}
	%>
	<script type="text/javascript">
		var acc = document.getElementsByClassName("accordion");
		var i;
		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>
</body>
</html>