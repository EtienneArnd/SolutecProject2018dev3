package fr.esic.solutec.dto;

import java.util.List;

import fr.esic.solutec.dao.Dao;
import fr.esic.solutec.dao.DaoFormation;
import fr.esic.solutec.entities.Formation;

public class DtoFormation {

	
	public static Formation getFormation(int idFormation) {
		
		return DaoFormation.getFormation(idFormation);
	}
	
	public static List<Formation> getListFormation() {
		
		return DaoFormation.getListFormation();
	}
	
	public static String[] getListNiveaux() {
		
		return Dao.getEnumValues("formation", "niveau");
	}
	
	
}
