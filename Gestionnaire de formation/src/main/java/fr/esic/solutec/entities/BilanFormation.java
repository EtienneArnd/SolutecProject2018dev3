package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the bilan_formation database table.
 * 
 */
@Entity
@Table(name="bilan_formation")
@NamedQuery(name="BilanFormation.findAll", query="SELECT b FROM BilanFormation b")
public class BilanFormation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_bilan_formation")
	private int idBilanFormation;

	@Lob
	@Column(name="besoin_formation_complementaire")
	private String besoinFormationComplementaire;

	@Lob
	@Column(name="observations_diverses")
	private String observationsDiverses;

	@Lob
	@Column(name="points_faibles_du_stage")
	private String pointsFaiblesDuStage;

	@Lob
	@Column(name="points_forts_du_stage")
	private String pointsFortsDuStage;

	@Column(name="satisfaction_globale")
	private int satisfactionGlobale;

	//uni-directional many-to-one association to Formateur
	@ManyToOne
	@JoinColumn(name="id_formateur")
	private Formateur formateur;

	//uni-directional many-to-one association to SessionFormation
	@ManyToOne
	@JoinColumn(name="id_session_formation")
	private SessionFormation sessionFormation;

	//uni-directional many-to-one association to Stagiaire
	@ManyToOne
	@JoinColumn(name="id_stagiaire")
	private Stagiaire stagiaire;

	public BilanFormation() {
	}

	public int getIdBilanFormation() {
		return this.idBilanFormation;
	}

	public void setIdBilanFormation(int idBilanFormation) {
		this.idBilanFormation = idBilanFormation;
	}

	public String getBesoinFormationComplementaire() {
		return this.besoinFormationComplementaire;
	}

	public void setBesoinFormationComplementaire(String besoinFormationComplementaire) {
		this.besoinFormationComplementaire = besoinFormationComplementaire;
	}

	public String getObservationsDiverses() {
		return this.observationsDiverses;
	}

	public void setObservationsDiverses(String observationsDiverses) {
		this.observationsDiverses = observationsDiverses;
	}

	public String getPointsFaiblesDuStage() {
		return this.pointsFaiblesDuStage;
	}

	public void setPointsFaiblesDuStage(String pointsFaiblesDuStage) {
		this.pointsFaiblesDuStage = pointsFaiblesDuStage;
	}

	public String getPointsFortsDuStage() {
		return this.pointsFortsDuStage;
	}

	public void setPointsFortsDuStage(String pointsFortsDuStage) {
		this.pointsFortsDuStage = pointsFortsDuStage;
	}

	public int getSatisfactionGlobale() {
		return this.satisfactionGlobale;
	}

	public void setSatisfactionGlobale(int satisfactionGlobale) {
		this.satisfactionGlobale = satisfactionGlobale;
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

	public Stagiaire getStagiaire() {
		return this.stagiaire;
	}

	public void setStagiaire(Stagiaire stagiaire) {
		this.stagiaire = stagiaire;
	}

}