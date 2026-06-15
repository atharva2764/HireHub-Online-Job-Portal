package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.User;
import com.jsp.ojpms.dao.UserDao;

@WebServlet(value = "/edituserprofile")
public class EditUserProfileController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String stringid = req.getParameter("id");

		int id = Integer.parseInt(stringid);

		System.out.println("name :" + name);
		System.out.println("email :" + email);
		System.out.println("password :" + password);
		System.out.println("id :" + id);

		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);

		UserDao.updateProfile(user);

		req.setAttribute("msg", "profile updated Successfully ...");
		req.getRequestDispatcher("user-dashboard.jsp").forward(req, resp);

	}
}
