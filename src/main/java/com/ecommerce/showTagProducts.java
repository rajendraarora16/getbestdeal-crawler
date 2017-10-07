package com.ecommerce;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class showTagProducts extends HttpServlet 
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(); 
		
		String tag = request.getParameter("tag");
		
	    if ((session.getAttribute("userEmail") == null) || (session.getAttribute("userEmail") == ""))
	    {
			response.sendRedirect("login.jsp");
		}
	    else
	    {	
	    	String userEmail = (String)session.getAttribute("userEmail");
			String firstName = (String)session.getAttribute("firstName");
			String verify = (String)session.getAttribute("verify");
			
			
			if(verify.equals("notVerified"))
			{
				out.println("<h1 style='text-align:center;font-size: 17px;color: #0E98CD;'>Your account is not verified, Kindly verify by <a href='verifyByLogin' style='color:red;'>clicking</a> here.</h1>");
			}
		
		RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("./showTagProducts.jsp?tag="+tag);
		RequetsDispatcherObj.forward(request, response);
	    }
	}
}
