package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the theme_formateur database table.
 * 
 */
@Entity
@Table(name="theme_formateur")
@NamedQuery(name="ThemeFormateur.findAll", query="SELECT t FROM ThemeFormateur t")
public class ThemeFormateur implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private ThemeFormateurPK id;

	private String niveau;

	//uni-directional many-to-one association to Formateur
	@ManyToOne
	@JoinColumn(name="id_formateur")
	private Formateur formateur;

	//uni-directional many-to-one association to Theme
	@ManyToOne
	@JoinColumn(name="id_theme")
	private Theme theme;

	public ThemeFormateur() {
	}

	public ThemeFormateurPK getId() {
		return this.id;
	}

	public void setId(ThemeFormateurPK id) {
		this.id = id;
	}

	public String getNiveau() {
		return this.niveau;
	}

	public void setNiveau(String niveau) {
		this.niveau = niveau;
	}

	public Formateur getFormateur() {
		return this.formateur;
	}

	public void setFormateur(Formateur formateur) {
		this.formateur = formateur;
	}

	public Theme getTheme() {
		return this.theme;
	}

	public void setTheme(Theme theme) {
		this.theme = theme;
	}

}