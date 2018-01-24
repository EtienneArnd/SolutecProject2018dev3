package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the formation database table.
 * 
 */
@Entity
@NamedQueries({
	@NamedQuery(name="Formation.findAll", query="SELECT a FROM Formation a")//,
	//@NamedQuery(name="Formation.add", query="INSERT INTO Formation VALUES  a")
})
public class Formation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_formation")
	private int idFormation;

	private int duree;

	private String intitule;

	private String niveau;

	@Column(name="tarif_inter")
	private BigDecimal tarifInter;

	@Column(name="tarif_intra")
	private BigDecimal tarifIntra;

	//uni-directional many-to-one association to Theme
	@ManyToOne
	@JoinColumn(name="id_theme")
	private Theme theme;

	public Formation() {
	}

	public int getIdFormation() {
		return this.idFormation;
	}

	public void setIdFormation(int idFormation) {
		this.idFormation = idFormation;
	}

	public int getDuree() {
		return this.duree;
	}

	public void setDuree(int duree) {
		this.duree = duree;
	}

	public String getIntitule() {
		return this.intitule;
	}

	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}

	public String getNiveau() {
		return this.niveau;
	}

	public void setNiveau(String niveau) {
		this.niveau = niveau;
	}

	public BigDecimal getTarifInter() {
		return this.tarifInter;
	}

	public void setTarifInter(BigDecimal tarifInter) {
		this.tarifInter = tarifInter;
	}

	public BigDecimal getTarifIntra() {
		return this.tarifIntra;
	}

	public void setTarifIntra(BigDecimal tarifIntra) {
		this.tarifIntra = tarifIntra;
	}

	public Theme getTheme() {
		return this.theme;
	}

	public void setTheme(Theme theme) {
		this.theme = theme;
	}

	@Override
	public String toString() {
		return "Formation [idFormation=" + idFormation + ", duree=" + duree + ", intitule=" + intitule + ", niveau="
				+ niveau + ", tarifInter=" + tarifInter + ", tarifIntra=" + tarifIntra + ", theme=" + theme + "]";
	}

	
}