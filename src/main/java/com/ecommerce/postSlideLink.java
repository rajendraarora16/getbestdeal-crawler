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

public class postSlideLink extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String link = request.getParameter("slide");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("Your database connection with username and password");
			
			String sqlQuery="INSERT INTO slide(link) VALUES (?)";
			
			PreparedStatement stmt=con.prepareStatement(sqlQuery);
			stmt.setString(1, link);
			stmt.executeUpdate();
			con.close();
			
			out.println("<h1>Success</h1>");
			
		}catch(Exception e){e.printStackTrace();}
	}
}
