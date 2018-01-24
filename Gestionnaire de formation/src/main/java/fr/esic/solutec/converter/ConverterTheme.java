package fr.esic.solutec.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;

import fr.esic.solutec.beans.BeanTheme;
import fr.esic.solutec.dto.DtoFormation;
import fr.esic.solutec.dto.DtoTheme;
import fr.esic.solutec.entities.Theme;

@FacesConverter("themeConverter")
public class ConverterTheme implements Converter {
	
	public String getAsString(FacesContext ctxt, UIComponent cmpt, Object value) throws ConverterException 
	{ 
		Theme theme = (Theme) value;
		return  String.valueOf(theme.getIdTheme());
	}
	
	public Object getAsObject(FacesContext ctxt, UIComponent c,String value) throws ConverterException 
	{
		return DtoTheme.getTheme(Integer.parseInt(value));
	}

}
