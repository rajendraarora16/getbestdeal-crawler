package com.ecommerce;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Registration extends HttpServlet 
{
	public String capitalizeFirstLetter(String original){
	    if(original.length() == 0)
	        return original;
	    return original.substring(0, 1).toUpperCase() + original.substring(1);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NullPointerException
	{
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String firstNameNotCapital = request.getParameter("firstName");
		String lastNameNotCapital = request.getParameter("lastName");
		
		String firstName = capitalizeFirstLetter(firstNameNotCapital);
		String lastName = capitalizeFirstLetter(lastNameNotCapital);
		
		if(email == "" || password == "" || email == " " || password == " " || firstName == "" || lastName == "" || firstName == " " || lastName == " " || email == null || password == null || firstName == null || lastName == null)
		{
			response.sendRedirect("./error.jsp");
		}
		else
		{
			String registeredEmail = null;
			StringBuilder builder = new StringBuilder();
			
			Random random2 = new Random(System.currentTimeMillis());
			int passCode=10000 + random2.nextInt(20000);
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("Your database connection with username and password");
				
				String sqlQuery = "SELECT * FROM EcommerceRegistration WHERE email=?";
				PreparedStatement stmt = con.prepareStatement(sqlQuery);
				stmt.setString(1, email);
				
				ResultSet rs = stmt.executeQuery();
				if(rs.next())
				{
					response.sendRedirect("errorRegistration.jsp");
				}
				else{
					try
					{
						String sqlQuery2 = "INSERT INTO EcommerceRegistration(email, password, firstName, lastName, passCode, verify) VALUES(?, ?, ?, ?, ?, ?)";
						PreparedStatement stmt2 = con.prepareStatement(sqlQuery2);
						
						stmt2.setString(1, email);
						stmt2.setString(2, password);
						stmt2.setString(3, firstName);
						stmt2.setString(4, lastName);
						stmt2.setInt(5, passCode);
						stmt2.setString(6, "notVerified");
						stmt2.executeUpdate();
					}catch(Exception e){response.sendRedirect("./error.jsp");}
					
					response.sendRedirect("sendMailToConfirm.jsp?email="+email+"&firstName="+firstName+"&passCode="+passCode);				
					}
					con.close();
				}catch(Exception e){response.sendRedirect("./error.jsp");}
		}		
	}
}


/*

String to = "rajendraarora161992@gmail.com";  

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
	 message.setText("Your confirmation code is ");  

	//send message  
 Transport.send(message);

} catch (MessagingException e) {throw new RuntimeException(e);} 
*/