package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the bilan_eval_formateur database table.
 * 
 */
@Entity
@Table(name="bilan_eval_formateur")
@NamedQuery(name="BilanEvalFormateur.findAll", query="SELECT b FROM BilanEvalFormateur b")
public class BilanEvalFormateur implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_bilan_formateur")
	private int idBilanFormateur;

	private int annimation;

	private int disponibilite;

	@Column(name="maitrise_sujet")
	private int maitriseSujet;

	@Column(name="qualites_pedagogiques")
	private int qualitesPedagogiques;

	//uni-directional many-to-one association to BilanFormation
	@ManyToOne
	@JoinColumn(name="id_bilan_formation")
	private BilanFormation bilanFormation;

	public BilanEvalFormateur() {
	}

	public int getIdBilanFormateur() {
		return this.idBilanFormateur;
	}

	public void setIdBilanFormateur(int idBilanFormateur) {
		this.idBilanFormateur = idBilanFormateur;
	}

	public int getAnnimation() {
		return this.annimation;
	}

	public void setAnnimation(int annimation) {
		this.annimation = annimation;
	}

	public int getDisponibilite() {
		return this.disponibilite;
	}

	public void setDisponibilite(int disponibilite) {
		this.disponibilite = disponibilite;
	}

	public int getMaitriseSujet() {
		return this.maitriseSujet;
	}

	public void setMaitriseSujet(int maitriseSujet) {
		this.maitriseSujet = maitriseSujet;
	}

	public int getQualitesPedagogiques() {
		return this.qualitesPedagogiques;
	}

	public void setQualitesPedagogiques(int qualitesPedagogiques) {
		this.qualitesPedagogiques = qualitesPedagogiques;
	}

	public BilanFormation getBilanFormation() {
		return this.bilanFormation;
	}

	public void setBilanFormation(BilanFormation bilanFormation) {
		this.bilanFormation = bilanFormation;
	}

}