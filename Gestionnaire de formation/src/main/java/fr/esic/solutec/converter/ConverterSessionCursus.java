package fr.esic.solutec.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;
import fr.esic.solutec.dto.DtoSessionCursus;
import fr.esic.solutec.entities.SessionCursus;

@FacesConverter("sessionCursusConverter")
public class ConverterSessionCursus implements Converter {
	
	public String getAsString(FacesContext ctxt, UIComponent cmpt, Object value) throws ConverterException 
	{ 
		SessionCursus sessionCursus = (SessionCursus) value;
		return  String.valueOf(sessionCursus.getIdSessionCursus());
	}
	
	public Object getAsObject(FacesContext ctxt, UIComponent c,String value) throws ConverterException 
	{
		return DtoSessionCursus.getSessionCursus(Integer.parseInt(value));
	}

}
