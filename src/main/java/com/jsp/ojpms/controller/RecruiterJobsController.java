package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.Job;
import com.jsp.ojpms.User;
import com.jsp.ojpms.dao.JobDao;

@WebServlet(value = "/recruiter-jobs")
public class RecruiterJobsController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User recruiter = (User) req.getSession().getAttribute("user");
		List<Job> jobs = JobDao.getJobsByRecruiter(recruiter.getId());
		long count = JobDao.countJobsByRecruiter(recruiter.getId());

		req.setAttribute("jobs", jobs);
		req.setAttribute("jobCount", count);
		req.getRequestDispatcher("recruiter-jobs.jsp").forward(req, resp);
	}
}
