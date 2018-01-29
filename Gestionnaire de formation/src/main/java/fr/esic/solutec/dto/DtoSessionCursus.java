package fr.esic.solutec.dto;

import java.util.List;

import fr.esic.solutec.dao.DaoSessionCursus;
import fr.esic.solutec.entities.SessionCursus;
import fr.esic.solutec.entities.SessionFormation;

public class DtoSessionCursus {

	
	public static SessionCursus getSessionCursus(int idSessionCursus) {
		
		return DaoSessionCursus.getSessionCursus(idSessionCursus);
	}
	
	public static List<SessionCursus> getListSessionCursus() {
		
		return DaoSessionCursus.getListSessionCursus();
	}
	
	public static List<SessionFormation> getListSessionFormationSessionCursus(int IdSessionCursus){

		return DaoSessionCursus.getListSessionFormationSessionCursus(IdSessionCursus);
	}
	
	public static void AddSessionCursus(SessionCursus sessionCursus) {

		DaoSessionCursus.AddSessionCursus(sessionCursus);
		
	}
	
	public static void EditSessionCursus(SessionCursus sessionCursus_modif) {
		DaoSessionCursus.EditSessionCursus(sessionCursus_modif);
	}
	
	
}
