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
        public static IEnumerable<bilan_eval_formation> GetEvalformation(int idBilanFormation)
        {
            if (idBilanFormation == 0)
            {
                return new List<bilan_eval_formation>();
            }
            return ctxt.bilan_eval_formation.Where(bef => bef.bilan_formation.id_bilan_formation == idBilanFormation).ToList();
        }
    }
}