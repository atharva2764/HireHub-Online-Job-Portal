package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.Application;
import com.jsp.ojpms.Job;
import com.jsp.ojpms.User;
import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.util.EmailUtil;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet("/applyjob")
public class ApplyJobController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stringId = req.getParameter("jobId");
		
		System.out.println("jobId : " + stringId);
		int id = Integer.parseInt(stringId);

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		EntityManager em = JPAUtil.getEm();
		Job job = em.find(Job.class, id);

		Application application = new Application();
		application.setJob(job);
		application.setUser(user);

		if (ApplicationDao.isAlreadyApplied(user.getId(), job.getId())) {
			System.out.println("Alredy applied");
//		  req.setAttribute("id", user.getId());
			req.setAttribute("appliedId", id);
			req.setAttribute("error", "Already  Applied");

			List<Job> list = JobDao.getAllJobs();
			req.setAttribute("jobs", list);

			req.getRequestDispatcher("viewjob").forward(req, resp);

		} else {

			ApplicationDao.saveApplication(application);

			String subject = "Application for " + job.getTitle();
			String message = "Hello " + user.getName() + " , \n \n " + " You have successfully "
					+ "Applied for the job : " + job.getTitle() + " Location : " + job.getLocation() + " \n \n  "
					+ "We will notify you soon" + "Best Regards \n Job Portal Team";
			EmailUtil.sendEmail(user.getEmail(), subject, message);

			User recuriter = job.getRecuriter();

			String recruiterSubject = "New Application for " + job.getTitle();
			String recruterMessage = "Hello , \n \n new candidate has applied .. \n \n " + "Name : " + user.getName()
					+ " \n" + "Email : " + user.getEmail() + " \n \n" + "Please login to review ... \n \n "
					+ "Best Regards \n Job Portal Team ";

			EmailUtil.sendEmail(recuriter.getEmail(), recruiterSubject, recruterMessage);

		}
		resp.sendRedirect("viewjob");

	}
}
