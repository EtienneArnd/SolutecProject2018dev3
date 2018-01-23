using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoSalle : Dao
    {
        public static salle Get(int id_Salle)
        {
            return ctxt.salle.SingleOrDefault(s => s.id_salle == id_Salle);
        }
    }
}