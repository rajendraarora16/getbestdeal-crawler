<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	String forgetPassKey = request.getParameter("forgetPassKey");
	String email = request.getParameter("email");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("Your database connection with username and password");
	
	String sqlQuery = "SELECT * FROM EcommerceRegistration WHERE email=?";
	PreparedStatement stmt = con.prepareStatement(sqlQuery);
	stmt.setString(1, email);
	
	ResultSet rs = stmt.executeQuery();
	if(rs.next())
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con2 = DriverManager.getConnection("Your database connection with username and password");
			
			String sqlQuery2 = "INSERT INTO forgetPassword(email, forgetPassKey) VALUES(?, ?)";
			PreparedStatement stmt2 = con2.prepareStatement(sqlQuery2);
			stmt2.setString(1, email);
			stmt2.setString(2, forgetPassKey);
			stmt2.executeUpdate();
			con2.close();
			/*----------------------SENDING EMAIL-----------------------*/
			// Recipient's email ID needs to be mentioned.
		      String to = email;//change accordingly

		      // Sender's email ID needs to be mentioned
		      String from = "";//change accordingly
		      final String gmailUsername = "";//change accordingly
		      final String gmailPassword = "";//change accordingly

		      // Assuming you are sending email through relay.jangosmtp.net
		      String host = "smtp.gmail.com";

		      Properties props = new Properties();
		      props.put("mail.smtp.auth", "true");
		      props.put("mail.smtp.starttls.enable", "true");
		      props.put("mail.smtp.host", host);
		      props.put("mail.smtp.port", "587");

		      // Get the Session object.
		      Session sess = Session.getInstance(props,
		      new javax.mail.Authenticator() {
		         protected PasswordAuthentication getPasswordAuthentication() {
		            return new PasswordAuthentication(gmailUsername, gmailPassword);
		         }
		      });

		      try {
		         // Create a default MimeMessage object.
		         Message message = new MimeMessage(sess);

		         // Set From: header field of the header.
		         message.setFrom(new InternetAddress(from));

		         // Set To: header field of the header.
		         message.setRecipients(Message.RecipientType.TO,
		         InternetAddress.parse(to));

		         // Set Subject: header field
		         message.setSubject("Forget password confirmation");

		         // Now set the actual message
		         message.setText("You're requested a new password for your account."
		         		+ "\n\nPlease copy this key: "+forgetPassKey
		         		+ "\n\nYou would be asked to paste this key on the text box to verify your email."
		         		+ "\nHave a nice day!");

		         // Send message
		         Transport.send(message);

		         //System.out.println("Sent message successfully....");

		      } catch (MessagingException e) {
		            throw new RuntimeException(e);
		      }
			/*----------------------------------------------------------*/
			response.sendRedirect("./forgetPasswordCode.jsp");
			
		}catch(Exception e){e.printStackTrace();}
	}
	else{
		response.sendRedirect("errorForgetPassword.jsp");
	}
	con.close();
}catch(Exception e){e.printStackTrace();}
%>