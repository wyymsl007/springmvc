<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ page import = "net.onest.dao.DatabaseConn" %>
<%@ page import = "net.onest.controller.GoodControl" %>
<%@ page import = "java.util.List" %>
<%@ page import = "net.onest.beans.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%
	 	String userName = request.getParameter("userName");
	 	String passWord = request.getParameter("passWord");
	 	session.setAttribute("userName",userName);
	 	session.setAttribute("passWord",passWord);
	 %>
	 <jsp:useBean id = "userList" class = "net.onest.controller.GoodControl"  scope = "session" />
	 <%
	 	List<User> userLists = userList.getUserList();
	 	session.setAttribute("userLists",userLists);
	 %>
	 <c:forEach var = "i" items = "${userLists}"  begin = "0" end = "${userLists.size()-1 }">
		 	<c:if test = "${userName.equals(i.getUserName()) && passWord.equals(i.getPassWord())}">	
		 		<jsp:forward page = "PageDivide"/>
		 	</c:if>
	 </c:forEach>
	 <script>
	 	alert("用户名或密码错误");
	 </script>
	 <c:import url = "login.jsp"></c:import>  
</body>
</html>