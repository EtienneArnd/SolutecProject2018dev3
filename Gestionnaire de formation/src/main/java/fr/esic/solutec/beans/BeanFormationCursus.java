package fr.esic.solutec.beans;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import org.primefaces.context.RequestContext;

import fr.esic.solutec.dto.DtoFormationCursus;
import fr.esic.solutec.entities.FormationCursus;


@ManagedBean(name = "beanFormationCursus")
@SessionScoped
public class BeanFormationCursus {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<FormationCursus> listFormationCursus;
	private List<FormationCursus> listFormationByCursus;

	private FormationCursus formationCursus = new FormationCursus();
	private FormationCursus formationCursus_modif = new FormationCursus();
			
	public FormationCursus getFormationCursus_modif() {
		return formationCursus_modif;
	}

	public void setFormationCursus_modif(FormationCursus formationCursus_modif) {
		this.formationCursus_modif = formationCursus_modif;
	}

	public FormationCursus getFormationCursus() {
		return formationCursus;
	}

	public void setFormationCursus(FormationCursus formationCursus) {
		this.formationCursus = formationCursus;
	}



	public List<FormationCursus> getListFormationCursus() {
		listFormationCursus = DtoFormationCursus.getListFormationCursus();
		return listFormationCursus; //Pas besoin de / et de .xhtml
	}
	
	
	private void init() {
		formationCursus = new FormationCursus();
		formationCursus_modif = new FormationCursus();
	}

	
	public void ValiderInfos() {

		//DtoFormationCursus.AddFormationCursus(formationCursus);
		init();
	}
	
	public void setListFormationCursus(List<FormationCursus> listFormationCursus) {
		this.listFormationCursus = listFormationCursus;
	}

	
	public List<FormationCursus> getListFormationByCursus() {
		return listFormationByCursus;
	}

	public void setListFormationByCursus(List<FormationCursus> listFormationByCursus) {
		this.listFormationByCursus = listFormationByCursus;
	}

	public void fenetreModifierFormationCursus() {
		Map<String,String> par_map = new HashMap<String,String>();
		par_map=FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
		String id=par_map.get("id");
		init();
		listFormationByCursus = DtoFormationCursus.getListFormationCursusByIdCursus(Integer.parseInt(id));
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlg2').show();");
	}
	
	public void modifierFormationCursus() {
	//	DtoFormationCursus.EditFormationCursus(formationCursus_modif);
	}
	
	public void supprimerFormationCursus(){
		
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
