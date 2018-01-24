package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the formateur_session_formation database table.
 * 
 */
@Embeddable
public class FormateurSessionFormationPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="id_formateur", insertable=false, updatable=false)
	private int idFormateur;

	@Column(name="id_session_formation", insertable=false, updatable=false)
	private int idSessionFormation;

	public FormateurSessionFormationPK() {
	}
	public int getIdFormateur() {
		return this.idFormateur;
	}
	public void setIdFormateur(int idFormateur) {
		this.idFormateur = idFormateur;
	}
	public int getIdSessionFormation() {
		return this.idSessionFormation;
	}
	public void setIdSessionFormation(int idSessionFormation) {
		this.idSessionFormation = idSessionFormation;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof FormateurSessionFormationPK)) {
			return false;
		}
		FormateurSessionFormationPK castOther = (FormateurSessionFormationPK)other;
		return 
			(this.idFormateur == castOther.idFormateur)
			&& (this.idSessionFormation == castOther.idSessionFormation);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.idFormateur;
		hash = hash * prime + this.idSessionFormation;
		
		return hash;
	}
}