package com.ecommerce;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class postComment extends HttpServlet 
{
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		HttpSession sess = request.getSession();
		
		String productQuery = request.getParameter("productQuery");
		String comment = request.getParameter("comment");
		
		String firstName = (String)sess.getAttribute("firstName");
		String lastName = (String)sess.getAttribute("lastName");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("Your database connection with username and password");
			
			String sqlQuery="INSERT INTO comments(productQuery, comments, firstName, lastName) VALUES (?, ?, ?, ?)";
			
			PreparedStatement stmt=con.prepareStatement(sqlQuery);
			stmt.setString(1, productQuery);
			stmt.setString(2, comment);
			stmt.setString(3, firstName);
			stmt.setString(4, lastName);
			stmt.executeUpdate();
			con.close();
		}catch(Exception e){e.printStackTrace();}
		
		response.sendRedirect("./reviews.jsp?productQuery="+productQuery);
		
	}
}
