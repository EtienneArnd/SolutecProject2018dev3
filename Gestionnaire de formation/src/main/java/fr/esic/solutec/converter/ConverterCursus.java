package fr.esic.solutec.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;
import fr.esic.solutec.dto.DtoCursus;
import fr.esic.solutec.entities.Cursus;

@FacesConverter("cursusConverter")
public class ConverterCursus implements Converter {
	
	public String getAsString(FacesContext ctxt, UIComponent cmpt, Object value) throws ConverterException 
	{ 
		Cursus cursus = (Cursus) value;
		return  String.valueOf(cursus.getIdCursus());
	}
	
	public Object getAsObject(FacesContext ctxt, UIComponent c,String value) throws ConverterException 
	{
		return DtoCursus.getCursus(Integer.parseInt(value));
	}

}
