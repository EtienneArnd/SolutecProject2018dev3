package fr.esic.solutec.dao;

import java.util.List;

import javax.persistence.Query;

import fr.esic.solutec.entities.Formation;
import fr.esic.solutec.entities.FormationCursus;

public class DaoFormationCursus extends Dao{

	

	
	public static FormationCursus getFormationCursus(int idFormationCursus)
	{
		
		return entityManager.find(FormationCursus.class, idFormationCursus);
		
		
	}
	
	public static List<FormationCursus> getListFormationCursusByIdCursus(int IdCursus)
	{
		Query query = null;
		
		query = entityManager.createNamedQuery("FormationCursus.findByIdCursus");
		
		query.setParameter("idCursus",IdCursus);
		
		return query.getResultList();
	}
	
	
	public static List<FormationCursus> getListFormationCursus()
	{
		Query query = null;
		
		query = entityManager.createNamedQuery("FormationCursus.findAll");
		
		return query.getResultList();
	}
	
	public static void AddFormationCursus(FormationCursus sessionCursus)
	{
		entityManager.getTransaction().begin();
		
		entityManager.persist(sessionCursus);
		
		entityManager.getTransaction().commit();
	}
	
	
	public static void EditFormationCursus(FormationCursus formationCursus)
	{	
		entityManager.getTransaction().begin();
		
		entityManager.getTransaction().commit();
	}
	
	
}
