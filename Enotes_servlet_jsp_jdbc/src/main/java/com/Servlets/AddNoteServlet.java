package com.Servlets;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.Db.DBConnection;

@WebServlet("/AddNoteServlet")
public class AddNoteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String usid=req.getParameter("loggedinUserid");
		int userid = Integer.parseInt(usid.trim());

		String NoteTitle = req.getParameter("InNoteTitle");
		String NoteContent = req.getParameter("InNoteContent");

		Connection con = DBConnection.getCon();
		PostDAO pda = new PostDAO(con);

		boolean f = pda.addPost(NoteTitle, NoteContent, userid);

		if (f) {
			System.out.println("data inserted sucessfully");
			HttpSession session = req.getSession();
			session.setAttribute("NoteSuccess", "Notes added successfully");
			resp.sendRedirect("showNotes.jsp");

		}else {
			System.out.println("data not inserted");
		}
	}

}
