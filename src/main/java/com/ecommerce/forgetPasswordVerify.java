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

public class forgetPasswordVerify extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String passCode = request.getParameter("passCode");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("Your database connection with username and password");
			
			String sqlQuery = "SELECT * FROM forgetPassword WHERE forgetPassKey=?";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, passCode);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{
				out.println("<h1>Enter your new password: </h1>");
				out.println("<form method='post' action='updatingPassword?passCode="+passCode+"'>");
				out.println("<br><input type='password' name='newPassword' placeholder='New password' required='required' />");
				out.println("<br><input type='password' name='confirmPassword' placeholder='Confirm password' required='required' />");
				out.println("<br><input type='submit' value='Change my password' />");
				out.println("</form>");
			}
			else{
				response.sendRedirect("./error.jsp");
			}
			con.close();
			
		}catch(Exception e){e.printStackTrace();}
	}
}
