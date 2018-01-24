package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the stagiaire_session_formation database table.
 * 
 */
@Embeddable
public class StagiaireSessionFormationPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="id_stagiaire", insertable=false, updatable=false)
	private int idStagiaire;

	@Column(name="id_session_formation", insertable=false, updatable=false)
	private int idSessionFormation;

	public StagiaireSessionFormationPK() {
	}
	public int getIdStagiaire() {
		return this.idStagiaire;
	}
	public void setIdStagiaire(int idStagiaire) {
		this.idStagiaire = idStagiaire;
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
		if (!(other instanceof StagiaireSessionFormationPK)) {
			return false;
		}
		StagiaireSessionFormationPK castOther = (StagiaireSessionFormationPK)other;
		return 
			(this.idStagiaire == castOther.idStagiaire)
			&& (this.idSessionFormation == castOther.idSessionFormation);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.idStagiaire;
		hash = hash * prime + this.idSessionFormation;
		
		return hash;
	}
}