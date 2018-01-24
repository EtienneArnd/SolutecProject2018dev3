package fr.esic.solutec.dao;

import java.util.List;

import javax.persistence.Query;


import fr.esic.solutec.entities.Theme;



public class DaoTheme extends Dao{

		
	public static Theme getTheme(int idTheme)
	{
		
		return entityManager.find(Theme.class, idTheme);
		
		
	}
	
	
	public static List<Theme> getListTheme()
	{
		Query query = null;
		
		query = entityManager.createNamedQuery("Theme.findAll");
		
		return query.getResultList();
	}
	
	public static void AddTheme(Theme theme)
	{
		entityManager.getTransaction().begin();
		
		entityManager.persist(theme);
		
		entityManager.getTransaction().commit();
	}
	
}
