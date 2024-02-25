package com.Servlets;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// remove UserData object of user details

		try {

			HttpSession session = req.getSession();
			session.removeAttribute("loggedinUserName");// from loginServlet

			//show logout msg
			HttpSession session2=req.getSession();
			session.setAttribute("logoutMsg", "Logout Sucessfully");
			
			resp.sendRedirect("login.jsp");

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
