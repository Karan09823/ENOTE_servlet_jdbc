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

@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			Integer noteid = Integer.parseInt(request.getParameter("noteid"));

			String Title = request.getParameter("EditNoteTitle");

			String content = request.getParameter("EditNoteContent");

			Connection con = DBConnection.getCon();
			PostDAO psd = new PostDAO(con);
			boolean f = psd.updateNote(noteid, Title, content);

			if (f) {
				System.out.println("data updated Sucessfully");
				HttpSession session=request.getSession();
				session.setAttribute("updatenotemsg", "Notes updated");
				response.sendRedirect("showNotes.jsp");
			} else {
				System.out.println("data not used");
				HttpSession session=request.getSession();
				session.setAttribute("Failupdatenotemsg", "Notes not updated");
				response.sendRedirect("showNotes.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
