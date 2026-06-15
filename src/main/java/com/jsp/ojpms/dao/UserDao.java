package com.jsp.ojpms.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.User;
import com.jsp.ojpms.util.JPAUtil;

public class UserDao {

	public static void save(User user) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(user);
		et.commit();
	}

	public static User getUser(String email, String password) {

		try {

			EntityManager em = JPAUtil.getEm();

			Query query = em.createQuery("FROM User WHERE email=?1 AND password=?2");

			query.setParameter(1, email);
			query.setParameter(2, password);

			User user = (User) query.getSingleResult();

			return user;

		} catch (Exception e) {

			return null;
		}
	}

	public static boolean updatePassword(String email, String password) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Query query = em.createQuery("UPDATE User SET password=?1 WHERE email=?2");
		query.setParameter(1, password);
		query.setParameter(2, email);
		int update = query.executeUpdate();
		et.commit();
		return update > 0;
	}

	public static void updateProfile(User user) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		User dbUser = em.find(User.class, user.getId());

		dbUser.setEmail(user.getEmail());
		dbUser.setName(user.getName());
		dbUser.setPassword(user.getPassword());

		et.begin();
		em.merge(dbUser);
		et.commit();
	}
}