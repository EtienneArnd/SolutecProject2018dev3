package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the identificateur database table.
 * 
 */
@Entity
@NamedQuery(name="Identificateur.findAll", query="SELECT i FROM Identificateur i")
public class Identificateur implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_identificateur")
	private int idIdentificateur;

	private boolean actif;

	private String login;

	private String password;

	private String profil;

	public Identificateur() {
	}

	public int getIdIdentificateur() {
		return this.idIdentificateur;
	}

	public void setIdIdentificateur(int idIdentificateur) {
		this.idIdentificateur = idIdentificateur;
	}

	public boolean getActif() {
		return this.actif;
	}

	public void setActif(boolean actif) {
		this.actif = actif;
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfil() {
		return this.profil;
	}

	public void setProfil(String profil) {
		this.profil = profil;
	}

}