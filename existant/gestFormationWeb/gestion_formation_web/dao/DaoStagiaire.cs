using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoStagiaire : Dao
    {
        public static stagiaire Get(int id_Stagiaire)
        {
            return ctxt.stagiaire.SingleOrDefault(s => s.id_stagiaire == id_Stagiaire);
        }
    }
}