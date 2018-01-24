package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the cursus database table.
 * 
 */
@Entity
@NamedQuery(name="Cursus.findAll", query="SELECT c FROM Cursus c")
public class Cursus implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_cursus")
	private int idCursus;

	private String nom;

	private BigDecimal tarif;

	public Cursus() {
	}

	public int getIdCursus() {
		return this.idCursus;
	}

	public void setIdCursus(int idCursus) {
		this.idCursus = idCursus;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public BigDecimal getTarif() {
		return this.tarif;
	}

	public void setTarif(BigDecimal tarif) {
		this.tarif = tarif;
	}

}