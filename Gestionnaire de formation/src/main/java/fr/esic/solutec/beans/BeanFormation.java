package fr.esic.solutec.beans;

import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlDataTable;

import fr.esic.solutec.dao.DaoFormation;
import fr.esic.solutec.dto.DtoFormation;
import fr.esic.solutec.entities.Formation;


@ManagedBean(name = "beanFormation")
@SessionScoped
public class BeanFormation implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Formation> listFormation;
	private HtmlDataTable tableFormation;

	
	public HtmlDataTable getTableFormation() {
		return tableFormation;
	}

	public void setTableFormation(HtmlDataTable tableFormation) {
		this.tableFormation = tableFormation;
	}

	private Formation formation = new Formation();
			

	
	
	public Formation getFormation() {
		return formation;
	}

	public void setFormation(Formation formation) {
		this.formation = formation;
	}

	public String toPageFormations() {
		return "formation"; //Pas besoin de / et de .xhtml
	}
	
	public String[] getListNiveaux() {
		return DtoFormation.getListNiveaux(); //Pas besoin de / et de .xhtml
	}
	
	public List<Formation> getListFormation() {
		listFormation = DtoFormation.getListFormation();
		return listFormation; //Pas besoin de / et de .xhtml
	}
	
	
	private void init() {
		formation = new Formation();
	}

	
	public void ValiderInfos() {

		DaoFormation.AddFormation(formation);
		init();
	}
	
	public void setListFormation(List<Formation> listFormation) {
		this.listFormation = listFormation;
	}

}
