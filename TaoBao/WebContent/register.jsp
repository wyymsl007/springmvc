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
		<div class="login-top">
				<div>
					<font size = "20" color = "red" style = "position:relative;bottom:30px;left:30px">淘宝注册界面</font>
				</div>
			<form action = "AddUserToDb.jsp" method = "get">
				用户名:<input type = "text" name = "userName"><br>
				密码:<input type = "password" name = "passWord"><br>
				邮箱:<input type = "text" name = "userMail"><br>&nbsp;<font color = "green">注册成功后系统会发送邮件到该邮箱！</font><br>
				<input type = "submit" value = "注册" style = "position:relative;top:30px;left:75px;"><input type = "reset" value  = "重置" style = "position:relative;top:30px;left:185px;">
				
			</form>
		</div>	
	</div>
</body>
</html>