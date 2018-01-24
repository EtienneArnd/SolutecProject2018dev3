package fr.esic.solutec.dto;

import java.util.List;

import fr.esic.solutec.dao.Dao;
import fr.esic.solutec.dao.DaoFormation;
import fr.esic.solutec.dao.DaoSessionFormation;
import fr.esic.solutec.entities.Formation;
import fr.esic.solutec.entities.SessionFormation;

public class DtoSessionFormation {

	
	public static SessionFormation getSessionFormation(int idSessionFormation) {
		
		return DaoSessionFormation.getSessionFormation(idSessionFormation);
	}
	
	public static List<SessionFormation> getListSessionFormation() {
		
		return DaoSessionFormation.getListSessionFormation();
	}
	
	public static String[] getListType() {
		
		return Dao.getEnumValues("session_formation", "type");
	}
	
	public static void AddSessionFormation(SessionFormation sessionFormation) {

		DaoSessionFormation.AddSessionFormation(sessionFormation);
		
	}
	
	public static void EditSessionFormation(SessionFormation sessionFormation_modif) {
		DaoSessionFormation.EditSessionFormation(sessionFormation_modif);
	}
	
}
