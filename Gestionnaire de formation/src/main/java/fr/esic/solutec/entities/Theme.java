package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the theme database table.
 * 
 */
@Entity
@NamedQueries({
	@NamedQuery(name="Theme.findAll", query="SELECT a FROM Theme a")//,
	//@NamedQuery(name="Theme.add", query="INSERT INTO Formation VALUES  a")
})
public class Theme implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_theme")
	private int idTheme;

	private String nom;

	//uni-directional many-to-one association to Categorie
	@ManyToOne
	@JoinColumn(name="id_categorie")
	private Categorie categorie;

	public Theme() {
	}

	public int getIdTheme() {
		return this.idTheme;
	}

	public void setIdTheme(int idTheme) {
		this.idTheme = idTheme;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Categorie getCategorie() {
		return this.categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

	@Override
	public String toString() {
		return "Theme [idTheme=" + idTheme + ", nom=" + nom + ", categorie=" + categorie + "]";
	}

	
	
}