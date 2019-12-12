package controller;


import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;

public class ForgotPassword extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String userId=request.getParameter("userid");
		Model modle=new Model();
		modle.setEmail(email);			
		HttpSession session2=request.getSession(true);
		session2.setAttribute("email",modle.getEmail());
		String fromEmail="mailextra580@gmail.com"; //sender's mail id.
		String pwd="@extramail580";		//sender's mail pwd.
		String toEmail=email;  //reciever's mail id.
		
		String subject="DO NOT REPLY: Mail from Java Program"; // mail subject line
		String msg="http://localhost/9090/JPMORGAN/reset.html"; //mail body
		
		//Creating Properties Object for Email authorisation
		Properties prop = new Properties();
		prop.put("mail.smtp.host","smtp.gmail.com");
		prop.put("mail.smtp.port",587);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");

		//Creating Properties Session Object
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator()
		{
			protected PasswordAuthentication getPasswordAuthentication()
			{
				//sender's mail id and pwd is encapsulated inside "SendersCredentials.java"
				return new PasswordAuthentication(fromEmail, pwd);
			}
		});

		//Composing the Mail
		MimeMessage mesg = new MimeMessage(session);
		try {
			mesg.setFrom(new InternetAddress(fromEmail));
			mesg.addRecipient(Message.RecipientType.TO,new InternetAddress(toEmail));
			mesg.setSubject(subject);  
			mesg.setText(msg);  
			
			//Sending the Mail
			Transport.send(mesg);
		}
		catch(Exception e)
		{
			
		}
		
		response.sendRedirect("/JPMORGAN/linkresponse.html");
	}
}
