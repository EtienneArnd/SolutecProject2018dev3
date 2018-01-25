package fr.esic.solutec.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import fr.esic.solutec.dto.DtoSessionCursus;
import fr.esic.solutec.entities.SessionCursus;



@ManagedBean(name = "beanSessionCursus")
@SessionScoped
public class BeanSessionCursus implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<SessionCursus> listSessionCursus;

	
	/*public String toPageSessionCursus() {
		
		
		//System.out.println(listClients);
		return "formation"; //Pas besoin de / et de .xhtml
	}*/
	

	public List<SessionCursus> getListSessionCursus() {
		
		listSessionCursus = new ArrayList<SessionCursus>();
		listSessionCursus = DtoSessionCursus.getListSessionCursus();

		
		return listSessionCursus; //Pas besoin de / et de .xhtml
	}

	
	
	public void setListSessionCursus(List<SessionCursus> listSessionCursus) {
		this.listSessionCursus = listSessionCursus;
	}
}
