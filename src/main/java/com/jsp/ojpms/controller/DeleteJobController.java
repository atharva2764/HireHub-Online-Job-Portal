package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.JobDao;

@WebServlet(value = "/deletejob")
public class DeleteJobController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int jobId = Integer.parseInt(req.getParameter("jobId"));
        JobDao.deleteJob(jobId);
        resp.sendRedirect("recruiter-jobs?msg=deleted");
    }
}
