package com.Servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.Db.DBConnection;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//fetching id of note
		String temp=request.getParameter("note_id");// find in url and in shownote.jsp
		Integer noteid=Integer.parseInt(temp.trim());
		
		//using postdao to delete the note
		
		Connection con=DBConnection.getCon();
		PostDAO pdo=new PostDAO(con);
		
		boolean f=pdo.deleteNote(noteid);
		
		if(f) {
			HttpSession session=request.getSession();
			session.setAttribute("deletenoteMsg", "Note deleted");
			response.sendRedirect("showNotes.jsp");
			
		}else {
			HttpSession session2=request.getSession();
			session2.setAttribute("failDeletenote", "something went wrong !");
			response.sendRedirect("showNotes.jsp");
		}
		
		

	}
}
