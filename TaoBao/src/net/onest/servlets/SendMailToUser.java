package net.onest.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class SendMailToUser
 */
@WebServlet("/SendMailToUser")
public class SendMailToUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailToUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String userMail = (String)session.getAttribute("userMail");
		String userName = (String)session.getAttribute("userName");
		
		Properties props = new Properties();
		props.put("mail.transport.protocal","smtp");
		props.put("mail.smtp.host","smtp.126.com");
		props.put("mail.smtp.auth",true);
		Session session1 = Session.getInstance(props,new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("wyymsl007@126.com", "liu8769669");
			}
		});
		Message msg = new MimeMessage(session1);
		try {
			msg.setFrom(new InternetAddress("wyymsl007@126.com"));
			msg.setRecipient(Message.RecipientType.TO,new InternetAddress(userMail));
			msg.setSubject("亲爱的" + userName + "," + "恭喜你注册成功！");
			msg.setText("可以随意去购物了！");
			msg.setSentDate(new Date());
			Transport.send(msg);
			out.write("<script>alert('恭喜你注册成功！！');</script>");
			request.getRequestDispatcher("login.jsp").include(request,response);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
