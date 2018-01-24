package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the stagiaire_session_formation database table.
 * 
 */
@Entity
@Table(name="stagiaire_session_formation")
@NamedQuery(name="StagiaireSessionFormation.findAll", query="SELECT s FROM StagiaireSessionFormation s")
public class StagiaireSessionFormation implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private StagiaireSessionFormationPK id;

	private BigDecimal tarif;

	//uni-directional many-to-one association to SessionFormation
	@ManyToOne
	@JoinColumn(name="id_session_formation")
	private SessionFormation sessionFormation;

	//uni-directional many-to-one association to Stagiaire
	@ManyToOne
	@JoinColumn(name="id_stagiaire")
	private Stagiaire stagiaire;

	public StagiaireSessionFormation() {
	}

	public StagiaireSessionFormationPK getId() {
		return this.id;
	}

	public void setId(StagiaireSessionFormationPK id) {
		this.id = id;
	}

	public BigDecimal getTarif() {
		return this.tarif;
	}

	public void setTarif(BigDecimal tarif) {
		this.tarif = tarif;
	}

	public SessionFormation getSessionFormation() {
		return this.sessionFormation;
	}

	public void setSessionFormation(SessionFormation sessionFormation) {
		this.sessionFormation = sessionFormation;
	}

	public Stagiaire getStagiaire() {
		return this.stagiaire;
	}

	public void setStagiaire(Stagiaire stagiaire) {
		this.stagiaire = stagiaire;
	}

}