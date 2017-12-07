<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "net.onest.dao.DatabaseConn" %>
<%@ page import = "net.onest.controller.GoodControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var = "userName" value = "${param.userName }" scope = "session" />
	<c:set var = "passWord" value = "${param.passWord }" scope = "session" />
	<c:set var = "userMail" value = "${param.userMail }" scope = "session" />
	<%
		String userName = (String)session.getAttribute("userName");
		String passWord = (String)session.getAttribute("passWord");
		String userMail = (String)session.getAttribute("userMail");
		if(userName.equals("") || passWord.equals("")){
			out.write("<script>alert('用户名或密码不能为空')</script>");
			request.getRequestDispatcher("register.jsp").include(request,response);
		}else if(userMail.equals("")){
			out.write("<script>alert('用户邮箱不能为空');</script>");
			request.getRequestDispatcher("register.jsp").include(request,response);
		}else if(new GoodControl().isUserNameIn(userName)){
			out.write("<script>alert('用户名已存在');</script>");
			request.getRequestDispatcher("register.jsp").include(request,response); 
		}else{
			DatabaseConn.addUserToDb(userName,passWord);
			request.getRequestDispatcher("SendMailToUser").forward(request,response);
		}	
		
	%>
</body>
</html>