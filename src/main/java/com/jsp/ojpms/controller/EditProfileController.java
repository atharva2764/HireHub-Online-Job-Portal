package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.User;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet(value = "/editprofile")
public class EditProfileController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String stringId = req.getParameter("userId");

		int id = Integer.parseInt(stringId);

		EntityManager em = JPAUtil.getEm();
		User user = em.find(User.class, id);

		req.setAttribute("user", user);
		req.getRequestDispatcher("editprofile.jsp").forward(req, resp);

	}

}
