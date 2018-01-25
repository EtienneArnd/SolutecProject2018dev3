package fr.esic.solutec.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import fr.esic.solutec.dto.DtoSalle;
import fr.esic.solutec.entities.Salle;



@ManagedBean(name = "beanSalle")
@SessionScoped
public class BeanSalle implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Salle> listSalle;

	
	/*public String toPageSalle() {
		
		
		//System.out.println(listClients);
		return "formation"; //Pas besoin de / et de .xhtml
	}*/
	

	public List<Salle> getListSalle() {
		
		listSalle = new ArrayList<Salle>();
		listSalle = DtoSalle.getListSalle();

		
		return listSalle; //Pas besoin de / et de .xhtml
	}

	
	
	public void setListSalle(List<Salle> listSalle) {
		this.listSalle = listSalle;
	}
}
