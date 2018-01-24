package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the session_formation database table.
 * 
 */
@Entity
@Table(name="session_formation")
@NamedQuery(name="SessionFormation.findAll", query="SELECT s FROM SessionFormation s")
public class SessionFormation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_session_formation")
	private int idSessionFormation;

	@Temporal(TemporalType.DATE)
	@Column(name="date_debut")
	private Date dateDebut;

	@Temporal(TemporalType.DATE)
	@Column(name="date_fin")
	private Date dateFin;

	private int ordre;

	@Column(name="tarif_intra")
	private BigDecimal tarifIntra;

	private String type;

	//uni-directional many-to-one association to Formation
	@ManyToOne
	@JoinColumn(name="id_formation")
	private Formation formation;

	//uni-directional many-to-one association to Salle
	@ManyToOne
	@JoinColumn(name="id_salle")
	private Salle salle;

	//uni-directional many-to-one association to SessionCursus
	@ManyToOne
	@JoinColumn(name="id_session_cursus")
	private SessionCursus sessionCursus;

	//uni-directional many-to-many association to Contact
	@ManyToMany
	@JoinTable(
		name="suivi"
		, joinColumns={
			@JoinColumn(name="id_session_formation")
			}
		, inverseJoinColumns={
			@JoinColumn(name="id_contact")
			}
		)
	private List<Contact> contacts;

	public SessionFormation() {
	}

	public int getIdSessionFormation() {
		return this.idSessionFormation;
	}

	public void setIdSessionFormation(int idSessionFormation) {
		this.idSessionFormation = idSessionFormation;
	}

	public Date getDateDebut() {
		return this.dateDebut;
	}

	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}

	public Date getDateFin() {
		return this.dateFin;
	}

	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}

	public int getOrdre() {
		return this.ordre;
	}

	public void setOrdre(int ordre) {
		this.ordre = ordre;
	}

	public BigDecimal getTarifIntra() {
		return this.tarifIntra;
	}

	public void setTarifIntra(BigDecimal tarifIntra) {
		this.tarifIntra = tarifIntra;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Formation getFormation() {
		return this.formation;
	}

	public void setFormation(Formation formation) {
		this.formation = formation;
	}

	public Salle getSalle() {
		return this.salle;
	}

	public void setSalle(Salle salle) {
		this.salle = salle;
	}

	public SessionCursus getSessionCursus() {
		return this.sessionCursus;
	}

	public void setSessionCursus(SessionCursus sessionCursus) {
		this.sessionCursus = sessionCursus;
	}

	public List<Contact> getContacts() {
		return this.contacts;
	}

	public void setContacts(List<Contact> contacts) {
		this.contacts = contacts;
	}

}