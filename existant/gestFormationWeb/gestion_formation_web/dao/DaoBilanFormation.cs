using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoBilanFormation : Dao
    {

        public static bilan_formation Get(int id_BilanFromation)
        {
            return ctxt.bilan_formation.SingleOrDefault(bf => bf.id_bilan_formation == id_BilanFromation);
        }
        
    }
}