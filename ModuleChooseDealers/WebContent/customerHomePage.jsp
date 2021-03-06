<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<style type="text/css">

	body
	{
		min-height: 100%;
		height: 100%;
		min-width: 100%;
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
		background-color: #0d47a1;
		margin-bottom: 20px;
		text-align: center;
		box-shadow: 0px 0px 4px 4px black;
		transition: all 1s;
		filter: opacity(70%);
	}
	
	.menu:hover
	{
		filter: opacity(100%);
	}
	
	#left
	{
		margin-top: 10%;
		float: left;
		width: 30%;
		height: 100%;
		//box-shadow: 0px 0px 4px 4px black;
	}
	
	#right
	{
		margin-top: 10%;
		float: right;
		width: 65%;
		height: 100%;
		//background-color: #00796b;
		box-shadow: 0px 0px 4px 4px black;
	}
	
	#top_bar
	{
		width: 100%;
		height: 10%;
		background-color: #3d5afe;
		position: fixed;
		top: 0px;
		left: 0px;
		text-align: center;
		font-size: 40px;
		box-shadow: 0px 0px 4px 4px black;
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
		box-shadow: 0px 0px 4px 4px black;
	}
	

</style>
</head>
<body>

<div id="main_container">
	<div id="top_bar">Welcome <!-- User Details from Form--></div>
	<div id="left">
		<a href=""><div id="photo"></div></a>
		<a href=""><div class="menu">Place Order</div></a>
		<a href=""><div class="menu">View Bills</div></a>
		<a href=""><div class="menu">View Messages</div></a>
		<a href=""><div class="menu">View Items</div></a>
		<a href=""><div class="menu">Feedback</div></a>
	</div>
	<div id="right">
		
	</div>
</div>
</body>
</html>