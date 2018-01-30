package fr.esic.solutec.dto;

import java.util.List;

import fr.esic.solutec.dao.DaoCursus;
import fr.esic.solutec.entities.Cursus;

public class DtoCursus {

	
	public static Cursus getCursus(int idCursus) {
		
		return DaoCursus.getCursus(idCursus);
	}
	
	public static List<Cursus> getListCursus() {
		
		return DaoCursus.getListCursus();
	}
	
	
	public static int AddCursus(Cursus cursus) {

		return DaoCursus.AddCursus(cursus);
	}
	
	public static void EditCursus(Cursus cursus) {
		DaoCursus.EditCursus(cursus);
	}
	
}
