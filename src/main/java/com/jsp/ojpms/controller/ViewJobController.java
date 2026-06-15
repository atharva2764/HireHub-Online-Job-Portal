package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.Job;
import com.jsp.ojpms.dao.JobDao;

@WebServlet(value = "/viewjob")
public class ViewJobController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String search = req.getParameter("search");

		List<Job> list2;
		if (search != null) {
			list2 = JobDao.searchJobs(search);
			req.setAttribute("jobs", list2);
			req.getRequestDispatcher("viewjob.jsp").forward(req, resp);

		} else {
			List<Job> list = JobDao.getAllJobs();
			req.setAttribute("jobs", list);
			req.getRequestDispatcher("viewjob.jsp").forward(req, resp);

		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}

}
