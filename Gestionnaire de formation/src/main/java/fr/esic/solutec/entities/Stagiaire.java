package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the stagiaire database table.
 * 
 */
@Entity
@NamedQuery(name="Stagiaire.findAll", query="SELECT s FROM Stagiaire s")
public class Stagiaire implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_stagiaire")
	private int idStagiaire;

	private String civilite;

	@Temporal(TemporalType.DATE)
	@Column(name="date_naissance")
	private Date dateNaissance;

	private String mail;

	private String nom;

	private String prenom;

	private String telephone;

	//uni-directional many-to-one association to Identificateur
	@ManyToOne
	@JoinColumn(name="id_identificateur")
	private Identificateur identificateur;

	//uni-directional many-to-one association to Societe
	@ManyToOne
	@JoinColumn(name="id_societe")
	private Societe societe;

	//uni-directional many-to-many association to SessionCursus
	@ManyToMany
	@JoinTable(
		name="stagiaire_session_cursus"
		, joinColumns={
			@JoinColumn(name="id_stagiaire")
			}
		, inverseJoinColumns={
			@JoinColumn(name="id_session_cursus")
			}
		)
	private List<SessionCursus> sessionCursuses;

	public Stagiaire() {
	}

	public int getIdStagiaire() {
		return this.idStagiaire;
	}

	public void setIdStagiaire(int idStagiaire) {
		this.idStagiaire = idStagiaire;
	}

	public String getCivilite() {
		return this.civilite;
	}

	public void setCivilite(String civilite) {
		this.civilite = civilite;
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

	public List<SessionCursus> getSessionCursuses() {
		return this.sessionCursuses;
	}

	public void setSessionCursuses(List<SessionCursus> sessionCursuses) {
		this.sessionCursuses = sessionCursuses;
	}

}