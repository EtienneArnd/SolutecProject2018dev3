package fr.esic.solutec.dao;

import java.util.List;

import javax.persistence.Query;


import fr.esic.solutec.entities.SessionCursus;



public class DaoSessionCursus extends Dao{

		
	public static SessionCursus getSessionCursus(int idSessionCursus)
	{
		
		return entityManager.find(SessionCursus.class, idSessionCursus);
		
		
	}
	
	
	public static List<SessionCursus> getListSessionCursus()
	{
		Query query = null;
		
		query = entityManager.createNamedQuery("SessionCursus.findAll");
		
		return query.getResultList();
	}
	
	public static void AddSessionCursus(SessionCursus sessionCursus)
	{
		entityManager.getTransaction().begin();
		
		entityManager.persist(sessionCursus);
		
		entityManager.getTransaction().commit();
	}
	
}
