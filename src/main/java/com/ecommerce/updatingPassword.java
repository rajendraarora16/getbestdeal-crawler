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

public class updatingPassword extends HttpServlet 
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		
		String passCode=request.getParameter("passCode");
		
		String userEmail = null;
		StringBuilder builder = new StringBuilder();
		
		if(newPassword.equals(confirmPassword))
		{
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("Your database connection with username and password");
				
				String sqlQuery = "SELECT * FROM forgetPassword WHERE forgetPassKey=?";
				PreparedStatement stmt = con.prepareStatement(sqlQuery);
				stmt.setString(1, passCode);
				
				ResultSet rs = stmt.executeQuery();
				while(rs.next())
				{
					userEmail = rs.getString("email");
					builder.append(userEmail);
				}
				con.close();
			}catch(Exception e){e.printStackTrace();}
			
			
			/*--------------------------------------------------------------------------------*/
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con2 = DriverManager.getConnection("Your database connection with username and password");
				
				String sqlQuery2 = "UPDATE EcommerceRegistration SET password=? WHERE email=?";
				PreparedStatement stmt2 = con2.prepareStatement(sqlQuery2);
				stmt2.setString(1, newPassword);
				stmt2.setString(2, userEmail);
				stmt2.executeUpdate();
				con2.close();
				
				response.sendRedirect("passwordChangedSuccess.jsp");
				
			}catch(Exception e){e.printStackTrace();}
		}
		else
		{
			out.println("<h1>Your password is not matched!</h1>");
		}
	}
}
