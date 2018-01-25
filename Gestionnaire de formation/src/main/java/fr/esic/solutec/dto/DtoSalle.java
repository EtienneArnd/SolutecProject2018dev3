package fr.esic.solutec.dto;

import java.util.List;


import fr.esic.solutec.dao.DaoSalle;
import fr.esic.solutec.entities.Salle;

public class DtoSalle {

	
	public static Salle getSalle(int idSalle) {
		
		return DaoSalle.getSalle(idSalle);
	}
	
	public static List<Salle> getListSalle() {
		
		return DaoSalle.getListSalle();
	}
	
	
	
	
}
