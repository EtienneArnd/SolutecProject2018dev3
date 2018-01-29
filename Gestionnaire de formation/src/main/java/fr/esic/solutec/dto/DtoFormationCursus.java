package fr.esic.solutec.dto;

import java.util.List;

import javax.persistence.Query;

import fr.esic.solutec.dao.DaoFormationCursus;
import fr.esic.solutec.entities.FormationCursus;

public class DtoFormationCursus {

	
	
	public static FormationCursus getFormationCursus(int idFormationCursus) {
		
		return DaoFormationCursus.getFormationCursus(idFormationCursus);
	}
	
	public static List<FormationCursus> getListFormationCursus() {
		
		return DaoFormationCursus.getListFormationCursus();
	}
	
	
	public static void AddFormationCursus(FormationCursus formationCursus) {

		DaoFormationCursus.AddFormationCursus(formationCursus);
		
	}
	
	public static void EditFormationCursus(FormationCursus formationCursus) {
		DaoFormationCursus.EditFormationCursus(formationCursus);
	}
	
	
	public static List<FormationCursus> getListFormationCursusByIdCursus(int idCursus)
	{		
		return DaoFormationCursus.getListFormationCursusByIdCursus(idCursus);
	}
	
	
	public static List<Integer> getListOrdreByIdCursus(int idCursus) {
		return DaoFormationCursus.getListFormationOrdreByIdCursus(idCursus);
	}
	
	public static FormationCursus GetFormationCursusByOrdre(int idCursus, int ordre) {
		return DaoFormationCursus.GetFormationCursusByOrdre(idCursus, ordre);
		
	}
	
	public static void AjoutFormationFromCursus(FormationCursus formationCursus) {
		DaoFormationCursus.AjoutFormationFromCursus(formationCursus);
	}
	
}
