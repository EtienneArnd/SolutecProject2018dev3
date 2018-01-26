package fr.esic.solutec.dao;

import java.util.List;

import javax.persistence.Query;


import fr.esic.solutec.entities.Contact;



public class DaoContact extends Dao{

		
	public static Contact getContact(int idContact)
	{
		
		return entityManager.find(Contact.class, idContact);
		
		
	}
	
	
	public static List<Contact> getListContact()
	{
		Query query = null;
		
		query = entityManager.createNamedQuery("Contact.findAll");
		
		return query.getResultList();
	}
	
	public static void AddContact(Contact contact)
	{
		entityManager.getTransaction().begin();
		
		entityManager.persist(contact);
		
		entityManager.getTransaction().commit();
	}
	
}
