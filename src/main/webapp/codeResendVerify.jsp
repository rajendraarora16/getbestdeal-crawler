<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	String passCode = request.getParameter("passCode");
	String firstName = request.getParameter("firstName");
	String userEmail = request.getParameter("userEmail");

	String to = userEmail;  
	//Get the session object  
	Properties props = new Properties();  
	props.put("mail.smtp.host", "smtp.gmail.com");  
	props.put("mail.smtp.socketFactory.port", "465");  
	props.put("mail.smtp.socketFactory.class",  
	    	"javax.net.ssl.SSLSocketFactory");  
	props.put("mail.smtp.auth", "true");  
	props.put("mail.smtp.port", "465");  

	Session sess = Session.getInstance(props,  
		new javax.mail.Authenticator() {  
		protected PasswordAuthentication getPasswordAuthentication() {  
		return new PasswordAuthentication("","");  
			}  
	});  

	//compose message  
	try {  
		 MimeMessage message = new MimeMessage(sess);  
		 message.setFrom(new InternetAddress(""));//change accordingly  
		 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
		 message.setSubject("Your confirmation code");  
		 message.setText("Hi "+firstName+","
	      		+ "\n\nPlease confirm your account"
	      		+ "\n\nYour 5 digit code: "+passCode
	      		+ "\n\nHave a nice day!");  

		//send message  
		Transport.send(message);
	}catch(Exception e){response.sendRedirect("./error.jsp");}
		
	response.sendRedirect("./verifyAccount.jsp");
%>
