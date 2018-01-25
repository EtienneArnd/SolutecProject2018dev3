package fr.esic.solutec.dao;

import java.util.List;

import javax.persistence.Query;


import fr.esic.solutec.entities.Salle;



public class DaoSalle extends Dao{

		
	public static Salle getSalle(int idSalle)
	{
		
		return entityManager.find(Salle.class, idSalle);
		
		
	}
	
	
	public static List<Salle> getListSalle()
	{
		Query query = null;
		
		query = entityManager.createNamedQuery("Salle.findAll");
		
		return query.getResultList();
	}
	
	public static void AddSalle(Salle salle)
	{
		entityManager.getTransaction().begin();
		
		entityManager.persist(salle);
		
		entityManager.getTransaction().commit();
	}
	
}
