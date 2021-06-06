package com.Servlet;

import java.sql.*;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;

/**
 * Servlet implementation class Forgot
 */
@WebServlet("/Forgot")
public class Forgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Forgot() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			Connection con=DBConnect.getCon();
			
			String email=request.getParameter("email");
			String pass=request.getParameter("pass");
			 
			
			PreparedStatement ps=con.prepareStatement("update user set password =? where email=?");
			ps.setString(2, email);
			ps.setString(1, pass);
			 
			
			int i=ps.executeUpdate();
			
			
			
			if(i>0  ){
				System.out.println("Forgot Password Sucessfully");
				
				HttpSession s=request.getSession();
				s.setAttribute("forgotmsg", "Forgot SucessFully....!!!!!!");
				
				response.sendRedirect("login.jsp");
			}
			else{
				System.out.println("Something Went Wrong on Server");
				
				HttpSession s=request.getSession();
				s.setAttribute("wrongmsg", "Something Went Wrong on Server....!!!!!!");
				
				response.sendRedirect("forgot.jsp");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

}
