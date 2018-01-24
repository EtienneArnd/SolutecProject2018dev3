package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the salle database table.
 * 
 */
@Entity
@NamedQuery(name="Salle.findAll", query="SELECT s FROM Salle s")
public class Salle implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_salle")
	private int idSalle;

	private int capacite;

	private String nom;

	//uni-directional many-to-one association to Site
	@ManyToOne
	@JoinColumn(name="id_site")
	private Site site;

	public Salle() {
	}

	public int getIdSalle() {
		return this.idSalle;
	}

	public void setIdSalle(int idSalle) {
		this.idSalle = idSalle;
	}

	public int getCapacite() {
		return this.capacite;
	}

	public void setCapacite(int capacite) {
		this.capacite = capacite;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Site getSite() {
		return this.site;
	}

	public void setSite(Site site) {
		this.site = site;
	}

}