using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoEquipement : Dao
    {
        public static equipement Get(int id_Equîpement)
        {
            return ctxt.equipement.SingleOrDefault(e => e.id_equipement == id_Equîpement);
        }
    }
}