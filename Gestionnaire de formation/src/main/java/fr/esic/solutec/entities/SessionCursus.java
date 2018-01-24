package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the session_cursus database table.
 * 
 */
@Entity
@Table(name="session_cursus")
@NamedQuery(name="SessionCursus.findAll", query="SELECT s FROM SessionCursus s")
public class SessionCursus implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_session_cursus")
	private int idSessionCursus;

	@Temporal(TemporalType.DATE)
	@Column(name="date_debut")
	private Date dateDebut;

	private String nom;

	//uni-directional many-to-one association to Contact
	@ManyToOne
	@JoinColumn(name="id_contact")
	private Contact contact;

	//uni-directional many-to-one association to Cursus
	@ManyToOne
	@JoinColumn(name="id_cursus")
	private Cursus cursus;

	public SessionCursus() {
	}

	public int getIdSessionCursus() {
		return this.idSessionCursus;
	}

	public void setIdSessionCursus(int idSessionCursus) {
		this.idSessionCursus = idSessionCursus;
	}

	public Date getDateDebut() {
		return this.dateDebut;
	}

	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Contact getContact() {
		return this.contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public Cursus getCursus() {
		return this.cursus;
	}

	public void setCursus(Cursus cursus) {
		this.cursus = cursus;
	}

}