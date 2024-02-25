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

import com.DAO.UserDAO;
import com.Db.DBConnection;
import com.User.UserData;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// taking data from the user
		String username=req.getParameter("logineUserName");
		String email = req.getParameter("loginemail");
		String password = req.getParameter("loginpassword");

		// storing user data into userdata object
		UserData ud = new UserData();
		ud.setName(username);
		ud.setEmail(email);
		ud.setPassword(password);

		// getting connection from com.Db.DbConnection
		Connection con = DBConnection.getCon();
		UserDAO udao = new UserDAO(con);

		
		///checking login credentials
		UserData usd = udao.loginUser(ud);

		if (usd!=null) {
			System.out.println(usd);
			HttpSession session=req.getSession();
			session.setAttribute("loggedinUserName", usd);
			resp.sendRedirect("home.jsp");
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("login-fail", "Login Error");
			resp.sendRedirect("login.jsp");
		}
	}

}
