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

public class verifyAccount extends HttpServlet 
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();

		String userEmail = request.getParameter("email");
				
		String userPressPassCode = request.getParameter("passCode");
		int userPressPassCodeConvert = Integer.parseInt(userPressPassCode);
		
		String databaseEmail = null;
		StringBuilder builder = new StringBuilder();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("Your database connection with username and password");
			
			String sqlQuery = "SELECT * FROM EcommerceRegistration WHERE passCode=?";
			
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setInt(1, userPressPassCodeConvert);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next())
			{
				databaseEmail = rs.getString("email");
				builder.append(databaseEmail);
			} 
			
			if(userEmail.equals(databaseEmail))
			{
				String sqlQuery2 = "UPDATE EcommerceRegistration SET verify=? WHERE email=?";
				
				PreparedStatement stmt2 = con.prepareStatement(sqlQuery2);
				stmt2.setString(1, "verified");
				stmt2.setString(2, databaseEmail);
				stmt2.executeUpdate();
				response.sendRedirect("./verifiedSuccessful.jsp");
			}
			else{
				response.sendRedirect("./invalidVerfiedCode.jsp");
			}
			con.close();
		}catch(Exception e){response.sendRedirect("./error.jsp");}
	}
}
