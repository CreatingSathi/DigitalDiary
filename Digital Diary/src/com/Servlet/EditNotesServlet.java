package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.Db.DBConnect;

/**
 * Servlet implementation class EditNotesServlet
 */
@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditNotesServlet() {
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
			
			Integer noteid=Integer.parseInt(request.getParameter("noteid"));
			String Title=request.getParameter("title");
			String Content=request.getParameter("content");
			
			PostDAO dao = new PostDAO(DBConnect.getCon());
			boolean f=dao.PostUpdate(noteid, Title, Content);
			
			if(f){
				System.out.println("DATA UPDATE SUCCESFULLY");
				HttpSession session=request.getSession();
				session.setAttribute("updateMsg", "NOTES UPDATE SUCESSFULLY");
				response.sendRedirect("ShowNotes.jsp");
				
			}
			else{
				System.out.println("DATA NOT UPDATE");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
