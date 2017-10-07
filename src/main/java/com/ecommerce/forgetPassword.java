package com.ecommerce;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.SecureRandom;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class forgetPassword extends HttpServlet
{
	private SecureRandom random = new SecureRandom();

	  public String forgetPassCode() {
	    return new BigInteger(130, random).toString(32);
	  }
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String forgetPassKey = forgetPassCode();
		
		String email = request.getParameter("userEmail");
		response.sendRedirect("./sendForgetPasswordMail.jsp?forgetPassKey="+forgetPassKey+"&email="+email);		
	}
}
