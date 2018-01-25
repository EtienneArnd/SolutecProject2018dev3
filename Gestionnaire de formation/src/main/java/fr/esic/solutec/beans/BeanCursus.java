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

import fr.esic.solutec.dto.DtoCursus;
import fr.esic.solutec.entities.Cursus;

@ManagedBean(name = "beanCursus")
@SessionScoped
public class BeanCursus implements Serializable {

	private static final long serialVersionUID = 1L;
	private List<Cursus> listCursus;
	private HtmlDataTable tableCursus;

	public HtmlDataTable getTableCursus() {
		return tableCursus;
	}

	public void setTableCursus(HtmlDataTable tableCursus) {
		this.tableCursus = tableCursus;
	}

	private Cursus cursus = new Cursus();
	private Cursus cursus_modif = new Cursus();


	public Cursus getCursus_modif() {
		return cursus_modif;
	}

	public void setCursus_modif(Cursus cursus_modif) {
		this.cursus_modif = cursus_modif;
	}

	public Cursus getCursus() {
		return cursus;
	}

	public void setCursus(Cursus cursus) {
		this.cursus = cursus;
	}

	public String toPageCursus() {
		return "cursus"; // Pas besoin de / et de .xhtml
	}

	public List<Cursus> getListCursus() {
		listCursus = DtoCursus.getListCursus();
		return listCursus; // Pas besoin de / et de .xhtml
	}

	private void init() {
		cursus = new Cursus();
		cursus_modif = new Cursus();
	}

	public void ValiderInfos() {

		DtoCursus.AddCursus(cursus);
		init();
	}

	public void setListCursus(List<Cursus> listCursus) {
		this.listCursus = listCursus;
	}

	public void fenetreModifierCursus() {
		Map<String, String> par_map = new HashMap<String, String>();
		par_map = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
		String id = par_map.get("id");
		init();
		cursus_modif = DtoCursus.getCursus(Integer.parseInt(id));
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlg2').show();");
	}

	public void modifierCursus() {
		DtoCursus.EditCursus(cursus_modif);
	}

	public void supprimerCursus() {

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
