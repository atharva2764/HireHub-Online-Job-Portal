package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.Job;
import com.jsp.ojpms.dao.JobDao;

@WebServlet(value = "/editjob")
public class EditJobController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int jobId = Integer.parseInt(req.getParameter("jobId"));
        Job job = JobDao.getJobById(jobId);
        req.setAttribute("job", job);
        req.getRequestDispatcher("recruiter-editjob.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int jobId       = Integer.parseInt(req.getParameter("id"));
        String title    = req.getParameter("title");
        String desc     = req.getParameter("description");
        String location = req.getParameter("location");
        double salary   = Double.parseDouble(req.getParameter("salary"));

        Job job = new Job();
        job.setId(jobId);
        job.setTitle(title);
        job.setDescription(desc);
        job.setLocation(location);
        job.setSalary(salary);

        JobDao.updateJob(job);
        resp.sendRedirect("recruiter-jobs?msg=updated");
    }
}
