package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.User;
import com.jsp.ojpms.dao.UserDao;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet(value = "/recruiter-profile")
public class RecruiterProfileController extends HttpServlet {

	// GET -> load recruiter profile view
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String stringId = req.getParameter("id");
		int id = Integer.parseInt(stringId);

		EntityManager em = JPAUtil.getEm();
		User user = em.find(User.class, id);

		req.setAttribute("user", user);
		req.getRequestDispatcher("recruiter-profile.jsp").forward(req, resp);
	}

	// POST -> update recruiter profile
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String stringId = req.getParameter("id");

		int id = Integer.parseInt(stringId);

		System.out.println("Recruiter update -> id:" + id + " name:" + name + " email:" + email);

		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);

		UserDao.updateProfile(user);

		// Refresh session user object
		EntityManager em = JPAUtil.getEm();
		User updatedUser = em.find(User.class, id);
		req.getSession().setAttribute("user", updatedUser);

		req.setAttribute("msg", "Profile updated successfully!");
		req.setAttribute("user", updatedUser);
		req.getRequestDispatcher("recruiter-profile.jsp").forward(req, resp);
	}
}
