using System;
using System.Collections.Generic;
using System.Linq;



namespace gestion_formation_web.dao
{
    public class DaoFormation : Dao
    {
        public static formation Get(int idFormation)
    {
        return ctxt.formation.SingleOrDefault(cs => cs.id_formation == idFormation);
    }

        public static formation Add(formation uneformation)
        {
            return ctxt.formation.Add(uneformation);
        }
    }
}


