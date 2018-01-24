package fr.esic.solutec.dao;

import java.util.List;

import javax.persistence.Query;


import fr.esic.solutec.entities.Formation;
import fr.esic.solutec.entities.SessionFormation;



public class DaoSessionFormation extends Dao{

		
	public static SessionFormation getSessionFormation(int idSessionFormation)
	{
		
		return entityManager.find(SessionFormation.class, idSessionFormation);
		
		
	}
	
	
	public static List<SessionFormation> getListSessionFormation()
	{
		Query query = null;
		
		query = entityManager.createNamedQuery("SessionFormation.findAll");
		
		return query.getResultList();
	}
	
	public static void AddSessionFormation(SessionFormation sessionFormation)
	{
		entityManager.getTransaction().begin();
		
		entityManager.persist(sessionFormation);
		
		entityManager.getTransaction().commit();
	}
	
	public static void EditSessionFormation(SessionFormation sessionFormation_modif)
	{	
		entityManager.getTransaction().begin();
		
		entityManager.getTransaction().commit();
	}
	
}
