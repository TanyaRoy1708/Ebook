package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDAOImpl;
import com.entity.User;

@WebServlet("/register")
public class registerServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phon = req.getParameter("phon");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phon);
			us.setPassword(password);
			HttpSession session = req.getSession();

			if (check != null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

				boolean f2 = dao.checkuser(email);
				if (f2) {
					boolean f = dao.userRegister(us);

					if (f) {

						session.setAttribute("succMsg", "Registration Sucessfully...");
						resp.sendRedirect("register.jsp");
					} else {

						session.setAttribute("failedMsg", "Something went wrong on server...");
						resp.sendRedirect("register.jsp");
					}
				} else {
					session.setAttribute("failedMsg", "User Already exists try another Email ID");
					resp.sendRedirect("register.jsp");
				}

			} else {

				session.setAttribute("failedMsg", "Please Check The Terms & Condition...");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
