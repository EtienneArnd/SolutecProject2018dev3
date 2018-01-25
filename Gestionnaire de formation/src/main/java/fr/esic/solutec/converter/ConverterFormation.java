package fr.esic.solutec.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;
import fr.esic.solutec.dto.DtoFormation;
import fr.esic.solutec.entities.Formation;

@FacesConverter("formationConverter")
public class ConverterFormation implements Converter {
	
	public String getAsString(FacesContext ctxt, UIComponent cmpt, Object value) throws ConverterException 
	{ 
		Formation formation = (Formation) value;
		return  String.valueOf(formation.getIdFormation());
	}
	
	public Object getAsObject(FacesContext ctxt, UIComponent c,String value) throws ConverterException 
	{
		return DtoFormation.getFormation(Integer.parseInt(value));
	}

}
