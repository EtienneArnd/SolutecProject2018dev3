using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoPersonnel : Dao
    {
        public static personnel Get(int id_Personnel)
        {
            return ctxt.personnel.SingleOrDefault(p => p.id_personnel == id_Personnel);
        }
    
    }
}