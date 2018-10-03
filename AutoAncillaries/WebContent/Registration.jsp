<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Registration</title>
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
  		font-family: myFirstFont;
		background-color: #263238;
		height: 100%;
  }
  h2
  {
  	  color: #00796b;
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
  	box-shadow: 0px 0px 4px 4px #00796b;
  }
  .login-button
  {
	  width:140px;
	  margin-left:40%;
  }
  .in{
  	background-color: #263238;
  	box-shadow: 0px 0px 4px 1px black;
  	transition: all 1s;
  	color: white;
  	outline: none;
  	border-color: #263238;
  }
  .in:hover{
  	box-shadow: 0px 0px 4px 4px #00796b;
  	background-color: #263238;
  }
  .in:focus{
  	box-shadow: 0px 0px 4px 4px #00796b;
  	background-color: #263238;
  	color: white;
  }
  .in:invalid{
  	border-color: #00796b;
  }
  .button{
  	background-color: #263238;
  	box-shadow: 0px 0px 4px 1px black;
  	transition: all 1s;
  	border-color: #263238;
  	color: #00796b;
  }
  .button:hover{
  	box-shadow: 0px 0px 4px 4px #00796b;
  	background-color: #00796b;
  	color: black;
  	border-color: #00796b;
  }
  .options{
  		border-radius: 4px 4px 4px 4px;
  		
  }
  .options:hover{
  	box-shadow: 0px 0px 4px 1px #00796b;
  }
  
  </style>
</head>
<script>
function validateForm()
{
	
}
</script>
<body>

<div  class="container-fluid login-container" >
<div class="container">
  
  <form name="rgForm" action="UserRegistration.jsp" method="post" onsubmit="return validateForm()">
  <h2>Register</h2>
<%
String msg=(String)request.getAttribute("msg");
if(msg!=null)
{%>
<div style="color: red;font-size: 15px;"><%=msg %></div>
<%}
%>
    <div class="form-group">

      <input type="text" class="form-control in"  placeholder="Enter Name" name="name" required>
    </div>
	<div class="form-group">

      <input type="email" class="form-control in"  placeholder="Enter Email" name="email" required>
    </div>
	<div class="form-group">

      <input type="text" class="form-control in"  placeholder="Enter User ID" name="customerId" required>
    </div>
	<div class="form-group">

      <input type="password" class="form-control in"  placeholder="Enter Password" name="password" required>
    </div>
    <div class="form-group">

      <input type="password" class="form-control in" placeholder="Re-Enter password" name="confirmPassword" required>
    </div>
	<div class="form-group">

      <input type="text" class="form-control in" placeholder="Enter Contact Number" name="contactNo" required>
    </div>
	<div class="form-group">

      <input type="text" class="form-control in" placeholder="Enter City" name="location" required>
    </div>
	<div class="form-group">
      <input type="text" class="form-control in" placeholder="Enter Pincode" name="pincode" required>
    </div>
	<div class="form-group">
      <input type="text" class="form-control in" placeholder="Enter State" name="state" title="Enter State" required>
    </div>
	<div class="form-group">
      <input type="text" class="form-control in" placeholder="Enter Street Address" name="streetAddress" title="Enter Street Address" required>
    </div>
	<div class="form-group">
       <select class="form-control in" name="role" title="Select role" required>
	   <option class="options" value="" disabled selected> Select Role</option>
		<option class="options" value="Customer" >Customer</option>
		<option class="options" value="Dealer" >Dealer</option>
		</select>
	</div>
    <input type="submit" class="btn btn-default login-button button"  value="Register">
  </form>
  
</div>
</div>
</body>
</html>