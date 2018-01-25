package fr.esic.solutec.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import fr.esic.solutec.dto.DtoCursus;
import fr.esic.solutec.entities.Cursus;



@ManagedBean(name = "beanCursus")
@SessionScoped
public class BeanCursus implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Cursus> listCursus;

	
	/*public String toPageCursus() {
		
		
		//System.out.println(listClients);
		return "formation"; //Pas besoin de / et de .xhtml
	}*/
	

	public List<Cursus> getListCursus() {
		
		listCursus = new ArrayList<Cursus>();
		listCursus = DtoCursus.getListCursus();

		
		return listCursus; //Pas besoin de / et de .xhtml
	}

	
	
	public void setListCursus(List<Cursus> listCursus) {
		this.listCursus = listCursus;
	}
}
