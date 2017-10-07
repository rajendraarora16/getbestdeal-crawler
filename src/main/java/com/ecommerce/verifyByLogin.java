package com.ecommerce;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class verifyByLogin extends HttpServlet 
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		
		HttpSession sess = request.getSession();
		String email = (String)sess.getAttribute("userEmail");
		String name = (String)sess.getAttribute("firstName");
		
		response.sendRedirect("./verifyAccount.jsp?email="+email+"&name="+name);		
	}
}
