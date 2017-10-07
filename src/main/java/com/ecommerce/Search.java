package com.ecommerce;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Search extends HttpServlet 
{
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		
		String query = request.getParameter("query");
		
		RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("./searchResult.jsp?query="+query);
		RequetsDispatcherObj.forward(request, response);
	}
}
