package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the personnel database table.
 * 
 */
@Entity
@NamedQuery(name="Personnel.findAll", query="SELECT p FROM Personnel p")
public class Personnel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_personnel")
	private int idPersonnel;

	private String civilite;

	private String mail;

	private String nom;

	private String prenom;

	private String telephone;

	//uni-directional many-to-one association to Identificateur
	@ManyToOne
	@JoinColumn(name="id_identificateur")
	private Identificateur identificateur;

	public Personnel() {
	}

	public int getIdPersonnel() {
		return this.idPersonnel;
	}

	public void setIdPersonnel(int idPersonnel) {
		this.idPersonnel = idPersonnel;
	}

	public String getCivilite() {
		return this.civilite;
	}

	public void setCivilite(String civilite) {
		this.civilite = civilite;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return this.prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Identificateur getIdentificateur() {
		return this.identificateur;
	}

	public void setIdentificateur(Identificateur identificateur) {
		this.identificateur = identificateur;
	}

}