<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "net.onest.controller.GoodControl" %>
<%@ page import = "javax.swing.JButton" %>
<%@ page import = "java.awt.event.ActionEvent" %>
<%@ page import = "java.awt.event.ActionListener" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style = "background:url(images/banner.jpg)repeat;">
		<h1><font color = "blue">亲，这是您当前的购物车！</font></h1>
		<center>
			<form action = "pay.jsp" method = "get">
				<jsp:useBean id = "goodControl"  class = "net.onest.controller.GoodControl" scope = "session"/>
				<c:set var = "userSCList" value = "${goodControl.getUserSCList(userName) }"  scope = "session" />
				<input type = "submit" value = "立即支付"  style = "position:relative;bottom:50px;left:260px;width:200px;height:100px;font-weight:bold;font-size:2.5em"/>
				<table>
					<c:forEach var = "i" items = "${userSCList }"  begin = "0" end = "${userSCList.size() }">
						<tr>
							<td>
								<input type = "checkbox"  name = "selectGoodsName" value = "${i.goodsName }" style = "position:relative;right:80px;width:30px;height:100px;"/>
							</td> 
							<td>
								<img src= "${i.goodsImg }" width = 356 height = 300 /><br>
							</td>
							<td>
								<font color = "blue">${i.goodsName }</font><br><br><br><br><br><br><br><br><br><br>	
								<font size = "3" color = "red">7天退换</font><br><br>
								<font color = "yellow">￥${i.price }</font>
							</td>
							<td >
								<%
									JButton A = new JButton("A");
									A.addActionListener(new ActionListener() {
						       	     @Override
						           	 public void actionPerformed(ActionEvent e) {
						                System.out.println("liuying.........");
						            }
						        });
								%>	
								<font color = "gray" style = "position:relative;left:60px;top:38px">X${i.paySum }</font>								
							</td>
						</tr>
					</c:forEach>
					<script>
						for(var i = 0; i < document.getElementsByTagName("input").length;i++){
							document.getElementsByTagName("input")[i].onchange = function(){
								var m = this.checked;
								if(m == true){
									this.parentNode.parentNode.style.backgroundSize = "0";
									this.parentNode.parentNode.style.backgroundColor="red";
								}else{
									this.parentNode.parentNode.style.background="url(images/banner.jpg)repeat";
								
								}
						
							}
						}

					</script>
				</table>
			</form>
		</center>
</body>
</html>