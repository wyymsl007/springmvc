<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--Google Fonts-->
<link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<!--Google Fonts-->
</head>
<body>
<div class="login">
	<div class="login-top" >
		<form action = "CheckLogin.jsp"  method = "get">
				<div >
					<font size = "20" color = "red" style = "position:relative;bottom:30px;left:15px">欢迎登陆淘宝系统！</font>
				</div>
				<div>
					用户名：<input type = "text" name = "userName" style = "position:relative;top:20px"/><br>
				</div>
				<div style = "position:relative;top:40px">
					<font style = "position:relative;bottom:10px">密码：</font><input type = "password" name = "passWord" ><br>
					<input type = "submit" value = "登录" style = "position:relative;left:80px;top:0px">
					<a href = "register.jsp" style = "position:relative;left:177px;top:1.5px;">注册</a>
				</div>
			</form>
	</div>
</div>	


</body>
</html>