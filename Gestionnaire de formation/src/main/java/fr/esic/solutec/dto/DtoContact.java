package fr.esic.solutec.dto;

import java.util.List;


import fr.esic.solutec.dao.DaoContact;
import fr.esic.solutec.entities.Contact;

public class DtoContact {

	
	public static Contact getContact(int idContact) {
		
		return DaoContact.getContact(idContact);
	}
	
	public static List<Contact> getListContact() {
		
		return DaoContact.getListContact();
	}
}
