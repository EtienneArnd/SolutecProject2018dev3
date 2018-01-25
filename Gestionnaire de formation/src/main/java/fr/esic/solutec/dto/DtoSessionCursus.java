package fr.esic.solutec.dto;

import java.util.List;


import fr.esic.solutec.dao.DaoSessionCursus;
import fr.esic.solutec.entities.SessionCursus;

public class DtoSessionCursus {

	
	public static SessionCursus getSessionCursus(int idSessionCursus) {
		
		return DaoSessionCursus.getSessionCursus(idSessionCursus);
	}
	
	public static List<SessionCursus> getListSessionCursus() {
		
		return DaoSessionCursus.getListSessionCursus();
	}
	
	
	
	
}
