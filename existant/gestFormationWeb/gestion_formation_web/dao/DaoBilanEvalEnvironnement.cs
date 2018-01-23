using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoBilanEvalEnvironnement : Dao
    {

        public static bilan_eval_environnement Get(int id_BilanEvalEnvironnement)
        {
            return ctxt.bilan_eval_environnement.SingleOrDefault(bee => bee.id_bilan_eval_environnement == id_BilanEvalEnvironnement);
        }

    }
}