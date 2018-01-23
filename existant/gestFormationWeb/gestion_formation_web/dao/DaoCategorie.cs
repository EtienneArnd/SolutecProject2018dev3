using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoCategorie : Dao
    {
        public static categorie Get(int id_Categorie)
        {
            return ctxt.categorie.SingleOrDefault(c => c.id_categorie == id_Categorie);
        }
    }
}