package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the bilan_pointvue_formateur database table.
 * 
 */
@Entity
@Table(name="bilan_pointvue_formateur")
@NamedQuery(name="BilanPointvueFormateur.findAll", query="SELECT b FROM BilanPointvueFormateur b")
public class BilanPointvueFormateur implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_bilan_pointvue_formateur")
	private int idBilanPointvueFormateur;

	@Column(name="integration_notions")
	private int integrationNotions;

	@Lob
	private String observations;

	private int prerequis;

	@Column(name="qualite_ecoute")
	private int qualiteEcoute;

	@Column(name="stage_correspond_besoin")
	private int stageCorrespondBesoin;

	//uni-directional many-to-one association to BilanFormation
	@ManyToOne
	@JoinColumn(name="id_bilan_formation")
	private BilanFormation bilanFormation;

	public BilanPointvueFormateur() {
	}

	public int getIdBilanPointvueFormateur() {
		return this.idBilanPointvueFormateur;
	}

	public void setIdBilanPointvueFormateur(int idBilanPointvueFormateur) {
		this.idBilanPointvueFormateur = idBilanPointvueFormateur;
	}

	public int getIntegrationNotions() {
		return this.integrationNotions;
	}

	public void setIntegrationNotions(int integrationNotions) {
		this.integrationNotions = integrationNotions;
	}

	public String getObservations() {
		return this.observations;
	}

	public void setObservations(String observations) {
		this.observations = observations;
	}

	public int getPrerequis() {
		return this.prerequis;
	}

	public void setPrerequis(int prerequis) {
		this.prerequis = prerequis;
	}

	public int getQualiteEcoute() {
		return this.qualiteEcoute;
	}

	public void setQualiteEcoute(int qualiteEcoute) {
		this.qualiteEcoute = qualiteEcoute;
	}

	public int getStageCorrespondBesoin() {
		return this.stageCorrespondBesoin;
	}

	public void setStageCorrespondBesoin(int stageCorrespondBesoin) {
		this.stageCorrespondBesoin = stageCorrespondBesoin;
	}

	public BilanFormation getBilanFormation() {
		return this.bilanFormation;
	}

	public void setBilanFormation(BilanFormation bilanFormation) {
		this.bilanFormation = bilanFormation;
	}

}