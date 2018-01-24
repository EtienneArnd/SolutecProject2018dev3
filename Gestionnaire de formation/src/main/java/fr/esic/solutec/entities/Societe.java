package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the societe database table.
 * 
 */
@Entity
@NamedQuery(name="Societe.findAll", query="SELECT s FROM Societe s")
public class Societe implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_societe")
	private int idSociete;

	private String adresse;

	@Column(name="complement_nom")
	private String complementNom;

	private String mail;

	private String nom;

	private String telephone;

	//uni-directional many-to-one association to Ville
	@ManyToOne
	@JoinColumn(name="id_ville")
	private Ville ville;

	public Societe() {
	}

	public int getIdSociete() {
		return this.idSociete;
	}

	public void setIdSociete(int idSociete) {
		this.idSociete = idSociete;
	}

	public String getAdresse() {
		return this.adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getComplementNom() {
		return this.complementNom;
	}

	public void setComplementNom(String complementNom) {
		this.complementNom = complementNom;
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

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Ville getVille() {
		return this.ville;
	}

	public void setVille(Ville ville) {
		this.ville = ville;
	}

}