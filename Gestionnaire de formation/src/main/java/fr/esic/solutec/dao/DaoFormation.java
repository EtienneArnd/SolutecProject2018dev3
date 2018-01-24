package fr.esic.solutec.dao;

import java.util.List;

import javax.persistence.Query;


import fr.esic.solutec.entities.Formation;



public class DaoFormation extends Dao{

		
	public static Formation getFormation(int idFormation)
	{
		
		return entityManager.find(Formation.class, idFormation);
		
		
	}
	
	
	public static List<Formation> getListFormation()
	{
		Query query = null;
		
		query = entityManager.createNamedQuery("Formation.findAll");
		
		return query.getResultList();
	}
	
	public static void AddFormation(Formation formation)
	{
		entityManager.getTransaction().begin();
		
		entityManager.persist(formation);
		
		entityManager.getTransaction().commit();
	}
	
	public static void EditFormation(Formation formation)
	{	
		entityManager.getTransaction().begin();
		
		entityManager.getTransaction().commit();
	}
	
}
