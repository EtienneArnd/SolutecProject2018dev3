package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the bilan_eval_environnement database table.
 * 
 */
@Entity
@Table(name="bilan_eval_environnement")
@NamedQuery(name="BilanEvalEnvironnement.findAll", query="SELECT b FROM BilanEvalEnvironnement b")
public class BilanEvalEnvironnement implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_bilan_eval_environnement")
	private int idBilanEvalEnvironnement;

	private int accueil;

	private int environnement;

	@Column(name="materiel_informatique")
	private int materielInformatique;

	@Column(name="support_cours")
	private int supportCours;

	//uni-directional many-to-one association to BilanFormation
	@ManyToOne
	@JoinColumn(name="id_bilan_formation")
	private BilanFormation bilanFormation;

	public BilanEvalEnvironnement() {
	}

	public int getIdBilanEvalEnvironnement() {
		return this.idBilanEvalEnvironnement;
	}

	public void setIdBilanEvalEnvironnement(int idBilanEvalEnvironnement) {
		this.idBilanEvalEnvironnement = idBilanEvalEnvironnement;
	}

	public int getAccueil() {
		return this.accueil;
	}

	public void setAccueil(int accueil) {
		this.accueil = accueil;
	}

	public int getEnvironnement() {
		return this.environnement;
	}

	public void setEnvironnement(int environnement) {
		this.environnement = environnement;
	}

	public int getMaterielInformatique() {
		return this.materielInformatique;
	}

	public void setMaterielInformatique(int materielInformatique) {
		this.materielInformatique = materielInformatique;
	}

	public int getSupportCours() {
		return this.supportCours;
	}

	public void setSupportCours(int supportCours) {
		this.supportCours = supportCours;
	}

	public BilanFormation getBilanFormation() {
		return this.bilanFormation;
	}

	public void setBilanFormation(BilanFormation bilanFormation) {
		this.bilanFormation = bilanFormation;
	}

}