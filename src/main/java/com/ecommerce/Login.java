package com.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet 
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();		
		
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("Your database connection with username and password");
			
			String sqlQuery="SELECT * FROM EcommerceRegistration WHERE email=? and password=?";
			
			PreparedStatement stmt=con.prepareStatement(sqlQuery);
			stmt.setString(1, userEmail);
			stmt.setString(2, userPassword);
			
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next())
			{
				session.setAttribute("userEmail", userEmail);
				session.setAttribute("firstName", rs.getString("firstName"));
				session.setAttribute("lastName", rs.getString("lastName"));
				session.setAttribute("passCode", rs.getInt("passCode"));
				session.setAttribute("verify", rs.getString("verify"));
				
				response.sendRedirect("home.jsp");
			}
			else{
				response.sendRedirect("login.jsp");
			}
			
			con.close();
			
		}catch(Exception e){response.sendRedirect("./error.jsp");}
	}
}
