using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoBilanEvalFormateur : Dao
    {

        public static bilan_eval_formateur Get(int id_BilanEvalFormateur)
        {
            return ctxt.bilan_eval_formateur.SingleOrDefault(bef => bef.id_bilan_formateur == id_BilanEvalFormateur);
        }
    
    }
}