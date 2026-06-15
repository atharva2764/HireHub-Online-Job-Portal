package com.jsp.ojpms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.Job;
import com.jsp.ojpms.User;
import com.jsp.ojpms.util.JPAUtil;

public class JobDao {

	public static void saveJob(Job job) {
		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		User recruiter = job.getRecuriter();
		et.begin();
		em.persist(job);
		em.persist(recruiter);
		et.commit();
	}

	public static List<Job> getAllJobs() {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Job");
		List<Job> list = query.getResultList();
		return list;
	}

	public static List<Job> searchJobs(String search) {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Job WHERE title LIKE ?1 OR location LIKE ?1");
		query.setParameter(1, search);
		List<Job> list = query.getResultList();
		return list;
	}

	public static List<Job> getJobsByRecruiter(int recruiterId) {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Job WHERE recuriter.id = ?1");
		query.setParameter(1, recruiterId);
		List<Job> list = query.getResultList();
		return list;
	}

	public static long countJobsByRecruiter(int recruiterId) {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("SELECT COUNT(j) FROM Job j WHERE j.recuriter.id = ?1");
		query.setParameter(1, recruiterId);
		return (long) query.getSingleResult();
	}

	public static Job getJobById(int jobId) {
		EntityManager em = JPAUtil.getEm();
		return em.find(Job.class, jobId);
	}

	public static void updateJob(Job job) {
		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		Job dbJob = em.find(Job.class, job.getId());
		dbJob.setTitle(job.getTitle());
		dbJob.setDescription(job.getDescription());
		dbJob.setLocation(job.getLocation());
		dbJob.setSalary(job.getSalary());
		et.begin();
		em.merge(dbJob);
		et.commit();
	}

	public static void deleteJob(int jobId) {
		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		Job job = em.find(Job.class, jobId);
		et.begin();
		em.remove(job);
		et.commit();
	}
}
