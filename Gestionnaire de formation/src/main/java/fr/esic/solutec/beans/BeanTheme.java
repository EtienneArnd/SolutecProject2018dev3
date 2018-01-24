package fr.esic.solutec.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import fr.esic.solutec.dto.DtoTheme;
import fr.esic.solutec.entities.Theme;



@ManagedBean(name = "beanTheme")
@SessionScoped
public class BeanTheme implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Theme> listTheme;

	
	/*public String toPageTheme() {
		
		
		//System.out.println(listClients);
		return "formation"; //Pas besoin de / et de .xhtml
	}*/
	

	public List<Theme> getListTheme() {
		
		listTheme = new ArrayList<Theme>();
		listTheme = DtoTheme.getListTheme();

		
		return listTheme; //Pas besoin de / et de .xhtml
	}

	
	public static Theme ConvertNomToTheme(String nom) {
	
		List<Theme> listThemeStatic = DtoTheme.getListTheme();
		
		for (Theme theme : listThemeStatic) {
			
			if(theme.getNom().equals(nom)) {
				return theme;
			}
		}
				
		return null;
	}
	
	public void setListTheme(List<Theme> listTheme) {
		this.listTheme = listTheme;
	}
}
