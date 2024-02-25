package com.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("username");
		String email=req.getParameter("useremail");
		String password=req.getParameter("userpassword"); 
		
		
		/* storing the above name,email,password  */
		
		UserData ud=new UserData();
		ud.setName(name);
		ud.setEmail(email);
		ud.setPassword(password);
		
		/* adding the data into the database */
		
		Connection con=DBConnection.getCon();
		
		UserDAO udao=new UserDAO(con);
		boolean f=udao.addUser(ud);
		
		PrintWriter out= resp.getWriter();
		
		//session
		HttpSession session;
		
		if(f) {
		
			/* showing msg in the frontend using httpsession */
			session=req.getSession();
			session.setAttribute("reg-sucess", "Registered Sucessfully");
		    resp.sendRedirect("register.jsp");
			
		}else {
			session=req.getSession();
			session.setAttribute("reg-fail", "Registration failed !");
			resp.sendRedirect("register.jsp");
		}
		
	}

}
