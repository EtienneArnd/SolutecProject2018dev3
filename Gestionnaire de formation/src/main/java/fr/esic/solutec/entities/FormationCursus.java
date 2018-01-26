package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the formation_cursus database table.
 * 
 */
@Entity
@Table(name="formation_cursus")
@NamedQueries({@NamedQuery(name="FormationCursus.findAll", query="SELECT f FROM FormationCursus f"),
@NamedQuery(name="FormationCursus.findByIdCursus", query="SELECT f FROM FormationCursus f WHERE f.cursus.idCursus = :idCursus")})
public class FormationCursus implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private FormationCursusPK id;

	private int ordre;

	//uni-directional many-to-one association to Cursus
	@ManyToOne
	@JoinColumn(name="id_cursus")
	private Cursus cursus;

	//uni-directional many-to-one association to Formation
	@ManyToOne
	@JoinColumn(name="id_formation")
	private Formation formation;

	public FormationCursus() {
	}

	public FormationCursusPK getId() {
		return this.id;
	}

	public void setId(FormationCursusPK id) {
		this.id = id;
	}

	public int getOrdre() {
		return this.ordre;
	}

	public void setOrdre(int ordre) {
		this.ordre = ordre;
	}

	public Cursus getCursus() {
		return this.cursus;
	}

	public void setCursus(Cursus cursus) {
		this.cursus = cursus;
	}

	public Formation getFormation() {
		return this.formation;
	}

	public void setFormation(Formation formation) {
		this.formation = formation;
	}

}