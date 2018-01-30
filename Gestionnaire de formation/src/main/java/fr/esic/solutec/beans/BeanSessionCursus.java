package fr.esic.solutec.beans;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import org.primefaces.context.RequestContext;
import org.primefaces.event.SelectEvent;

import fr.esic.solutec.dto.DtoFormationCursus;
import fr.esic.solutec.dto.DtoSessionCursus;
import fr.esic.solutec.dto.DtoSessionFormation;
import fr.esic.solutec.entities.SessionCursus;
import fr.esic.solutec.entities.SessionFormation;


@ManagedBean(name = "beanSessionCursus")
@SessionScoped
public class BeanSessionCursus implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<SessionCursus> listSessionCursus;
	private List<SessionFormation> listSessionFormationsSessionCursus;
	private int[] listDuree;
	private String dateLimit = "";
	

	
	public String getDateLimit() {
		return dateLimit;
	}

	public void setDateLimit(String dateLimit) {
		this.dateLimit = dateLimit;
	}

	private SessionCursus sessionCursus = new SessionCursus();
	private SessionCursus sessionCursus_modif = new SessionCursus();
	private SessionFormation sessionFormation_modif = new SessionFormation();
			

	public int[] getListDuree(){
		listDuree = new int[] {1,2,3,4,5,6,7,8,9,10};
		return listDuree;
	}
	
	public SessionCursus getSessionCursus_modif() {
		return sessionCursus_modif;
	}

	public void setSessionCursus_modif(SessionCursus sessionCursus_modif) {
		this.sessionCursus_modif = sessionCursus_modif;
	}

	public SessionCursus getSessionCursus() {
		return sessionCursus;
	}

	public void setSessionCursus(SessionCursus sessionCursus) {
		this.sessionCursus = sessionCursus;
	}
	
	

	public SessionFormation getSessionFormation_modif() {
		return sessionFormation_modif;
	}

	public void setSessionFormation_modif(SessionFormation sessionFormation_modif) {
		this.sessionFormation_modif = sessionFormation_modif;
	}

	public String toPageSessionsCursus() {
		return "sessionCursus"; //Pas besoin de / et de .xhtml
	}
	
//	public String[] getListNiveaux() {
//		return DtoCursus.getListNiveaux(); //Pas besoin de / et de .xhtml
//	}
	
	public List<SessionCursus> getListSessionCursus() {
		listSessionCursus = DtoSessionCursus.getListSessionCursus();
		return listSessionCursus; //Pas besoin de / et de .xhtml
	}
	
	
	private void init() {
		sessionCursus = new SessionCursus();
		sessionCursus_modif = new SessionCursus();
		sessionFormation_modif = new SessionFormation();
	}

	
	public void ValiderInfos() {
		DtoSessionCursus.AddSessionCursus(sessionCursus);
		init();
	}
	
	
	public void setListSessionCursus(List<SessionCursus> listSessionCursus) {
		this.listSessionCursus = listSessionCursus;
	}
	
	public void calenderChangeListener(SelectEvent event) {
		
		Date date = (Date)event.getObject();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yy");
		dateLimit = dateFormat.format(date);
	}
	
	public List<SessionFormation> getListSessionFormationsSessionCursus() {
		return listSessionFormationsSessionCursus;
	}

	public void setListSessionFormationsSessionCursus(List<SessionFormation> listSessionFormationsSessionCursus) {
		this.listSessionFormationsSessionCursus = listSessionFormationsSessionCursus;
	}

	public void fenetreModifierSessionCursus() {
		Map<String,String> par_map = new HashMap<String,String>();
		par_map=FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
		String id=par_map.get("id");
		init();
		listSessionFormationsSessionCursus = DtoSessionCursus.getListSessionFormationSessionCursus(Integer.parseInt(id));
		sessionCursus_modif = DtoSessionCursus.getSessionCursus(Integer.parseInt(id));
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlg2').show();");
	}
	
	public void fenetreModifierSessionFormation() {
		Map<String,String> par_map = new HashMap<String,String>();
		par_map=FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
		String idSessionFormation=par_map.get("idSessionFormation");
		//init();
		sessionFormation_modif = DtoSessionFormation.getSessionFormation(Integer.parseInt(idSessionFormation));
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlg3').show();");
	}
	
//	public String[] getListType() {
//		return DtoSessionCursus.getListType(); //Pas besoin de / et de .xhtml
//	}
	
	public void modifierSessionCursus() {
		DtoSessionCursus.EditSessionCursus(sessionCursus_modif);
	}
	
	public void supprimerSessionCursus(){
		
	}
	
	public void annulerFenetreMofifierSessionFormation() {
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlg3').hide();");
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