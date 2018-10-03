<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  @font-face {
    font-family: myFirstFont;
    src: url(Fonts/Gputeks-Regular.ttf);
	}
  html,body
  {
  		overflow: hidden;
		font-family: myFirstFont;
		background-color: #263238;
		height: 100%;
  }
  h2
  {
  		color: orange;
	  margin-top: 0px;
	  padding-top: 0px;
	  text-align:center;
	  text-shadow: 0px 2px 4px black;
  }
  form
  {
  		margin-top: 10px;
	  padding: 5px 20px 5px 20px;
	  width:50%;
	  margin-left:25%;
	  box-shadow: 0px 0px 4px 1px black;
	  border-radius: 12px 12px 12px 12px;
	  transition: all 1s;
  }
  form:hover{
  	box-shadow: 0px 0px 4px 4px orange;
  }
  .in{
  	background-color: #263238;
  	box-shadow: 0px 0px 4px 1px black;
  	transition: all 1s;
  	color: orange;
  	outline: none;
  	border-color: #263238;
  }
  .in:hover{
  	box-shadow: 0px 0px 4px 4px orange;
  	background-color: #263238;
  }
  .in:focus{
  	box-shadow: 0px 0px 4px 4px orange;
  	background-color: #263238;
  	color: orange;
  }
  .in:invalid{
  	border-color: orange;
  }
  .login-button
  {
  width:140px;
  margin-left:36%;
  }
  .reg-info
  {
  color: grey;
  font-size: 15px;
  }
  .button{
  	background-color: #263238;
  	box-shadow: 0px 0px 4px 1px black;
  	transition: all 1s;
  	border-color: #263238;
  	color: orange;
  	margin-bottom: 20px;
  }
  .button:hover{
  	box-shadow: 0px 0px 4px 4px orange;
  	background-color: orange;
  	color: black;
  	border-color: orange;
  }
  .main{
  	margin-top: 10%;
  }
  #link{
  		color: orange;
  		text-decoration: none;
  		transition: all 1s;
  }
  #link:hover{
  		text-shadow: 0px 2px 2px orange;
  }
  #link:VISITED {
		color: orange;
	}
  </style>
</head>
<% 
String msg1=(String)request.getAttribute("msg");
if(msg1!=null)
{
%>
<script>
var a1="<%=msg1%>";
alert(a1);
</script>
<%} %>
<body>
<div  class="container-fluid login-container main" >
<div class="container">
  
  <form action="Login" method="post">
  <div class="reg-info">
  Not have a Account?<br>
  <a id="link" href="Registration.jsp">Register Here</a>
  </div>
  <h2>Login</h2>
    <div class="form-group">
      <label >User ID : </label>
      <input type="text" class="form-control in"  placeholder="Enter User ID" name="userId" required>
    </div>
    <div class="form-group">
      <label >Password : </label>
      <input type="password" class="form-control in"  placeholder="Enter password" name="password" required>
    </div>
    <input type="submit" class="btn btn-default login-button button"  value="Login">
  </form>
</div>
</div>
</body>
</html>