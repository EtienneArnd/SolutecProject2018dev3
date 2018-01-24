package fr.esic.solutec.entities;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the formation_cursus database table.
 * 
 */
@Embeddable
public class FormationCursusPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="id_cursus", insertable=false, updatable=false)
	private int idCursus;

	@Column(name="id_formation", insertable=false, updatable=false)
	private int idFormation;

	public FormationCursusPK() {
	}
	public int getIdCursus() {
		return this.idCursus;
	}
	public void setIdCursus(int idCursus) {
		this.idCursus = idCursus;
	}
	public int getIdFormation() {
		return this.idFormation;
	}
	public void setIdFormation(int idFormation) {
		this.idFormation = idFormation;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof FormationCursusPK)) {
			return false;
		}
		FormationCursusPK castOther = (FormationCursusPK)other;
		return 
			(this.idCursus == castOther.idCursus)
			&& (this.idFormation == castOther.idFormation);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.idCursus;
		hash = hash * prime + this.idFormation;
		
		return hash;
	}
}