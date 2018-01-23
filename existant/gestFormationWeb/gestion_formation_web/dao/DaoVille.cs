using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoVille : Dao
    {
        public static ville Get(int id_Ville)
        {
            return ctxt.ville.SingleOrDefault(v => v.id_ville == id_Ville);
        }
    }
}