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
import fr.esic.solutec.dto.DtoSessionFormation;
import fr.esic.solutec.entities.Formation;
import fr.esic.solutec.entities.SessionFormation;


@ManagedBean(name = "beanSessionFormation")
@SessionScoped
public class BeanSessionFormation implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<SessionFormation> listSessionFormation;
	private HtmlDataTable tableSessionFormation;
	private int[] listDuree;

	
	public HtmlDataTable getTableSessionFormation() {
		return tableSessionFormation;
	}

	public void setTableSessionFormation(HtmlDataTable tableSessionFormation) {
		this.tableSessionFormation = tableSessionFormation;
	}

	private SessionFormation sessionFormation = new SessionFormation();
	private SessionFormation sessionFormation_modif = new SessionFormation();
			

	public int[] getListDuree(){
		listDuree = new int[] {1,2,3,4,5,6,7,8,9,10};
		return listDuree;
	}
	
	public SessionFormation getSessionFormation_modif() {
		return sessionFormation_modif;
	}

	public void setSessionFormation_modif(SessionFormation sessionFormation_modif) {
		this.sessionFormation_modif = sessionFormation_modif;
	}

	public SessionFormation getSessionFormation() {
		return sessionFormation;
	}

	public void setSessionFormation(SessionFormation sessionFormation) {
		this.sessionFormation = sessionFormation;
	}

	public String toPageSessionsFormation() {
		return "sesionFormation"; //Pas besoin de / et de .xhtml
	}
	
//	public String[] getListNiveaux() {
//		return DtoFormation.getListNiveaux(); //Pas besoin de / et de .xhtml
//	}
	
	public List<SessionFormation> getListSessionFormation() {
		listSessionFormation = DtoSessionFormation.getListSessionFormation();
		return listSessionFormation; //Pas besoin de / et de .xhtml
	}
	
	
	private void init() {
		sessionFormation = new SessionFormation();
		sessionFormation_modif = new SessionFormation();
	}

	
	public void ValiderInfos() {

		DtoSessionFormation.AddSessionFormation(sessionFormation);
		init();
	}
	
	public void setListSessionFormation(List<SessionFormation> listSessionFormation) {
		this.listSessionFormation = listSessionFormation;
	}

	
	public void fenetreModifierSessionFormation() {
		Map<String,String> par_map = new HashMap<String,String>();
		par_map=FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
		String id=par_map.get("id");
		init();
		sessionFormation_modif = DtoSessionFormation.getSessionFormation(Integer.parseInt(id));
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlg2').show();");
	}
	
	public void modifierSessionFormation() {
		DtoSessionFormation.EditSessionFormation(sessionFormation_modif);
	}
	
	public void supprimerSessionFormation(){
		
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
