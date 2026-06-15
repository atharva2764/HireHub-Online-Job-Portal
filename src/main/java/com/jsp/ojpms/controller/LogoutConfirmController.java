package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.User;

@WebServlet(value = "/nologout")
public class LogoutConfirmController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		if (user.getRole().equals("JOB_SEEKER")) {
			resp.sendRedirect("user-dashboard.jsp");
		} else {
			resp.sendRedirect("recruiter-dashboard.jsp");
		}
//		resp.sendRedirect("");
	}
}
