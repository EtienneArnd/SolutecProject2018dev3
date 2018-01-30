package fr.esic.solutec.dao;

import java.util.List;

import javax.persistence.Query;


import fr.esic.solutec.entities.Cursus;



public class DaoCursus extends Dao{

		
	public static Cursus getCursus(int idCursus)
	{
		
		return entityManager.find(Cursus.class, idCursus);
		
		
	}
	
	
	public static List<Cursus> getListCursus()
	{
		Query query = null;
		
		query = entityManager.createNamedQuery("Cursus.findAll");
		
		return query.getResultList();
	}
	
	public static int AddCursus(Cursus cursus)
	{
		entityManager.getTransaction().begin();
		
		entityManager.persist(cursus);
		entityManager.flush();
		
		entityManager.getTransaction().commit();
		
		return cursus.getIdCursus();
	}
	
	public static void EditCursus(Cursus cursus)
	{	
		entityManager.getTransaction().begin();
		
		entityManager.getTransaction().commit();
	}
	
}
