package fr.esic.solutec.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class Dao {

	static EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("gestionnaire-de-formation") ;
	protected static EntityManager entityManager = entityManagerFactory.createEntityManager();
	
	
	public void close() {
		entityManager.close();
		entityManagerFactory.close();
	}
	
	public static String[] getEnumValues(String nomTable, String nomColonne)
    {
        /* Cette Methode permet d'obtenir le type d'une colonne d'une table  */
		Query query = entityManager.createNativeQuery("select  COLUMN_TYPE from information_schema.columns where table_name = '"+ nomTable + "' AND COLUMN_NAME = '"+nomColonne+"'");
        
		String result = (String)query.getSingleResult();
		
		
		
		String enumValues = result.substring(result.indexOf("(") + 1, result.indexOf(")"));
        enumValues = enumValues.replace("'", "");
        String[] valeurs = enumValues.split(",");
        return valeurs;
    }
	
}
