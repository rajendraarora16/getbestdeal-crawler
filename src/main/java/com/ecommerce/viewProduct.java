package com.ecommerce;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class viewProduct extends HttpServlet 
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String productQuery = request.getParameter("productQuery");
		String url = request.getParameter("url");	
		
		int views = 0;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("Your database connection with username and password");
			
			String sqlQuery = "SELECT * FROM EcommerceTable WHERE productQuery=?";
			
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, productQuery);
			ResultSet rs = stmt.executeQuery();
			while(rs.next())
			{
				int view = rs.getInt("views");
				views = view;
			}
			
			con.close();
		}catch(Exception e){e.printStackTrace();}
		
		views = views + 1;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("Your database connection with username and password");
			
			String sqlQuery = "UPDATE EcommerceTable SET views=? WHERE productQuery=?";
			
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setInt(1, views);
			stmt.setString(2, productQuery);
			stmt.executeUpdate();
			con.close();
		}catch(Exception e){e.printStackTrace();}
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("Your database connection with username and password");
			
			String sqlQuery = "UPDATE reviews SET views=? WHERE productQuery=?";
			
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setInt(1, views);
			stmt.setString(2, productQuery);
			stmt.executeUpdate();
			con.close();
		}catch(Exception e){e.printStackTrace();}
		
		response.sendRedirect(url);
	}
}
