package fr.esic.solutec.beans;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlDataTable;
import javax.faces.context.FacesContext;

import org.primefaces.context.RequestContext;

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
	private int[] listDuree;

	

	private Formation formation = new Formation();
	private Formation formation_modif = new Formation();
			

	public int[] getListDuree(){
		listDuree = new int[] {1,2,3,4,5,6,7,8,9,10};
		return listDuree;
	}
	
	public Formation getFormation_modif() {
		return formation_modif;
	}

	public void setFormation_modif(Formation formation_modif) {
		this.formation_modif = formation_modif;
	}

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
		formation_modif = new Formation();
	}

	
	public void ValiderInfos() {

		DtoFormation.AddFormation(formation);
		init();
	}
	
	public void setListFormation(List<Formation> listFormation) {
		this.listFormation = listFormation;
	}

	
	public void fenetreModifierFormation() {
		Map<String,String> par_map = new HashMap<String,String>();
		par_map=FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
		String id=par_map.get("id");
		init();
		formation_modif = DtoFormation.getFormation(Integer.parseInt(id));
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlg2').show();");
	}
	
	public void modifierFormation() {
		DtoFormation.EditFormation(formation_modif);
	}
	
	public void supprimerFormation(){
		
	}
	
	public void annulerFenetreMofifier() {
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlg2').hide();");
	}
	
	public void annulerFenetreAjouter() {
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlg1').hide();");
	}
}
