package fr.esic.solutec.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;
import fr.esic.solutec.dto.DtoSalle;
import fr.esic.solutec.entities.Salle;

@FacesConverter("salleConverter")
public class ConverterSalle implements Converter {
	
	public String getAsString(FacesContext ctxt, UIComponent cmpt, Object value) throws ConverterException 
	{ 
		Salle salle = (Salle) value;
		return  String.valueOf(salle.getIdSalle());
	}
	
	public Object getAsObject(FacesContext ctxt, UIComponent c,String value) throws ConverterException 
	{
		return DtoSalle.getSalle(Integer.parseInt(value));
	}

}
