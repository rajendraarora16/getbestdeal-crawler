package com.ecommerce;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class resendCode extends HttpServlet 
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		Random random2 = new Random(System.currentTimeMillis());
		int passCode=10000 + random2.nextInt(20000);
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("Your database connection with username and password");
			
			String sqlQuery="UPDATE EcommerceRegistration SET passCode=? WHERE email=?";
			
			PreparedStatement stmt=con.prepareStatement(sqlQuery);
			stmt.setInt(1, passCode);
			stmt.setString(2, email);
			stmt.executeUpdate();			
	        con.close();
	        response.sendRedirect("./sendMailToConfirm.jsp?email="+email+"&firstName="+name+"&passCode="+passCode);
		}catch(Exception e){response.sendRedirect("./error.jsp");}
		
	}
}
