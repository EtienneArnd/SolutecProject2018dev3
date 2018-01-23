using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoIdentificateur : Dao
    {
        public static identificateur Get(int id_Identificateur)
        {
            return ctxt.identificateur.SingleOrDefault(i => i.id_identificateur == id_Identificateur);
        }
    }
}