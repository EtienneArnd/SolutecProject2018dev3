package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the formateur_session_formation database table.
 * 
 */
@Entity
@Table(name="formateur_session_formation")
@NamedQuery(name="FormateurSessionFormation.findAll", query="SELECT f FROM FormateurSessionFormation f")
public class FormateurSessionFormation implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private FormateurSessionFormationPK id;

	@Temporal(TemporalType.DATE)
	@Column(name="date_debut")
	private Date dateDebut;

	private int duree;

	private BigDecimal frais;

	private BigDecimal tarif;

	//uni-directional many-to-one association to Formateur
	@ManyToOne
	@JoinColumn(name="id_formateur")
	private Formateur formateur;

	//uni-directional many-to-one association to SessionFormation
	@ManyToOne
	@JoinColumn(name="id_session_formation")
	private SessionFormation sessionFormation;

	public FormateurSessionFormation() {
	}

	public FormateurSessionFormationPK getId() {
		return this.id;
	}

	public void setId(FormateurSessionFormationPK id) {
		this.id = id;
	}

	public Date getDateDebut() {
		return this.dateDebut;
	}

	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}

	public int getDuree() {
		return this.duree;
	}

	public void setDuree(int duree) {
		this.duree = duree;
	}

	public BigDecimal getFrais() {
		return this.frais;
	}

	public void setFrais(BigDecimal frais) {
		this.frais = frais;
	}

	public BigDecimal getTarif() {
		return this.tarif;
	}

	public void setTarif(BigDecimal tarif) {
		this.tarif = tarif;
	}

	public Formateur getFormateur() {
		return this.formateur;
	}

	public void setFormateur(Formateur formateur) {
		this.formateur = formateur;
	}

	public SessionFormation getSessionFormation() {
		return this.sessionFormation;
	}

	public void setSessionFormation(SessionFormation sessionFormation) {
		this.sessionFormation = sessionFormation;
	}

}