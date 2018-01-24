package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the formateur database table.
 * 
 */
@Entity
@NamedQuery(name="Formateur.findAll", query="SELECT f FROM Formateur f")
public class Formateur implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_formateur")
	private int idFormateur;

	private String adresse;

	private String civilite;

	private BigDecimal cout;

	@Temporal(TemporalType.DATE)
	@Column(name="date_naissance")
	private Date dateNaissance;

	private String mail;

	private String nom;

	private String prenom;

	private String statut;

	private String telephone;

	//uni-directional many-to-one association to Identificateur
	@ManyToOne
	@JoinColumn(name="id_identificateur")
	private Identificateur identificateur;

	//uni-directional many-to-one association to Societe
	@ManyToOne
	@JoinColumn(name="id_societe")
	private Societe societe;

	//uni-directional many-to-one association to Ville
	@ManyToOne
	@JoinColumn(name="id_ville")
	private Ville ville;

	public Formateur() {
	}

	public int getIdFormateur() {
		return this.idFormateur;
	}

	public void setIdFormateur(int idFormateur) {
		this.idFormateur = idFormateur;
	}

	public String getAdresse() {
		return this.adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getCivilite() {
		return this.civilite;
	}

	public void setCivilite(String civilite) {
		this.civilite = civilite;
	}

	public BigDecimal getCout() {
		return this.cout;
	}

	public void setCout(BigDecimal cout) {
		this.cout = cout;
	}

	public Date getDateNaissance() {
		return this.dateNaissance;
	}

	public void setDateNaissance(Date dateNaissance) {
		this.dateNaissance = dateNaissance;
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

	public String getStatut() {
		return this.statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
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

	public Societe getSociete() {
		return this.societe;
	}

	public void setSociete(Societe societe) {
		this.societe = societe;
	}

	public Ville getVille() {
		return this.ville;
	}

	public void setVille(Ville ville) {
		this.ville = ville;
	}

}