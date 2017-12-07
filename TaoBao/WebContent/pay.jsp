<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "net.onest.controller.GoodControl" %>
<%@ page import = "net.onest.beans.USER_ShoppingCart" %>
<%@ page import = "java.util.ArrayList" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style = "background:url(images/banner.jpg)repeat;">
	<font color = "red"><h1>${"<" }确认订单</h1></font>
	<font color = "red"><h3>收货人： ${userName }</h3></font>
	<center>
		<form action = "AddGoodsToOrder">
			<c:set var = "lastPage"  value = '<%=request.getHeader("referer") %>' scope = "page" />
			<c:choose>
				<c:when test = "${lastPage.equals('http://localhost:8080/TaoBao/ShowShoppingCart.jsp')  }">
				<%
					ArrayList<USER_ShoppingCart> selectGoodsList = new ArrayList<>();
					ArrayList<USER_ShoppingCart> userSCList = (ArrayList<USER_ShoppingCart>)session.getAttribute("userSCList");
					String[] selectGoodsNameList = request.getParameterValues("selectGoodsName");
			 		for(int i = 0; i < selectGoodsNameList.length; i++){
						for(int j = 0; j < userSCList.size(); j++){
							if(userSCList.get(j).getGoodsName().equals(selectGoodsNameList[i])){
								USER_ShoppingCart USER_shoppingCart = new USER_ShoppingCart();
								USER_shoppingCart.setUserName((String)session.getAttribute("userName"));
								USER_shoppingCart.setGoodsImg(userSCList.get(j).getGoodsImg());
								USER_shoppingCart.setGoodsName(userSCList.get(j).getGoodsName());
								USER_shoppingCart.setPrice(userSCList.get(j).getPrice());
								USER_shoppingCart.setPaySum(userSCList.get(j).getPaySum());
								selectGoodsList.add(USER_shoppingCart);
								session.setAttribute("selectGoodsList",selectGoodsList);
							}
						}
					} 
					
				%>
 			<table>
 				<c:set var = "totalPrice" value = "${0 }" scope = "page" />
					<c:forEach var = "i" items = "${selectGoodsList }"  begin = "0" end = "${selectGoodsList.size() }">
						<tr>
							<td>
								 <img src= "${i.goodsImg }" width = 356 height = 300 /><br> 
							</td>
							<td>
								<font color = "blue">${i.goodsName }</font><br><br><br><br>	
								<font size = "3" color = "red">7天退换</font><br><br>
								<font size = "5" color = "orange">￥${i.price }</font>
							</td>
							<td >
								<font color = "gray">X${i.paySum }</font>		
							</td>
							<c:set var = "totalPrice" value = "${totalPrice+(i.price * i.paySum) }" scope = "page" />
						</tr>
					</c:forEach>
				</table>
				<input type = "submit" value = "结算" id = "payment"  style = "position:relative;right:50px"/>
				<%
					double totalPrice = (double)pageContext.getAttribute("totalPrice");
				%>
				<script>
					document.getElementById("payment").onclick = function(){
						var r = confirm("您共要支付" + <%=totalPrice %> + "元,确认支付？")
						if(r == true){
							alert("支付成功！！");
	
						}
					}
				</script>
			</c:when>
			<c:otherwise>
				<table>
				<%
					ArrayList<USER_ShoppingCart> selectGoodsList = new ArrayList<>();
					USER_ShoppingCart USER_shoppingCart = new USER_ShoppingCart();
					USER_shoppingCart.setUserName((String)session.getAttribute("userName"));
					USER_shoppingCart.setGoodsImg(request.getParameter("goodsImg"));
					USER_shoppingCart.setGoodsName(request.getParameter("goodsName"));
					USER_shoppingCart.setPrice(Double.parseDouble(request.getParameter("price")));
					USER_shoppingCart.setPaySum(Integer.parseInt(request.getParameter("paySum")));
					selectGoodsList.add(USER_shoppingCart);
					session.setAttribute("selectGoodsList",selectGoodsList);
				%>
				<tr>
					<c:set var = "price" value = "${param.price }" scope = "page" />
					<c:set var = "paySum" value = "${param.paySum }" scope = "page" />
					<td>
						<img src = "${param.goodsImg}" width = 356  height = 300 />
					</td>
					<td>
						 <font color = "blue">${param.goodsName }</font><br><br><br><br>
						 <font size = "3" color = "red">7天退换</font><br><br>
						 <font size = "5" color = "orange">￥${param.price }</font>
					</td>
					<td>
						X${param.paySum }
					</td>
				</tr>
			</table>
			<input type = "submit" value = "结算" id = "payment"  style = "position:relative;right:50px"/>
				<%
					double price = Double.parseDouble((String)pageContext.getAttribute("price"));
					int paySum = Integer.parseInt((String)pageContext.getAttribute("paySum"));
					double totalPrice = price*paySum ;
					pageContext.setAttribute("totalPrice",totalPrice);
				%> 
				<script>
					document.getElementById("payment").onclick = function(){
						var r = confirm("您共要支付" + <%=totalPrice %> + "元,确认支付？")
						if(r == true){
							alert("支付成功！！");
	
						}
					}
				</script>			
			</c:otherwise>
			</c:choose>				 
			

		</form>
	</center>
</body>
</html>