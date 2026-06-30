package com.jsp.rsm.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtil {

	private static EntityManager em = null;

	public EntityManager getEm() {
		if (em == null) {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("jsp");
			EntityManager em = emf.createEntityManager();

			return em;
		} else {
			return em;
		}
	}

}
