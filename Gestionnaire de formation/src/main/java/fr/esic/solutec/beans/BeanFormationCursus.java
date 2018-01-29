package fr.esic.solutec.beans;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import org.primefaces.context.RequestContext;

import fr.esic.solutec.dto.DtoCursus;
import fr.esic.solutec.dto.DtoFormation;
import fr.esic.solutec.dto.DtoFormationCursus;
import fr.esic.solutec.entities.Cursus;
import fr.esic.solutec.entities.Formation;
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
	
	private List<Integer> listOrdre;

	private FormationCursus formationCursus = new FormationCursus();
	private FormationCursus formationCursus_modif = new FormationCursus();
	private Cursus cursus_modif = new Cursus();
	private Formation formation_modif = new Formation();
	
	private int ordreInitial;
			
	public Formation getFormation_modif() {
		return formation_modif;
	}

	public void setFormation_modif(Formation formation_modif) {
		this.formation_modif = formation_modif;
	}

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

	private void initBis() {
		cursus_modif = new Cursus();
		formation_modif = new Formation();
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
		listFormationByCursus = DtoFormationCursus.getListFormationCursusByIdCursus(Integer.parseInt(id));
		cursus_modif = DtoCursus.getCursus(Integer.parseInt(id));
		listOrdre = DtoFormationCursus.getListOrdreByIdCursus(cursus_modif.getIdCursus());
		listOrdre.add(listOrdre.size()+1);
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlg2').show();");
	}
	
	public Cursus getCursus_modif() {
		return cursus_modif;
	}

	public void setCursus_modif(Cursus cursus_modif) {
		this.cursus_modif = cursus_modif;
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

	public List<Integer> getListOrdre() {
		return listOrdre;
	}

	public void setListOrdre(List<Integer> listOrdre) {
		this.listOrdre = listOrdre;
	}
	

	public void fenetreModifierOrdreFormationCursus() {
		Map<String,String> par_map = new HashMap<String,String>();
		par_map=FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
		String id=par_map.get("idFormation");
		String ordre=par_map.get("ordreFormation");
		ordreInitial = Integer.parseInt(ordre);
		listOrdre = DtoFormationCursus.getListOrdreByIdCursus(cursus_modif.getIdCursus());
		formation_modif = DtoFormation.getFormation(Integer.parseInt(id));
		formationCursus_modif.setOrdre(ordreInitial);
		formationCursus_modif.setFormation(formation_modif);
		formationCursus_modif.setCursus(cursus_modif);
		
		//System.out.println(formationCursus_modif.getFormation().getIntitule());
		//System.out.println(formationCursus_modif.getCursus().getNom());
		
		//System.out.println(id);
		//System.out.println(formation_modif.getIdFormation() + formation_modif.getIntitule());
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlg3').show();");
		
	}
	
	
	public void ValiderLeChangementOrdre() {
		


		
		int newOrdre = formationCursus_modif.getOrdre();

		
		System.out.println(ordreInitial);
		System.out.println(newOrdre);
		
		
		if(ordreInitial == newOrdre) {
			
		}else if(ordreInitial < newOrdre) {

			formationCursus_modif = DtoFormationCursus.GetFormationCursusByOrdre(cursus_modif.getIdCursus(), ordreInitial);
			formationCursus_modif.setOrdre(0);
			DtoFormationCursus.EditFormationCursus(formationCursus_modif);
			
			for(int i = ordreInitial+1; i<=newOrdre; i++) {
			
				formationCursus_modif = DtoFormationCursus.GetFormationCursusByOrdre(cursus_modif.getIdCursus(), i);
				
				formationCursus_modif.setOrdre(i-1);
				
				DtoFormationCursus.EditFormationCursus(formationCursus_modif);
				
			}
			
			formationCursus_modif = DtoFormationCursus.GetFormationCursusByOrdre(cursus_modif.getIdCursus(), 0);
			formationCursus_modif.setOrdre(newOrdre);
			DtoFormationCursus.EditFormationCursus(formationCursus_modif);
			
		}else {
			
			formationCursus_modif = DtoFormationCursus.GetFormationCursusByOrdre(cursus_modif.getIdCursus(), ordreInitial);
			formationCursus_modif.setOrdre(0);
			DtoFormationCursus.EditFormationCursus(formationCursus_modif);
			
			for(int i = ordreInitial-1; i>=newOrdre; i--) {
			
				formationCursus_modif = DtoFormationCursus.GetFormationCursusByOrdre(cursus_modif.getIdCursus(), i);
				
				formationCursus_modif.setOrdre(i+1);
				
				DtoFormationCursus.EditFormationCursus(formationCursus_modif);
				
			}
			
			formationCursus_modif = DtoFormationCursus.GetFormationCursusByOrdre(cursus_modif.getIdCursus(), 0);
			formationCursus_modif.setOrdre(newOrdre);
			DtoFormationCursus.EditFormationCursus(formationCursus_modif);
		
		}
		}
		
		
	public void ValiderAjoutFormation() {
		FormationCursus formationCursus_local =new FormationCursus();
		formationCursus_modif.setCursus(cursus_modif);
		//formationCursus_modif.setFormation(formationCursus_modif.getFormation());
		//formationCursus_modif.setOrdre(formationCursus_modif.getOrdre());
		formationCursus_local = formationCursus_modif;
		System.out.println(formationCursus_modif.getCursus().getNom());
		System.out.println(formationCursus_modif.getFormation().getIntitule());
		System.out.println(formationCursus_modif.getOrdre());
		
		if(listFormationByCursus.size()+1 != formationCursus_local.getOrdre() ) {
			
		
		
		for(int i = listFormationByCursus.size(); i>=formationCursus_local.getOrdre(); i--) {
			
			FormationCursus formationCursus_modif2 = DtoFormationCursus.GetFormationCursusByOrdre(cursus_modif.getIdCursus(), i);
			formationCursus_modif2.setOrdre(i+1);
			DtoFormationCursus.EditFormationCursus(formationCursus_modif2);
			
		}
		
		}
		
		DtoFormationCursus.AjoutFormationFromCursus(formationCursus_local);
		init();
		
	}
	
	
}
