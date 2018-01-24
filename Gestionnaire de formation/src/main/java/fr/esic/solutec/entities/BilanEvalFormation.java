package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the bilan_eval_formation database table.
 * 
 */
@Entity
@Table(name="bilan_eval_formation")
@NamedQuery(name="BilanEvalFormation.findAll", query="SELECT b FROM BilanEvalFormation b")
public class BilanEvalFormation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_bilan_eval_formation")
	private int idBilanEvalFormation;

	@Column(name="adaptation_exercices_profession")
	private int adaptationExercicesProfession;

	@Column(name="contenu_adapte")
	private int contenuAdapte;

	@Column(name="formation_niveau_groupe_homogene")
	private int formationNiveauGroupeHomogene;

	@Column(name="frequence_exercices")
	private int frequenceExercices;

	@Column(name="info_contenu")
	private int infoContenu;

	@Column(name="stage_correspondant_besoin")
	private int stageCorrespondantBesoin;

	//uni-directional many-to-one association to BilanFormation
	@ManyToOne
	@JoinColumn(name="id_bilan_formation")
	private BilanFormation bilanFormation;

	public BilanEvalFormation() {
	}

	public int getIdBilanEvalFormation() {
		return this.idBilanEvalFormation;
	}

	public void setIdBilanEvalFormation(int idBilanEvalFormation) {
		this.idBilanEvalFormation = idBilanEvalFormation;
	}

	public int getAdaptationExercicesProfession() {
		return this.adaptationExercicesProfession;
	}

	public void setAdaptationExercicesProfession(int adaptationExercicesProfession) {
		this.adaptationExercicesProfession = adaptationExercicesProfession;
	}

	public int getContenuAdapte() {
		return this.contenuAdapte;
	}

	public void setContenuAdapte(int contenuAdapte) {
		this.contenuAdapte = contenuAdapte;
	}

	public int getFormationNiveauGroupeHomogene() {
		return this.formationNiveauGroupeHomogene;
	}

	public void setFormationNiveauGroupeHomogene(int formationNiveauGroupeHomogene) {
		this.formationNiveauGroupeHomogene = formationNiveauGroupeHomogene;
	}

	public int getFrequenceExercices() {
		return this.frequenceExercices;
	}

	public void setFrequenceExercices(int frequenceExercices) {
		this.frequenceExercices = frequenceExercices;
	}

	public int getInfoContenu() {
		return this.infoContenu;
	}

	public void setInfoContenu(int infoContenu) {
		this.infoContenu = infoContenu;
	}

	public int getStageCorrespondantBesoin() {
		return this.stageCorrespondantBesoin;
	}

	public void setStageCorrespondantBesoin(int stageCorrespondantBesoin) {
		this.stageCorrespondantBesoin = stageCorrespondantBesoin;
	}

	public BilanFormation getBilanFormation() {
		return this.bilanFormation;
	}

	public void setBilanFormation(BilanFormation bilanFormation) {
		this.bilanFormation = bilanFormation;
	}

}