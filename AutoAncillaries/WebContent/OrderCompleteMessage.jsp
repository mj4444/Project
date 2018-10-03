<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Message Page</title>

	<style type="text/css">

		#link{
			color: white;
			background: black;
			box-shadow: 0px 0px 4px 1px red;
			padding: 8px 8px 8px 8px;
			text-decoration: none;
			transition: all 1s;
			font-size: 20px;
			border-radius: 12px 12px 12px 12px;
			position: relative;
			left: 45%;
		}

		#link:visited{
			color: white;
		}

		#link:hover{
			background: red;
			color: black;
			box-shadow: 0px 0px 4px 1px black;
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
	</style>

</head>
<body>

<h1>Order Placed</h1>
<hr/>
<a id="link" href="CustomerHomePage.jsp">Home Page</a>

</body>
</html>