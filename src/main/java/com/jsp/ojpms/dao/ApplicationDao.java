package com.jsp.ojpms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.Application;
import com.jsp.ojpms.util.JPAUtil;

public class ApplicationDao {
	public static void saveApplication(Application application) {
		EntityManager em= JPAUtil.getEm();
		EntityTransaction et =em.getTransaction();
		et.begin();
		em.persist(application);
		et.commit();
	}
   public static boolean  isAlreadyApplied(int uId,int jobId) {
	   EntityManager em=JPAUtil.getEm();
	   Query query =em.createQuery("FROM Application WHERE user.id=?1 AND job.id=?2");
	   query.setParameter(1, uId);
	   query.setParameter(2, jobId);
	   
	   List list =query.getResultList();
	   boolean empty=list.isEmpty();
	   System.out.println( "Empty "+empty);
	   return !empty;
   }
}
