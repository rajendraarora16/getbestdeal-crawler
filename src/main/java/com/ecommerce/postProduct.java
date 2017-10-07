package com.ecommerce;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

public class postProduct extends HttpServlet 
{
	private SecureRandom random = new SecureRandom();

	  public String productQuery() {
	    return new BigInteger(130, random).toString(32);
	  }
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String productName = request.getParameter("product");
		String linkName = request.getParameter("buyLink");
		String companyName = request.getParameter("companyName");
		
		String price = request.getParameter("price");
		
		int digitPrice = Integer.parseInt(request.getParameter("digitPrice"));
		
		String cashOnDelivery = request.getParameter("cashOnDelivery");
		String imageURL = request.getParameter("imageURL");
		
		int popularityInt = Integer.parseInt(request.getParameter("popularity"));
		
		String tag1 = request.getParameter("tag1");
		String tag2 = request.getParameter("tag2");
		String tag3 = request.getParameter("tag3");
		
		String productQuery = productQuery();
		
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("Your database connection with username and password");
			
			String sqlQuery = "INSERT INTO EcommerceTable(productName, buyLink, companyName, price, digitPrice, cashOnDelivery, imageURL, popularity, tag1, tag2, tag3, views, productQuery) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, productName);
			stmt.setString(2, linkName);
			stmt.setString(3, companyName);
			stmt.setString(4, price);
			stmt.setInt(5, digitPrice);
			stmt.setString(6, cashOnDelivery);
			stmt.setString(7, imageURL);
			stmt.setInt(8, popularityInt);
			stmt.setString(9, tag1);
			stmt.setString(10, tag2);
			stmt.setString(11, tag3);
			stmt.setInt(12, 1);
			stmt.setString(13, productQuery);
			
			stmt.executeUpdate();
			
			
			
			con.close();			
			
		}catch(Exception e){response.sendRedirect("./error.jsp");}
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con2 = DriverManager.getConnection("Your database connection with username and password");
			String sqlQuery2 = "INSERT INTO reviews(productName, buyLink, companyName, price, cashOnDelivery, imageURL, popularity, tag1, tag2, tag3, views, productQuery) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement stmt2 = con2.prepareStatement(sqlQuery2);
			stmt2.setString(1, productName);
			stmt2.setString(2, linkName);
			stmt2.setString(3, companyName);
			stmt2.setString(4, price);
			stmt2.setString(5, cashOnDelivery);
			stmt2.setString(6, imageURL);
			stmt2.setInt(7, popularityInt);
			stmt2.setString(8, tag1);
			stmt2.setString(9, tag2);
			stmt2.setString(10, tag3);
			stmt2.setInt(11, 1);
			stmt2.setString(12, productQuery);
			stmt2.executeUpdate();
			con2.close();
		}catch(Exception e){e.printStackTrace();}
		out.println("<p>Success!!</p>");
	}
}
