using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoBilanEvalFormation : Dao
    {

        public static bilan_eval_formation Get(int id_BilanEvalFromation)
        {
            return ctxt.bilan_eval_formation.SingleOrDefault(bef => bef.id_bilan_eval_formation == id_BilanEvalFromation);
        }
    }
}