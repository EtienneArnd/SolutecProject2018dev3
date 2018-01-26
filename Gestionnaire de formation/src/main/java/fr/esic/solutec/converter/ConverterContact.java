package fr.esic.solutec.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;
import fr.esic.solutec.dto.DtoContact;
import fr.esic.solutec.entities.Contact;

@FacesConverter("contactConverter")
public class ConverterContact implements Converter {
	
	public String getAsString(FacesContext ctxt, UIComponent cmpt, Object value) throws ConverterException 
	{ 
		Contact contact = (Contact) value;
		return  String.valueOf(contact.getIdContact());
	}
	
	public Object getAsObject(FacesContext ctxt, UIComponent c,String value) throws ConverterException 
	{
		return DtoContact.getContact(Integer.parseInt(value));
	}

}
