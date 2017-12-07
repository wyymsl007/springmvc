<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "net.onest.controller.GoodControl" %>
<title>Insert title here</title>
</head>
<body style = "background:url(images/banner.jpg)repeat;">
	<h1><font color = "blue">亲，这是您当前的订单！</font></h1>
	<jsp:useBean id = "goodControl"  class = "net.onest.controller.GoodControl" scope = "session"/>
	<c:set var = "userOrderList" value = "${goodControl.getUserOrderList(userName) }"  scope = "session" />
	<center>
	<table>
					<c:forEach var = "i" items = "${userOrderList }"  begin = "0" end = "${userOrderList.size() }">
						<tr>
							<td>
								<img src= "${i.goodsImg }" width = 356 height = 300 /><br>
							</td>
							<td>
								<font color = "blue">${i.goodsName }</font><br><br><br><br><br><br><br><br><br><br>	
								<font size = "3" color = "red">7天退换</font><br><br>
								<font color = "yellow">￥${i.price }</font>
							</td>
							<td >	
								<font color = "gray" style = "position:relative;left:60px;top:38px">X${i.paySum }</font>								
							</td>
						</tr>
					</c:forEach>
	</table>
	</center>
</body>
</html>