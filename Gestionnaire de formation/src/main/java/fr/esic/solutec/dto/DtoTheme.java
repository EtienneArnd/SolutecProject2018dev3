package fr.esic.solutec.dto;

import java.util.List;


import fr.esic.solutec.dao.DaoTheme;
import fr.esic.solutec.entities.Theme;

public class DtoTheme {

	
	public static Theme getTheme(int idTheme) {
		
		return DaoTheme.getTheme(idTheme);
	}
	
	public static List<Theme> getListTheme() {
		
		return DaoTheme.getListTheme();
	}
	
	
	
	
}
