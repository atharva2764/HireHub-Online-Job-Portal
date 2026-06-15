package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.User;
import com.jsp.ojpms.dao.UserDao;

@WebServlet(value = "/login")
public class LoginController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		System.out.println("Email :" + email);
		System.out.println("Password :" + password);

		User user = UserDao.getUser(email, password);
		System.out.println(user);

		if (user != null) {
			HttpSession session = req.getSession(true);
			session.setAttribute("user", user);

			if (user.getRole().equals("JOB_SEEKER")) {
				resp.sendRedirect("user-dashboard.jsp");

			} else if (user.getRole().equals("RECRUITER")) {
				resp.sendRedirect("recruiter-dashboard.jsp");
			}
		} else {
			req.setAttribute("error", "Invalid Credential");
			req.getRequestDispatcher("login.jsp").forward(req, resp);

		}

	}

}
